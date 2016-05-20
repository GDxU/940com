package com.vinbet.mobile.util;

public class Constants {
	/**
	 * 管理中心分配的手机端应用标识
	 */
	public static final String SERVICE_ID = "0_PHONE";
	/**
	 * SESSIONID sessid
	 */
	public static final String JSESSIONID = "sessid";
	/**
	 * cookie中存放的语言
	 */
	public static final String COOKIE_LANGUAGE_KEY = "cookie_language";
	/**
	 * 默认语言
	 */
	public static final String DEFAULT_LANGUAGE = "zh";
	/**
	 * 用户Session
	 */
	public static final String USER_SESSION = "USER_SESSION";
	/**
	 * 时时彩用户Session
	 */
	public static final String SSC_USER_SESSION = "SSC_USER_SESSION";
	/**
	 * 新香港彩彩用户Session
	 */
	public static final String HKC_USER_SESSION = "HKC_USER_SESSION";
	/**
	 * 七星彩用户Session
	 */
	public static final String QXC_USER_SESSION = "QXC_USER_SESSION";
	/**
	 * 体育用户Session
	 */
	public static final String SPORT_USER_SESSION = "SPORT_USER_SESSION";
	/**
	 * 系统管理员用户Session
	 */
	public static final String ADMIN_USER_SESSION = "ADMIN_USER_SESSION";
	/**
	 * API子应用Session
	 */
	public static final String SUB_APP_SESSION = "SUB_APP_SESSION";
	/**
	 * AESKEY Session
	 */
	public static final String RDM_KEY = "RDMKEY";
	/**
	 * 找回密码专用 Session
	 */
	public static final String FINDPWD_SESSION = "FINDPWD_SESSION";
	/**
	 * 最近一次访问子应用时间戳
	 */
	public static final String APP_LAST_TO_GAME_TIME = "APP_LAST_TO_GAME_TIME";

	/**
	 * 系统管理员用户类型
	 */
	public static final String ADMIN_USER_TYPE = "ADMIN_USER_TYPE";
	/**
	 * 用户最近一次存款时间
	 */
	public static final String LATEST_DEPOSIT_TIME_SESSION = "LATEST_DEPOSIT_TIME_SESSION";
	/**
	 * 用户最近一次提款时间
	 */
	public static final String LATEST_WITHDRAW_TIME_SESSION = "LATEST_WITHDRAW_TIME_SESSION";
	/**
	 * 用户最近一次下单时间
	 */
	public static final String LATEST_ORDER_TIME_SESSION = "LATEST_ORDER_TIME_SESSION";
	/**
	 * 两次订单的最小时间差
	 */
	public static final long ORDER_TIME_INTERVAL_MIN = 5 * 1000l;
	/**
	 * 与时时彩通信秘钥名称
	 */
	public static final String TOKEN_SSC = "sign";
	/**
	 * 与新香港彩通信秘钥名称
	 */
	public static final String TOKEN_HKC = "sign";
	/**
	 * 与体育投注通信秘钥名称
	 */
	public static final String TOKEN_SPORT = "sign";
	/**
	 * 通信秘钥名称
	 */
	public static final String TOKEN_HB = "sipsession";
	/**
	 * 时时彩最后心跳时间
	 */
	public static long heartbeat_lasttime_ssc = System.currentTimeMillis();
	/**
	 * 香港彩最后心跳时间
	 */
	public static long heartbeat_lasttime_hkc = System.currentTimeMillis();
	/**
	 * 七星彩最后心跳时间
	 */
	public static long heartbeat_lasttime_qxc = System.currentTimeMillis();
	/**
	 * 新体育最后心跳时间
	 */
	public static long heartbeat_lasttime_sport = System.currentTimeMillis();
	/**
	 * 系统是否启用动静分离
	 */
	public static boolean static_dynamic_enabled = false;
	/**
	 * 静态文件服务器地址
	 */
	public static String static_url = null;
	/**
	 * 传统存款状态
	 */
	public static boolean paytype_common_status = true;
	/**
	 * 快捷支付状态
	 */
	public static boolean paytype_fastpay_status = true;
	/**
	 * 静态资源版本
	 */
	public static long rsvn = System.currentTimeMillis();
	/**
	 * SSO地址前缀
	 */
	public static String sso_prefix;
	/**
	 * SSO二级域名
	 */
	public static String sso_secondary_domain;
	/**
	 * SSO应用端口
	 */
	public static String sso_port;
	/**
	 * 服务器类型
	 */
	public static int server_type = 0;
	/*
	 * 用户级别 待定
	 */
	public static int USERLV_CONFIRMED = 1;
	/*
	 * 用户级别 普通
	 */
	public static int USERLV_NORMAL = 2;
	/*
	 * 用户级别 VIP
	 */
	public static int USERLV_VIP = 3;
	/*
	 * 用户级别 作弊
	 */
	public static int USERLV_CHEAT = 4;
	/*
	 * 用户级别 测试
	 */
	public static int USERLV_TEST = 5;

