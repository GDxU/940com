package com.vinbet.mobile.sys.h2.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.esotericsoftware.reflectasm.ConstructorAccess;
import com.esotericsoftware.reflectasm.FieldAccess;
import com.esotericsoftware.reflectasm.MethodAccess;

/**
 * 实体操作类
 * 
 * @author ray
 * 
 */
public class EO {

	private Log log = Logs.getLog(EO.class);

	protected Map<String, Integer> foMap = new HashMap<String, Integer>();
	protected List<FO> fos = new ArrayList<FO>();
	protected ConstructorAccess<?> ca;
	protected MethodAccess ma;
	protected FieldAccess fa;
	protected Map<String, Map<String, Object>> ano = new HashMap<String, Map<String, Object>>();

	
	public List<FO> getFos() {
		return fos;
	}

	public FO getFO() {
		return new FO();
	}

	public FO getFO(String fn) {
		try {
			return fos.get(foMap.get(fn));
		} catch (Exception e) {
			return null;
		}
	}

	public <T> T newInstance() {
		return (T) ca.newInstance();
	}

	/**
	 * 调用方法
	 * 
	 * @param o 对象
	 * @param name 方法名
	 * @param args 参数,无参数传NULL
	 * @return
	 */
	public Object invoke(Object o, String name, Object... args) {
		return ma.invoke(o, name, args);
	}

	public class FO {
		String n;
		String ftn;
		String sn;
		String gn;
		boolean isSet = false;
		boolean isGet = false;
		boolean isPub = false;
		Map<String, Map<String, Object>> ano = new HashMap<String, Map<String, Object>>();

		
		
		public String getName() {
			return n;
		}
		
		

		public String getFieldTypeName() {
			return ftn;
		}



		public Object get(Object o) {
			try {
				if (isPub) {
					return fa.get(o, fa.getIndex(n));
				} else if (isGet) {
					return ma.invoke(o, gn, null);
				}
			} catch (NullPointerException e) {
			} catch (Exception e) {
				log.error("Get Object Val Error!! FieldName:" + n, e);
			}
			return null;
		}

		public boolean set(Object o, Object v) {
			try {
				if (isPub) {
					fa.set(o, fa.getIndex(n), v);
					return true;
				} else if (isSet) {
					ma.invoke(o, ma.getIndex(sn), v);
				}
				return false;
			} catch (Exception e) {
				log.error("Set Object Val Error!! FieldName:" + n, e);
				return false;
			}
		}

		public boolean isSet() {
			return isSet;
		}

		public boolean isGet() {
			return isGet;
		}

		public boolean isPub() {
			return isPub;
		}

	}

}
