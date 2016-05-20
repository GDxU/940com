package com.vinbet.mobile.sys.jms;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.ExceptionListener;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.QueueBrowser;
import javax.jms.Session;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.apache.log4j.Logger;
import org.springframework.jms.core.BrowserCallback;
import org.springframework.jms.core.ProducerCallback;


/**
 * JMS 集群管理器
 * @author Liu ping
 */

public class JmsClusterMgr {

	public static final String EXPIRED_TIME = "expiredTime";

	private JmsCluster jmsCluster;

	private int brokerNum;
	private List<JmsBroker> jmsBrokerList;

	public void init() {
		jmsBrokerList = jmsCluster.getJmsBrokerList();
		brokerNum = jmsBrokerList.size();
	}

	private JmsBroker getJmsBroker() {
		JmsBroker jmsBroker = null;
		int random = (int) (Math.random() * 10);
		jmsBroker = jmsBrokerList.get(random % brokerNum);
		if (jmsBroker.isNormalWork()) {
			return jmsBroker;
		}
		// 随机选中直失败后，按顺序选择第一个可用的broker
		for (int i = 0; i < brokerNum; i++) {
			jmsBroker = jmsBrokerList.get(i);
			if (jmsBroker.isNormalWork()) {
				return jmsBroker;
			}
		}
		// 整个集群崩溃，返回null
		return null;
	}