	/*
	 * 用户状态 未激活、正常、锁定、冻结、注销
	 */
	public enum USER_STATUS {
		USERSTATUS_NOACTIVE(0), USERSTATUS_NORMAL(1), USERSTATUS_LOCK(2), USERSTATUS_FREEZE(3), USERSTATUS_CANCEL(4);
		private int code;
		private String name;

		private USER_STATUS(int code) {
			this.code = code;
		}

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	}

	/*
	 * 用户操作 新增 修改
	 */
	public enum USER_OPT {
		OPT_SAVE(1), OPT_UPDATE(2);
		private int code;
		private String name;

		private USER_OPT(int code) {
			this.code = code;
		}

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	}

	public enum PlatformReturnCode {
		SUCCESS(160000), FAILED(160001);
		private int code;
		private String name;

		private PlatformReturnCode(int code) {
			this.code = code;
		}

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	}

	/**
	 * 用戶狀態
	 */
	public enum UserStatus {
		NORMAL(0), FREEZE(1), CLOSE(2);
		private int val;
		private String name;

		private UserStatus(int val) {
			this.val = val;
		}

		public int getVal() {
			return val;
		}

		public void setVal(int val) {
			this.val = val;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}

	/**
	 * 用户注册来源
	 */
	public enum RegistSrc {
		H5("1"), APP("3");
		private String val;
		private String name;

		private RegistSrc(String val) {
			this.val = val;
		}

		public String getName() {
			return name;
		}

		public String getVal() {
			return val;
		}
	}

	/**
	 * 存提款终端来源
	 */
	public enum DepositDrawTerminal {
		H5("1"), APP("3");
		private String val;
		private String name;

		private DepositDrawTerminal(String val) {
			this.val = val;
		}

		public String getName() {
			return name;
		}

		public String getVal() {
			return val;
		}
	}

	/**
	 * 划账来源
	 */
	public enum TransferSource {
		H5("2"), APP("7");
		private String val;
		private String name;

		private TransferSource(String val) {
			this.val = val;
		}

		public String getName() {
			return name;
		}

		public String getVal() {
			return val;
		}
	}

	/*
	 * CEP返回结果
	 */
	/*
	 * public enum CEPReturnCode { SUCCESS(1), FAILED(0),ACCOUT_TO_REPEAT(5001001 ),NO_BANGDING(5001004),NO_AGENTNAME(5001009
	 * ),FUNDPWD_SAME_LOGINPWD(5000008 ),NO_USER(5001002),LOGINPWD_ERROR(5001005) ,EXIST_BANK_CARDNUMBER(5001007),ERROR_DRAWPWD(5001006);
	 * 
	 * private int code; private String name;
	 * 
	 * private CEPReturnCode(int code) { this.code = code; }
	 * 
	 * public int getCode() { return code; }
	 * 
	 * public void setCode(int code) { this.code = code; }
	 * 
	 * public String getName() { return name; }
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * }
	 */

	/* ice调用，报文返回的报头st属性返回值 */
	public static final String SUCCESS = "1";// 成功。
	public static final String EXCEPTION = "0";// 未知异常
	public static final String INVALID_XML = "1001001";// 报文格式错
	public static final String INVALID_XML_DATA = "1001002";// 报文数据有误
	public static final String DB_EXCEPTION = "1002001";// 数据库调用异常
	public static final String TABLE_NOT_EXISTS = "1002002";// 数据库表不存在

	public static final String CURRENCY_STATUS_EFFECTUAL = "1"; // 货币状态,2-待审核（默认）、1-生效、0-未通过审核
	public static final String SHOW_HIDE_STATUS_SHOW = "1"; // 1-显示（默认）、0-隐藏
	public static final String EASY_ACCSTATUS_SHOW = "1"; // 易支付帐号状态,1-启用（默认）、0-停用

