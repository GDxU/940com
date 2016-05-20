package com.vinbet.mobile.sys.jms;

import java.util.HashMap;
import java.util.Map;

import javax.jms.Connection;
import javax.jms.MessageListener;

import org.apache.activemq.pool.PooledConnectionFactory;
import org.springframework.jms.core.JmsTemplate;

public class JmsBroker {
	// for send
	private PooledConnectionFactory jmsFactory;
	private JmsTemplate jmsTemplate;
	private boolean normalWork;
	// for listener
	private Map<String, Connection> connMap;
	private Map<String, MessageListener> messageListenerMap;
	private Map<String, String> durableTopicClientIdMap;

	public JmsBroker() {
		this.connMap = new HashMap<String, Connection>(0);
		this.messageListenerMap = new HashMap<String, MessageListener>(0);
		this.durableTopicClientIdMap = new HashMap<String, String>(0);
	}

	public PooledConnectionFactory getJmsFactory() {
		return jmsFactory;
	}

	public void setJmsFactory(PooledConnectionFactory jmsFactory) {
		this.jmsFactory = jmsFactory;
	}

	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public boolean isNormalWork() {
		return normalWork;
	}

	public void setNormalWork(boolean normalWork) {
		this.normalWork = normalWork;
	}

	public Map<String, Connection> getConnMap() {
		return connMap;
	}

	public void setConnMap(Map<String, Connection> connMap) {
		this.connMap = connMap;
	}

	public Map<String, MessageListener> getMessageListenerMap() {
		return messageListenerMap;
	}

	public void setMessageListenerMap(Map<String, MessageListener> messageListenerMap) {
		this.messageListenerMap = messageListenerMap;
	}

	public Map<String, String> getDurableTopicClientIdMap() {
		return durableTopicClientIdMap;
	}

	public void setDurableTopicClientIdMap(Map<String, String> durableTopicClientIdMap) {
		this.durableTopicClientIdMap = durableTopicClientIdMap;
	}

}
