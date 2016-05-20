var ioc = {
		// 读取配置文件
	config : {
			type : "org.nutz.ioc.impl.PropertiesProxy",
			fields : {
				paths : ["com/vinbet/mobile/config/base.properties"]
			}
	},
	baseDataJmsFactory : {
		type : 'org.apache.activemq.pool.PooledConnectionFactory',
		fields : {
			maxConnections : 1,
			idleTimeout : 60000,
			expiryTimeout : 600000,
			connectionFactory : {
				type : 'org.apache.activemq.ActiveMQConnectionFactory',
				fields : {
					brokerURL : {java :"$config.get('vinbet.jms.baseData.brokerURL')"},
					userName : {java :"$config.get('vinbet.jms.baseData.userName')"},
					password : {java :"$config.get('vinbet.jms.baseData.password')"},
					useAsyncSend : true,
					alwaysSessionAsync : false,
					optimizeAcknowledge : true,
					producerWindowSize : 1024000
				}
			}
		}
	},
	baseDataJmsTemplate : {
		type : 'org.springframework.jms.core.JmsTemplate',
		fields : {
			pubSubDomain : false,
			defaultDestinationName : 'ping_queue',
			connectionFactory : {refer : 'baseDataJmsFactory'}
		}
	},
	baseDataJmsCluster : {
		type : 'com.vinbet.mobile.sys.jms.JmsCluster',
		fields : {
			jmsBrokerList : [{
				type : 'com.vinbet.mobile.sys.jms.JmsBroker',
				fields : {
					jmsFactory : {refer : 'baseDataJmsFactory'},
					jmsTemplate : {refer : 'baseDataJmsTemplate'},
					normalWork : true
				}
			}]
		}
	},
	baseDataJmsClusterMgr : {
		type : 'com.vinbet.mobile.sys.jms.JmsClusterMgr',
		events : {
	        fetch : 'init'
	    },
		fields : {
			jmsCluster : {refer : 'baseDataJmsCluster'}
		}
	}
}