	public static final String NATIONALITY = "nationality"; // 国籍类型代码

	public static final String CURRENCY_DAG = "currencyForDict"; // 货币标签的类型。
	public static final String BANKNAME_DAG = "bankNameForDict"; // 用户线下存款可选的银行名称和添加提款方式时可选的银行和支付机构标签的类型。
	public static final String ORG_DAG = "orgNameForDict"; // 用户线下存款可选的银行名称和添加提款方式时可选的银行和支付机构标签的类型。
	public static final String ALIPAY_DRAW_DAG = "aliPayDrawForDict"; // 互联网支付方式数据字典 用于提款处的下拉框
	public static final String ALIPAY_DAG = "aliPayForDict"; // 互联网支付方式数据字典
	public static final String WECHATPAY_DRAW_DAG = "wechatDrawForDict"; // 微信支付方式数据字典 用于提款处的下拉框
	public static final String WECHATPAY_DAG = "wechatForDict"; // 微信支付方式数据字典 用于提款处的下拉框
	public static final String MOBILETYPE_DAG = "mobileTypeForDict"; // 手机号码类型标签的类型。
	public static final String PAYMENT_PLAT_MAP_DAG = "paymentPlatForDict"; // 前端系统内存中缓存的系统所支持的第三方支付平台Map中的key，通过此可以获取系统支持的支付平台。
	public static final String EASY_PAY_BANK_DAG = "EasyPaymentBankForDict"; // 易支付银行名称标签。
	public static final String EASY_PAY_ORG_DAG = "EasyPaymentORGForDict"; // 易支付第三方支付机构名称标签。
	public static final String LOCALBANK_TRANSFER_COMPANYBANKACC_DAG = "localBankTransferForDict"; // 本地银行转账公司银行名称。
	public static final String WALLETCATEGORY_DAG = "walletcategoryForDict";// 钱包类别。
	public static final String APP_DICT = "app"; // 平台接入子应用标签
	public static final String PAYMENTPLAT_FASTPAY = "3";// 支付平台ID(快捷支付)

	public static final String WITHDRAWAL_WAY_ORG = "6";// 提款方式,机构类别,6-中介机构,7-银行机构,10-支付宝,11-微信
	public static final String WITHDRAWAL_WAY_BANK = "7";// 提款方式,机构类别,6-中介机构,7-银行机构,10-支付宝,11-微信
	public static final String WITHDRAWAL_WAY_ALIPAY = "10";// 提款方式,机构类别,6-中介机构,7-银行机构,10-支付宝,11-微信
	public static final String WITHDRAWAL_WAY_WECHATPAY = "11";// 提款方式,机构类别,6-中介机构,7-银行机构,10-支付宝,11-微信

	// public static final String DRAW_SOURCE_MOBILE = "2";// 划账来源：手机端

	/* 向管理中心初始化同步内存数据、和数据字典，数据的报文请求参数----begin----- */
	public static final String DICT_BASE = "dict";// 获取管理中心dict表所有数据字典项。
	public static final String DICT_CURRENCY = "currency";// 获取管理中心T_CURRENCY表所有数据。
	public static final String DICT_BANKNAME = "withdrawalorg";// 获取管理中心T_WITHDRAWALORG表所有数据。是供用户自己选择什么银行或者机构存款。
	public static final String DICT_DEPOSITMETHOD = "depositmethod";// 获取管理中心T_DEPOSITMETHOD表所有数据。
	public static final String DICT_PAYMENTPLATFORM = "paymentplatform";// 获取管理中心T_PAYMENTPLATFORM表所有数据。
	public static final String DICT_MOBILETYPE = "mobiletype";// 获取管理中心T_MOBILETYPE表所有数据。
	public static final String DICT_EASYPAY = "EasyPayment";// 获取易支付所以的支付宝帐号和银行帐号。
	public static final String DICT_COMPANYBANKACC = "CompanyBankAcc";// 公司本地银行转账的收款账户
	public static final String DICT_INTERNATION = "Internation";// 获取国际化信息报文。
	public static final String DICT_SYSTEMPARAM = "systemparam";// 获取系统参数表。
	public static final String DICT_NAVIGATIONAPP = "navigationapp";// 获取导航菜单表。
	public static final String DICT_AREAINFO = "areainfo";// 获取地區資料表。
	public static final String DICT_ALIPAYINFO = "GetAlipay";// 获取互联网支付机构表。
	public static final String DICT_ALIPAYACCINFO = "GetAlipayAcc";//获取互联网支付机构账号表。
	/* 向管理中心初始化同步内存数据字典，数据的报文请求参数----end----- */

