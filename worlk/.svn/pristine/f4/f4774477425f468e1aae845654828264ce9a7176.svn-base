package com.vinbet.mobile.sys.h2.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * SQL工具类
 * 
 * @author ray
 * 
 */
public class SqlCnd {

	public static String createTable(Entity entity) {
		StringBuffer sb = new StringBuffer();
		sb.append("CREATE TABLE " + entity.tableName + " (");
		for (ColMapping cm : entity.cols) {
			sb.append(cm.tableColumn + " " + cm.tableColumnType + (cm.isPk ? " PRIMARY KEY" : "") + ", ");
		}
		sb.replace(sb.length() - 2, sb.length(), ")");
		return sb.toString().toUpperCase();
	}

	public static String dropTable(Entity entity) {
		StringBuffer sb = new StringBuffer();
		sb.append("DROP TABLE IF EXISTS " + entity.tableName);
		return sb.toString().toUpperCase();
	}

	public static List<String> createIndex(Entity entity) {
		List<String> sqls = new ArrayList<String>();
		Map<String, String> indexMap = new HashMap<String, String>();
		for (ColMapping cm : entity.cols) {
			if (null != cm.indexName && !"".equals(cm.indexName)) {
				String[] ins = cm.indexName.split(",");
				for (String in : ins) {
					if (null == indexMap.get(in))
						indexMap.put(in, "");
					indexMap.put(in, indexMap.get(in) + "," + cm.tableColumn);
				}
			}
		}
		Iterator it = indexMap.entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, String> entry = (Entry<String, String>) it.next();
			String sql = "create index " + entry.getKey() + " on " + entity.tableName + "(" + entry.getValue().substring(1) + ")";
			sqls.add(sql.toUpperCase());
		}
		return sqls;
	}

	public static String insert(Entity entity) {
		StringBuffer prefix = new StringBuffer();
		StringBuffer suffix = new StringBuffer();
		prefix.append("INSERT INTO " + entity.tableName + "(");
		suffix.append(" VALUES(");
		for (ColMapping cm : entity.cols) {
			prefix.append(cm.tableColumn + ", ");
			suffix.append("?, ");
		}
		prefix.replace(prefix.length() - 2, prefix.length(), ")");
		suffix.replace(suffix.length() - 2, suffix.length(), ")");
		prefix.append(suffix.toString());
		return prefix.toString().toUpperCase();
	}

	public static String select(Entity entity) {
		StringBuffer prefix = new StringBuffer("SELECT ");
		StringBuffer suffix = new StringBuffer("FROM " + entity.tableName + " WHERE ");
		int pi = 1;
		for (ColMapping cm : entity.cols) {
			prefix.append(cm.tableColumn + ", ");
			if (null != cm.pojoFieldVal) {
				suffix.append(cm.tableColumn + "=? AND ");
				cm.isEnabled = true;
				cm.pi = pi;
				pi++;
			}
		}
		prefix.replace(prefix.length() - 2, prefix.length(), " ");
		prefix.append(suffix.substring(0, suffix.length() - 5));
		return prefix.toString().toUpperCase();
	}

	public static String selectPfix(Entity entity) {
		StringBuffer prefix = new StringBuffer("SELECT ");
		StringBuffer suffix = new StringBuffer("FROM " + entity.tableName + " ");
		for (ColMapping cm : entity.cols) {
			prefix.append(cm.tableColumn + ", ");
		}
		prefix.replace(prefix.length() - 2, prefix.length(), " ");
		prefix.append(suffix);
		return prefix.toString().toUpperCase();
	}

	public static String update(Entity entity) throws Exception {
		StringBuffer prefix = new StringBuffer("UPDATE " + entity.tableName + " SET ");
		StringBuffer suffix = new StringBuffer("WHERE ");
		boolean isNC = true;
		boolean isNUC = true;
		int pi = 1;
		for (ColMapping cm : entity.cols) {
			if (null != cm.getPojoFieldVal()) {
				cm.isEnabled = true;
				if (!cm.isPk && !cm.isUc) {
					prefix.append(cm.tableColumn + "=?, ");
					isNC = false;
					cm.pi = pi;
					pi++;
				} else {
					suffix.append(cm.tableColumn + "=? AND ");
					isNUC = false;
				}
			}
		}
		for (ColMapping cm : entity.cols) {
			if (cm.isEnabled && cm.pi == 0) {
				cm.pi = pi;
				pi++;
			}
		}
		if (isNUC) {
			throw new Exception("该对象没有字段设置更新条件!-->" + entity.getCls().getName());
		} else if (isNC) {
			throw new Exception("该对象没有需要更新的字段!-->" + entity.getCls().getName());
		}
		prefix.replace(prefix.length() - 2, prefix.length(), " ");
		prefix.append(suffix.substring(0, suffix.length() - 5));
		return prefix.toString().toUpperCase();
	}

	public static String updatePfix(Entity entity) throws Exception {
		StringBuffer prefix = new StringBuffer("UPDATE " + entity.tableName + " SET ");
		boolean isNC = true;
		int pi = 1;
		for (ColMapping cm : entity.cols) {
			if (null != cm.getPojoFieldVal() && !cm.isPk) {
				cm.isEnabled = true;
				prefix.append(cm.tableColumn + "=?, ");
				cm.pi = pi;
				isNC = false;
				pi++;
			}
		}
		if (isNC) {
			throw new Exception("该对象没有需要更新的字段!-->" + entity.getCls().getName());
		}
		prefix.replace(prefix.length() - 2, prefix.length(), " ");
		return prefix.toString().toUpperCase();
	}

	public static String delete(Entity entity) throws Exception {
		boolean isNC = true;
		StringBuffer sb = new StringBuffer("DELETE FROM " + entity.tableName + " WHERE ");
		int pi = 1;
		for (ColMapping cm : entity.cols) {
			if (null != cm.pojoFieldVal) {
				sb.append(cm.tableColumn + "=? AND ");
				cm.isEnabled = true;
				cm.pi = pi;
				pi++;
				isNC = false;
			}
		}
		if (isNC) {
			throw new Exception("该对象没有字段设置删除条件!-->" + entity.getCls().getName());
		}
		return sb.substring(0, sb.length() - 5).toUpperCase();
	}

	public static String deletePfix(Entity entity) throws Exception {
		StringBuffer sb = new StringBuffer("DELETE FROM " + entity.tableName + " ");
		return sb.toString().toUpperCase();
	}

}