	/**
	 * 普�?消息发�?
	 * 
	 * @param msg
	 * @param msgPropertyMap 消息对象 注意：消息对象没有提供Integer类型处理，如果需要Object值赋值null即可
	 * @return 0:发�?失败�?：发送成�?
	 */
	private int sendNormalMsg(final Object msg, final boolean queue, final String destName, final boolean persitent, final Map<String, Object> msgPropertyMap) {
		JmsBroker jmsBroker = null;

		for (int i = 0; i < brokerNum; i++) {
			try {
				jmsBroker = this.getJmsBroker();
				if (jmsBroker == null) {
					//logger.warn("JMS 集群中没有可用broker");
					return 0;
				}

				jmsBroker.getJmsTemplate().execute(new ProducerCallback() {
					public Object doInJms(Session arg0, MessageProducer arg1) throws JMSException {
						Message message = null;
						long expiredTime = -1;

						if (msg instanceof java.lang.String) {
							message = arg0.createTextMessage((String) msg);
						} else {
							message = arg0.createObjectMessage((Serializable) msg);
						}

						if (msgPropertyMap != null) {
							// 如果有，处理消息参数，处理完参数�?��立即从map移除该参数，便于后续仅留下消息属�?
							Object expiredTimeObj = msgPropertyMap.get(JmsClusterMgr.EXPIRED_TIME);
							if (expiredTimeObj != null) {
								expiredTime = ((Long) expiredTimeObj).longValue();
								msgPropertyMap.remove(JmsClusterMgr.EXPIRED_TIME);
							}
							// 如果有，处理消息属�? （需要处理Integer类型，Object赋�?null即可�?
							if (!msgPropertyMap.isEmpty()) {
								Iterator<Entry<String, Object>> iter = msgPropertyMap.entrySet().iterator();
								while (iter.hasNext()) {
									Map.Entry<String, Object> entry = (Map.Entry<String, Object>) iter.next();
									if (entry.getValue() instanceof java.lang.String) {
										message.setStringProperty(entry.getKey(), (String) entry.getValue());
									} else if (entry.getValue() instanceof java.lang.Long) {
										message.setLongProperty(entry.getKey(), (Long) entry.getValue());
									} else if (entry.getValue() instanceof java.lang.Boolean) {
										message.setBooleanProperty(entry.getKey(), (Boolean) entry.getValue());
									} else if (entry.getValue() instanceof java.lang.Double) {
										message.setDoubleProperty(entry.getKey(), (Double) entry.getValue());
									}
								}
							}
						}

						if (expiredTime > 0) {
							arg1.send(queue ? arg0.createQueue(destName) : arg0.createTopic(destName), message, persitent ? DeliveryMode.PERSISTENT : DeliveryMode.NON_PERSISTENT,
									Message.DEFAULT_PRIORITY, expiredTime);
						} else {
							arg1.setDeliveryMode(persitent ? DeliveryMode.PERSISTENT : DeliveryMode.NON_PERSISTENT);
							arg1.send(queue ? arg0.createQueue(destName) : arg0.createTopic(destName), message);
						}
						return null;
					}
				});

				break;
			} catch (Exception e) {
				if (e instanceof java.lang.NullPointerException || e instanceof java.lang.ClassCastException) {
					//logger.error("发�?消息出现异常" + e.toString() + "，忽略该消息");
					break;
				}
				synchronized (jmsBroker) {
					jmsBroker.setNormalWork(false);
				}
				// 扔出线程,不断�?��损坏的节�?如果修复,即时修改状�?,便于后续加入集群�?
				new SenderResumeThread(jmsBroker).start();
				ActiveMQConnectionFactory acf = (ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory();
				//logger.error("JMS集群节点 " + acf.getBrokerURL() + " 出现异常�? + e.toString() + " , 修复线程已启�?, e);
			}
		}
		return 1;

	}

	/**
	 * 发�?p2p非持久化消息
	 * 
	 * @param queueName p2p队列名称
	 * @param msg xml消息
	 * @return
	 */
	public int sendQueueMsg(String queueName, Object msg) {
		return this.sendNormalMsg(msg, true, queueName, false, null);
	}

	public int sendQueueMsg(String queueName, Object msg, Map<String, Object> msgPropertyMap) {
		return this.sendNormalMsg(msg, true, queueName, false, msgPropertyMap);
	}

	/**
	 * 发�?p2p持久化消�?
	 * 
	 * @param queueName p2p队列名称
	 * @param msg xml消息
	 * @return
	 */
	public int sendPstQueueMsg(String queueName, Object msg) {
		return this.sendNormalMsg(msg, true, queueName, true, null);
	}

	public int sendPstQueueMsg(String queueName, Object msg, Map<String, Object> msgPropertyMap) {
		return this.sendNormalMsg(msg, true, queueName, true, msgPropertyMap);
	}

	/**
	 * 发�?PubSub非持久化消息
	 * 
	 * @param topicName pubSub主题名称
	 * @param msg xml消息
	 * @return
	 */
	public int sendTopicMsg(String topicName, Object msg) {
		return this.sendNormalMsg(msg, false, topicName, false, null);
	}

	/**
	 * 发�?PubSub非持久化消息，带消息属�?
	 * 
	 * @param topicName pubSub主题名称
	 * @param msg xml消息
	 * @param msgPropertyMap 消息属�?，消息属性�?支持String,Long,Boolean,Double
	 * @return
	 */
	public int sendTopicMsg(String topicName, Object msg, Map<String, Object> msgPropertyMap) {
		return this.sendNormalMsg(msg, false, topicName, false, msgPropertyMap);
	}

	/**
	 * 发�?PubSub持久化消�?
	 * 
	 * @param topicName pubSub主题名称
	 * @param msg xml消息
	 * @return
	 */
	public int sendPstTopicMsg(String topicName, Object msg) {
		return this.sendNormalMsg(msg, false, topicName, true, null);
	}

	/**
	 * 发�?PubSub持久化消息，带消息属�?
	 * 
	 * @param topicName pubSub主题名称
	 * @param msg xml消息
	 * @param msgPropertyMap 消息属�?，消息属性�?支持String,Long,Boolean,Double
	 * @return
	 */
	public int sendPstTopicMsg(String topicName, Object msg, Map<String, Object> msgPropertyMap) {
		return this.sendNormalMsg(msg, false, topicName, true, msgPropertyMap);
	}

	// 发�?端修复线�?
	class SenderResumeThread extends Thread {

		private JmsBroker jmsBroker;

		public SenderResumeThread(JmsBroker jmsBroker) {
			this.jmsBroker = jmsBroker;
		}

		@Override
		public void run() {
			while (true) {
				try {
					jmsBroker.getJmsTemplate().browse(new BrowserCallback() {
						public Object doInJms(Session arg0, QueueBrowser arg1) throws JMSException {
							arg1.getQueue();
							return null;
						}
					});
					synchronized (jmsBroker) {
						jmsBroker.setNormalWork(true);
					}
					ActiveMQConnectionFactory acf = (ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory();
					//logger.info("已修复JMS Broker " + acf.getBrokerURL() + " , 已经加入集群");
					break;
				} catch (Exception e) {
					synchronized (jmsBroker) {
						try {
							jmsBroker.wait(1000L * 10);
						} catch (Exception e2) {
						}
					}
				}

			}
		}

	}

	/**
	 * 针对某个Desnation注册JMS集群的消息监�?
	 * 
	 * @param destName
	 * @param messageListener
	 * @return 注册成功的集群节点个�?
	 */
	private int registClusterListener(String clientId, boolean queue, String destNameWithParam, String messageSelector, MessageListener messageListener) {
		int ret = 0;
		JmsBroker jmsBroker = null;
		Connection conn = null;

		for (int i = 0; i < brokerNum; i++) {
			try {
				jmsBroker = jmsBrokerList.get(i);
				conn = getNewConn((ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory());

				jmsBroker.getConnMap().put(destNameWithParam, conn);
				jmsBroker.getMessageListenerMap().put(destNameWithParam, messageListener);

				if (clientId != null) {
					conn.setClientID(clientId);
					if (!queue) {
						jmsBroker.getDurableTopicClientIdMap().put(destNameWithParam, clientId);
					}
				}

				Session se = conn.createSession(false, Session.CLIENT_ACKNOWLEDGE);
				MessageConsumer messageConsumer = null;
				if (clientId != null && !queue) {
					if (messageSelector == null) {
						messageConsumer = se.createDurableSubscriber(new ActiveMQTopic(destNameWithParam), clientId);
					} else {
						messageConsumer = se.createDurableSubscriber(new ActiveMQTopic(destNameWithParam), clientId, messageSelector, true);
					}
				} else {
					if (messageSelector == null) {
						messageConsumer = se.createConsumer(queue ? new ActiveMQQueue(destNameWithParam) : new ActiveMQTopic(destNameWithParam));
					} else {
						messageConsumer = se.createConsumer(queue ? new ActiveMQQueue(destNameWithParam) : new ActiveMQTopic(destNameWithParam), messageSelector);
					}
				}
				messageConsumer.setMessageListener(messageListener);

				conn.setExceptionListener(new ConnExceptionListener(jmsBroker, queue, destNameWithParam));
				conn.start();
				ret++;
			} catch (Exception e) {
				new ReceiverResumeThread(jmsBroker, queue, destNameWithParam).start();
				//logger.error("注册JMS集群节点�? + e.toString() + " , 失败，监听修复线程已启动");
			}
		}

		//logger.info("对JMS集群中所有Broker注册Destination " + destNameWithParam + " 的监听器完毕，该Destination成功注册�?" + ret + " 个监听器");
		return ret;
	}

	// 监听端修复线�?
	class ReceiverResumeThread extends Thread {

		private JmsBroker jmsBroker;
		private boolean queue;
		private String destNameWithParam;

		public ReceiverResumeThread(JmsBroker jmsBroker, boolean queue, String destNameWithParam) {
			this.jmsBroker = jmsBroker;
			this.queue = queue;
			this.destNameWithParam = destNameWithParam;
		}

		@Override
		public void run() {
			Connection conn = null;
			String clientId = jmsBroker.getDurableTopicClientIdMap().get(destNameWithParam);
			while (true) {
				try {
					conn = getNewConn((ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory());
					if (clientId != null) {
						conn.setClientID(clientId);
					}
					jmsBroker.getConnMap().put(destNameWithParam, conn);

					Session se = conn.createSession(false, Session.CLIENT_ACKNOWLEDGE);
					MessageConsumer messageConsumer = null;
					if (clientId != null) {
						messageConsumer = se.createDurableSubscriber(new ActiveMQTopic(destNameWithParam), clientId);
					} else {
						messageConsumer = se.createConsumer(queue ? new ActiveMQQueue(destNameWithParam) : new ActiveMQTopic(destNameWithParam));
					}

					messageConsumer.setMessageListener(jmsBroker.getMessageListenerMap().get(destNameWithParam));

					conn.setExceptionListener(new ConnExceptionListener(jmsBroker, queue, destNameWithParam));
					conn.start();

					ActiveMQConnectionFactory acf = (ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory();
					//logger.info("已修复对JMS Borker " + acf.getBrokerURL() + " 中Destination " + destNameWithParam + " 的监�?);
					break;
				} catch (Exception e) {
					synchronized (jmsBroker) {
						try {
							jmsBroker.wait(1000L * 10);
						} catch (Exception e2) {
						}
					}
				}

			}
		}

	}

	// 监听异常处理
	class ConnExceptionListener implements ExceptionListener {

		private JmsBroker jmsBroker;
		private boolean queue;
		private String destNameWithParam;

		public ConnExceptionListener(JmsBroker jmsBroker, boolean queue, String destNameWithParam) {
			this.jmsBroker = jmsBroker;
			this.queue = queue;
			this.destNameWithParam = destNameWithParam;
		}

		public void onException(JMSException exception) {
			try {
				jmsBroker.getConnMap().get(destNameWithParam).close();
			} catch (Exception e) {
			}
			// 启动监听修复线程
			new ReceiverResumeThread(jmsBroker, queue, destNameWithParam).start();
			ActiveMQConnectionFactory acf = (ActiveMQConnectionFactory) jmsBroker.getJmsFactory().getConnectionFactory();
			//logger.error("JMS集群节点�? + acf.getBrokerURL() + " 上对Destination " + destNameWithParam + " 的监听器出现故障" + exception.toString() + "，监听修复线程已启动");
		}
	}

	/**
	 * 注册集群中指定p2p的监听，系统初始化调�?
	 * 
	 * @param queueNameWithParam，可带参数的队列名称，�?常就是一个单纯的队列�?
	 * @param messageListener
	 * @return
	 */
	public int registClusterQueueListener(String queueNameWithParam, MessageListener messageListener) {
		return this.registClusterListener(null, true, queueNameWithParam, null, messageListener);
	}

	public int registClusterQueueListener(String clientId, String queueNameWithParam, MessageListener messageListener) {
		return this.registClusterListener(clientId, true, queueNameWithParam, null, messageListener);
	}

	/**
	 * 注册集群中指定PubSub的非持久监听，系统初始化调用
	 * 
	 * @param topicNameWithParam，可带参数的队列名称，�?常就是一个单纯的队列�?
	 * @param messageListener
	 * @return
	 */
	public int registClusterTopicListener(String topicNameWithParam, MessageListener messageListener) {
		return this.registClusterListener(null, false, topicNameWithParam, null, messageListener);
	}

	/**
	 * 注册集群中指定PubSub的非持久监听，带消息选择器，系统初始化调�?
	 * 
	 * @param topicNameWithParam，可带参数的队列名称，�?常就是一个单纯的队列�?
	 * @param messageSelector 消息选择器表达式，如果不�?��请调用上面的方法
	 * @param messageListener
	 * @return
	 */
	public int registClusterTopicListener(String topicNameWithParam, String messageSelector, MessageListener messageListener) {
		return this.registClusterListener(null, false, topicNameWithParam, messageSelector, messageListener);
	}

	/**
	 * 注册集群中指定PubSub的持久�?监听，系统初始化调用
	 * 
	 * @param uniqueClientId，消费端标示，必须在整个集群唯一
	 * @param topicNameWithParam，可带参数的队列名称，�?常就是一个单纯的队列�?
	 * @param messageListener
	 * @return
	 */
	public int registClusterDurableTopicListener(String uniqueClientId, String topicNameWithParam, MessageListener messageListener) {
		return this.registClusterListener(uniqueClientId, false, topicNameWithParam, null, messageListener);
	}

	/**
	 * 注册集群中指定PubSub的持久�?监听，带消息选择�?, 系统初始化调�?
	 * 
	 * @param uniqueClientId，消费端标示，必须在整个集群唯一
	 * @param topicNameWithParam，可带参数的队列名称，�?常就是一个单纯的队列�?
	 * @param messageSelector 消息选择器表达式，如果不�?��请调用上面的方法
	 * @param messageListener
	 * @return
	 */
	public int registClusterDurableTopicListener(String uniqueClientId, String topicNameWithParam, String messageSelector, MessageListener messageListener) {
		return this.registClusterListener(uniqueClientId, false, topicNameWithParam, messageSelector, messageListener);
	}

	/**
	 * �?���?��的JMS监听，系统关闭时调用
	 */
	public void unregistClusterListener() {
		Connection conn = null;
		Map<String, Connection> connMap = null;
		Iterator<String> destNameWithParamIter = null;
		String destNameWithParam = null;
		for (JmsBroker jmsBroker : jmsBrokerList) {
			connMap = jmsBroker.getConnMap();
			destNameWithParamIter = connMap.keySet().iterator();
			while (destNameWithParamIter.hasNext()) {
				try {
					destNameWithParam = (String) destNameWithParamIter.next();
					conn = connMap.get(destNameWithParam);
					conn.stop();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			jmsBroker.getConnMap().clear();
			jmsBroker.getDurableTopicClientIdMap().clear();
			jmsBroker.getMessageListenerMap().clear();
		}
	}

	/**
	 * �?��指定目标（queue或�?topic）的JMS监听
	 */
	public void unregistClusterListener(String destName) {
		Connection conn = null;
		Map<String, Connection> connMap = null;
		Iterator<String> destNameWithParamIter = null;
		String destNameWithParam = null;
		for (JmsBroker jmsBroker : jmsBrokerList) {
			connMap = jmsBroker.getConnMap();
			destNameWithParamIter = connMap.keySet().iterator();
			while (destNameWithParamIter.hasNext()) {
				try {
					destNameWithParam = (String) destNameWithParamIter.next();
					if (destNameWithParam.equals(destName)) {
						conn = connMap.get(destNameWithParam);
						conn.stop();
						conn.close();
						break;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	private Connection getNewConn(ActiveMQConnectionFactory afc) throws JMSException {
		Connection conn = null;
		ActiveMQConnectionFactory connfc = new ActiveMQConnectionFactory();
		connfc.setBrokerURL(afc.getBrokerURL());
		connfc.setPassword(afc.getPassword());
		connfc.setUserName(afc.getUserName());
		connfc.setUseAsyncSend(true);
		connfc.setAlwaysSessionAsync(false);
		connfc.setOptimizeAcknowledge(true);
		connfc.setProducerWindowSize(1024000);
		conn = connfc.createConnection();
		return conn;
	}

	// getter and setter
	public JmsCluster getJmsCluster() {
		return jmsCluster;
	}

	public void setJmsCluster(JmsCluster jmsCluster) {
		this.jmsCluster = jmsCluster;
	}
}