	public static final String USERCENTER_OPERATE_ADD = "1";// 用户中心ice接口操作码。1.新增
	public static final String USERCENTER_OPERATE_MODIFY = "2";// 用户中心ice接口操作码。
																// 2.修改
	public static final String USERCENTER_OPERATE_DELETE = "3";// 用户中心ice接口操作码。
																// 3.删除

	public static final String USERTYPE_CASH = "1";// 现金类型用户
	public static final String USERTYPE_CREDIT = "2";// 信用类型用户。

	// public static final String WALLET_TYPE_CENTER = "10";//中心钱包。

	public static final String DEPOSIT_FROM_WAY = "1";// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
	public static final String DRAWAL_FROM_WAY = "5";// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)

	public static final String BALANCE_TYPE_LOCAL = "1"; // 存提款类型,1-本地银行转账,2-支付平台,3-易支付
	public static final String BALANCE_TYPE_PAYMENTPLAT = "2"; // 存提款类型,1-本地银行转账,2-支付平台,3-易支付,4-支付宝
	public static final String BALANCE_TYPE_EASYPAY = "3"; // 存提款类型,1-本地银行转账,2-支付平台,3-易支付,4-支付宝
	public static final String BALANCE_TYPE_ALIPAY = "4"; // 存提款类型,1-本地银行转账,2-支付平台,3-易支付,4-支付宝

	public static final String PAYMENT_METHOD_ONLINPAY = "8";// 存提款方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他
	public static final String PAYMENT_METHOD_INTERMEDIARY = "6";// 6-中介机构

	public static final String DEPOSIT_APPLY = "1";// 接口报文类型。1、存款，2、取款,3、修改支付中状态
	public static final String DRAWAL_APPLY = "2";// 接口报文类型。1、存款，2、取款,3、修改支付中状态
	public static final String DEPOSIT_CHANGE_STATUS = "3";// 接口报文类型。1、存款，2、取款,3、修改支付中状态

	public static final String ISEXP_IS = "1";// 是否导出 1,是,0，否

	public static final String DRAWAL_APPLY_STATUS_APPLYING = "1";// 存提款状态,1-申请中（默认）、2-通过、3-不通过、4-待定、5-支付中、6-审核中
	public static final String DRAWAL_APPLY_STATUS_PASS = "2";// 存提款状态,1-申请中（默认）、2-通过、3-不通过、4-待定、5-支付中、6-审核中
	public static final String DRAWAL_APPLY_STATUS_PAYING = "5";// 存提款状态,1-申请中（默认）、2-通过、3-不通过、4-待定、5-支付中、6-审核中

	public static final String CHECK_INFO_FORDEPOSIT = "11";// 1.是否已绑定邮箱 2.是否已绑定手机 3.1,2 4.用户名是否存在 5. 邮箱是否已使用 6. 手机是否已使用 7.检测银行卡信息是否使用 8.检测提款次数接口
															// 9.是否设置资金密码 10.检测现金用户名字是否重复 11.检测当前用户是否有存款或取款申请中或支付中的，存取款记录
	public static final String CHECK_INFO_BACK_CODE_NO = "0";// 0:没有处理中的 1:有未审核通过记录
	public static final String CHECK_INFO_DWCUNT = "8"; // 当天提款次数

	public static final String CHECK_INFO_DEPOSIT_TIMES = "22"; // 查询现金用户的存款次数

	// public static final String DEPOSIT_SOURCE_MOBILE = "1"; // 存款来源-手机端
	/** 数据字典状态定义 */
	public static final int DICT_STATUS_Y = 1;// 已启用
	public static final int DICT_STATUS_N = 0;// 已停用

	/** 未激活 */
	public static final String USER_STATUS_NO_ACTIVATION = "0";
	/** 正常 */
	public static final String USER_STATUS_NORMAL = "1";
	/** 锁定 */
	public static final String USER_STATUS_LOCKING = "2";
	/** 冻结 */
	public static final String USER_STATUS_FREEZE = "3";
	/** 注销 */
	public static final String USER_STATUS_WRITEOFF = "4";
	/** 操作说明--新增 */
	public static final String OPT_add = "1";
	/** 操作说明--修改 */
	public static final String OPt_update = "2";
	/** 用户级别--默认 */
	public static final String USER_LV_DEFAULT = "1";
	/** 用户级别--普通 */
	public static final String USER_LV_NORMAL = "2";
	/** 用户级别--VIP */
	public static final String USER_LV_VIP = "3";
	/** 用户级别--作弊 */
	public static final String USER_LV_CHEAT = "4";
	/** 用户级别--测试 */
	public static final String USER_LV_TEST = "5";

	/** 注册验证码session信息 */
	public static final String VERIFICATION_CODE_KEY = "authcode";

	/** 保存在Session中的用户登录信息键值 */
	public static final String LOGIN_AUTHORIZEDUSERINFO = "loginUserInfo";
	/** 用户名重复 */
	public static final String USER_NAMESOME = "5001001";
	/** 用户密码错误 */
	public static final String ERROR_PASSWORD = "5001005";
	/** 没有这个用户 */
	public static final String NOUSER = "5001002";
	/** 资金密码不正确 */
	public static final String ERROR_DRAWPWD = "5001006";
	/** 缺失必要参数 */
	public static final String NOMUSTPARAM = "500006";
	/** 银行卡已存在 */
	public static final String EXISTBANKCARDNUMBER = "5001007";
	/** 没有记录 */
	public static final String NOTEXISTRECORD = "5001007";
	/** 上级用户不存在 */
	public static final String NO_AGENTNAME = "5001009";
	/** 存提款申请没有在指定规则内 */
	public static final String DEPOSIT_NO_INRULES = "5002005";
	/** 子应用统计投注错误 */
	public static final String APP_COUNT_ERROR = "5002011";
	/** sessionid失效 */
	public static final String SESSIONID_LOST_EFFICACY = "5000012";

	public static final String NO_AVAILABLE_CREDIT_ALLOCATION = "5001008";
	/** 资金密码不能和用户名或用户密码相同 */
	public static final String DRAWPWDNOTSAMEUPWDUNM = "5000008";
	/** 用户状态异常 */
	public static final String USER_STATESEXCEPTION = "500009";
	/** 用户未激活 */
	public static final String USER_STATESNOTACTIVE = "500010";
	/** 中心钱包余额不足 */
	public static final String WALLET_NOAVAIL_MONEY = "5002001";
	/** 该用户有申请中或支付中的存取款记录 */
	public static final String DRAWAL_STATUS_APPLYING = "5002003";
	/** 网络状态异常 */
	public static final String NETWORK_ERROR = "5000004";

	/** 语言栏数据字典 */
	public static final String frontface_LANGUAGE = "language";

	public static final String NO_DATA = "5001007";
	/** 用户银行卡超出最大限制 */
	public static final String MAX_CARD_NUM_LIMIT = "5001010";

	/** 没有可用的信用额度分配或余额 */
	public static final String NO_AVAILABLE_BALANCE = "5001008";

	/** 暂无可用快捷支付 */
	public static final int NO_AVAILABLE_FASTPAY = 5002013;

	/*-------管理中心系统参数--------begin-----*/
	/* 现金用户银行卡数量限制 */
	public static final String SYSTEMPARM_BANKCARD_LIMIT = "userBankCardQuantityLimit";
	/*-------管理中心系统参数--------end-----*/

	/*-------用户中心检测类接口标识码--------begin-----*/
	public static final String CHECKINFO_BANKCARD = "7";// 检测银行卡卡号
	public static final String CHECKINFO_RESP_ISU0 = "0";// 检测接口返回报文结果码，0：未绑定/未使用/未超过最大银行卡数量
	public static final String CHECKINFO_RESP_ISU1 = "1";// 检测接口返回报文结果码，1：绑定/使用/有未审核通过记录/超过银行卡数量
	/*-------用户中心检测类接口标识码--------end-----*/

	public static final String DICT_WALLETCATEGORY = "walletcategory";// 获取钱包类别表。
	// 钱包类别标识码
	public static final String WALLLET_TYPE_CENTER = "0_W_CENTER";// 中心钱包
	public static final String WALLLET_TYPE_SSC = "1_W_SSC";// 时时彩钱包
	public static final String WALLLET_TYPE_HKC = "1_W_HK";// 香港彩钱包
	public static final String WALLLET_TYPE_SPORT = "1_W_TY";// 体育投注钱包
	public static final String WALLLET_TYPE_QXC = "1_W_QXC";// 七星彩钱包
	public static final String WALLLET_TYPE_LHC = "1_W_LHC";// 六合彩钱包

	/*-------------jms消息队列---------- beigin------------*/
	public static final String ACTIVITY_ABOUT = "topic_act"; // 活动相关Topic
	public static final String USER_ACTIVITY_ABOUT = "topic_user_act"; // 用户活动相关相关Topic
	public static final String MC_TOPIC_BASEDATA = "MC_Topic_BaseData"; // 同步管理中心基本数据的持久化订阅队列。
	/*-------------jms消息队列---------- end---------------*/

	/*-------------活动中心用户活动相关报文操作方式---------- beigin------------*/
	public static final String USER_ACTIVITY_ADD = "1"; // 1：增加
	public static final String USER_ACTIVITY_UPDATE = "2"; // 2：更新
	public static final String USER_ACTIVITY_DELETE = "3"; // 3：删除
	/*-------------活动中心用户活动相关报文操作方式---------- end---------------*/

	/*-------------活动中心用户活动状态---------- beigin------------*/
	public static final String USER_ACTIVITY_STATUS_UNDERWAY = "1"; // 1：进行中
	public static final String USER_ACTIVITY_STATUS_OVER = "2"; // 2：结束
	public static final String USER_ACTIVITY_STATUS_QUIT = "3"; // 3：放弃
	public static final String USER_ACTIVITY_STATUS_NO_QUALIFICATION = "4"; // 4：没资格
	/*-------------活动中心用户活动状态---------- end---------------*/

	/*-------------活动中心活动状态\类型---------- beigin------------*/
	public static final String ACTIVITY_STATUS_OPEN = "1"; // 1-开启
	public static final String ACTIVITY_STATUS_CLOSE = "0";// 0-关闭

	public static final String ACTIVITY_TYPE_IN = "0"; // 内部活动0
	public static final String ACTIVITY_TYPE_OUT = "1"; // 外部活动1
	/*-------------活动中心活动状态\类型---------- end---------------*/

	/*-------------活动中心--活动类别参数---------- beigin------------*/
	public static final String ACTIVITY_MARK_GIFTBEFOREWASHIMPL = "giftBeforeWashImpl"; // 首划先送红利
	/*-------------活动中心--活动类别参数-----------end---------------*/

	/*-------------活动中心--结束活动参数：结束类型---------- beigin------------*/
	public static final String ACTIVITY_END_FORCE_0 = "0";
	public static final String ACTIVITY_END_FORCE_1 = "1";
	/*-------------活动中心--结束活动参数：结束类型-----------end---------------*/

	/*-------------活动中心--结束活动返回码st---------- beigin------------*/
	public static final String ACTIVITY_END_ST_YES = "0"; // 0表示可以转出
	public static final String ACTIVITY_END_ST_NO = "1"; // 1表示不能转出
	public static final String ACTIVITY_END_ST_INSIST = "2"; // 2表示需要强制转出
	/*-------------活动中心--结束活动返回码st---------- end---------------*/

	/*-------------活动中心定义的触发点标示---------- beigin------------*/
	public static final String ACTIVITY_TRIGGER_WEB_TRANS = "WEB_TRANS"; // 用户转账操作
																			// 外部
																			// 用户在前端转账操作触发活动
	/*-------------活动中心定义的触发点标示---------- end---------------*/

	/*-------------活动中心--参加活动返回码st---------- beigin------------*/
	public static final String ACTIVITY_JOIN_ST_NO = "0"; // 0失败
	public static final String ACTIVITY_JOIN_ST_YES = "1"; // 1成功
	public static final String ACTIVITY_JOIN_MSG_REPT = "pc.join.fail.rept"; // 重复IP、电话、邮箱不能才加活动
	public static final String ACTIVITY_JOIN_MSG_NOIN = "pc.join.fail.noin"; // 没有存款记录
	public static final String ACTIVITY_JOIN_MSG_FIRST = "pc.join.fail.first"; // 不是第一次划入
	public static final String ACTIVITY_JOIN_MSG_NOACT = "pc.join.fail.noact"; // 没有可参加的活动
	public static final String ACTIVITY_JOIN_MSG_OK = "pc.join.ok"; // 成功参加活动
	/*-------------活动中心--参加活动返回码st---------- end---------------*/

	/*-------------管理中心同步基础数据报文操作方式---------- beigin------------*/
	public static final String BASE_DATA_ADD = "1"; // 1：增加
	public static final String BASE_DATA_UPDATE = "2"; // 2：更新
	public static final String BASE_DATA_DELETE = "3"; // 3：删除
	public static final String DATA_TYPE_DICT = "Dict"; // 数据字典的数据类别标示
	public static final String DATA_TYPE_PAYMENTPLATFORM = "PaymentPlatform"; // 支付平台的数据类别标示
	public static final String DATA_TYPE_PAYMENTPLATFORMACC = "PaymentPlatformAcc"; // 支付平台帐号的数据类别标示
	public static final String DATA_TYPE_INTERNATION = "Internation"; // 国际化表的数据类别标示
	public static final String DATA_TYPE_EXCHANGERATE = "ExchangeRate"; // 货币汇率的数据类别标示
	public static final String DATA_TYPE_SYSTEMPARM = "SystemParm"; // 系统参数的数据类别标示
	public static final String DATA_TYPE_WALLETCATEGORYDTO = "WalletCategoryDto"; // 钱包类别的数据类别标示
	public static final String DATA_TYPE_NAVIGATIONAPP = "NavigationApp";// 导航栏的
																			// 数据类别标示
	public static final String DATA_TYPE_CURRENCY = "CurrencyDto";// 平台支持的货币数据类型标示
	public static final String DATA_TYPE_BANKNAME = "WithdrawalOrg";// 1、用户添加提款方式时候可选择的银行和支付机构名称。2、用户线下银行转账的时候用户可选的银行名称。
	public static final String DATA_TYPE_BANKNAMESUPPCURR = "WithdrawalOrgSuppCurr";
	public static final String DATA_TYPE_MOBILETYPE = "MobileType";
	public static final String DATA_TYPE_COMPANYBANK = "CompanyBankAcc";
	public static final String DATA_TYPE_COMPANYBANKSUPPCURR = "CompanyBankSuppCurr";
	public static final String DATA_TYPE_EASYPAYMENTACC = "EasyPaymentAcc";
	public static final String DATA_TYPE_AREAINFO = "AreaInfo";
	public static final String DATA_TYPE_ALIPAYINFO = "AliPayDto";
	public static final String DATA_TYPE_WECHATPAYINFO = "AliPaymentAcc";
	
	/*-------------管理中心同步基础数据报文操作方式---------- end---------------*/
	public static final String FUND_PWD_ERROR_CONUT = "userFundPwdCount";// 用户资金密码输错次数限制
	public static final String FUND_PWD_ERROR_TIME = "userFundPwdCountValidTime";// 账户资金密码次数累计有效时间(分钟)
	public static final String UNFREEZE_TIME = "userUnfreezeTime";// 账户冻结后自动解冻时间(分钟)
	public static final String LOGIN_PWD_ERROR_CONUT = "userErrorPwdCount";// 用户登陆密码输错次数限制
	public static final String LOGIN_PWD_ERROR_TIME = "errorPwdCountValidTime";// 账户登陆密码次数累计有效时间(分钟)
	public static final String UNLOCK_TIME = "userUnlockTime";// 账户锁定后自动解冻时间(分钟)
	public static final String SEND_CODE_COUNT = "userSendSCRCodeTimes";// 用户每天发送验证码的最大次数
	public static final String MAX_BANKCARD = "userBankCardQuantityLimit";// 现金用户银行卡数量限制
	public static final String LOCAL_BANK_TRANS_VISIABLE_VALUE = "localBankTransVisiableValve";// 用户存款笔数阀值
	public static final String IOS_DOWNLOAD_URL = "ios_download_url";// 苹果客户端下载地址
	public static final String ANDROID_DOWNLOAD_URL = "android_download_url";// 安卓客户端下载地址
	public static final String ALIPAY_MAX_SAVE_AMT = "AlipayMaxSaveAmtSingle";// 支付宝存款单笔最大限额
	public static final String ALIPAY_MAX_DRAW_AMT = "AlipayMaxGetAmtSingle";// 支付宝提款单笔最大限额
	public static final String WECHATPAY_MAX_SAVE_AMT = "WeixinpayMaxSaveAmtSingle";// 微信扫码存款单笔最大限额

	// 微信支付相关
	public static final String WECHAT_SUCCESS = "SUCCESS";// 微信支付成功标识
}
