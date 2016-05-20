package com.vinbet.mobile.sys.h2.util;

import java.util.ArrayList;
import java.util.List;

/**
 * SQL条件拼接类
 * 
 * @author ray
 * 
 */
public class Cnd {

	private List<Object> pis = new ArrayList<Object>();

	/**
	 * 不带任何语句的条件表达式<br>
	 * 条件组中用到
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @param op 运算符(like,=,in等)
	 * @param value 值
	 * @return
	 */
	public Cnd exp(String name, String op, Object value) {
		pis.add(new SqlE(name, op, valHandle(value), "EXP"));
		return this;
	}

	/**
	 * AND语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @param op 运算符(like,=,in等)
	 * @param value 值
	 * @return
	 */
	public Cnd and(String name, String op, Object value) {
		pis.add(new SqlE(name, op, valHandle(value), "AND"));
		return this;
	}

	/**
	 * AND语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param sqlEG 条件组
	 * @return
	 */
	public Cnd and(SqlEG sqlEG) {
		sqlEG.setSign("AND");
		pis.add(sqlEG);
		return this;
	}

	/**
	 * OR语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @param op 运算符(like,=,in等)
	 * @param value 值
	 * @return
	 */
	public Cnd or(String name, String op, Object value) {
		pis.add(new SqlE(name, op, valHandle(value), "OR"));
		return this;
	}

	/**
	 * OR语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param sqlEG 条件组
	 * @return
	 */
	public Cnd or(SqlEG sqlEG) {
		sqlEG.setSign("OR");
		pis.add(sqlEG);
		return this;
	}

	/**
	 * WHERE语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @param op 运算符(like,=,in等)
	 * @param value 值
	 * @return
	 */
	public Cnd where(String name, String op, Object value) {
		pis.add(new SqlE(name, op, valHandle(value), "WHERE"));
		return this;
	}

	private String valHandle(Object v) {
		return null == v ? null : String.valueOf(v);
	}

	/**
	 * WHERE语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param sqlEG 条件组
	 * @return
	 */
	public Cnd where(SqlEG sqlEG) {
		sqlEG.setSign("WHERE");
		pis.add(sqlEG);
		return this;
	}

	/**
	 * 正序排序
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @return
	 */
	public Cnd asc(String name) {
		pis.add(new SqlE(name, null, null, "ASC"));
		return this;
	}

	/**
	 * 倒序排序
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @param name 字段名
	 * @return
	 */
	public Cnd desc(String name) {
		pis.add(new SqlE(name, null, null, "DESC"));
		return this;
	}

	/**
	 * 获得条件组
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @return
	 */
	public SqlEG exps() {
		SqlEG eg = new SqlEG();
		for (int i = 0; i < pis.size(); i++) {
			if (pis.get(i) instanceof SqlE)
				eg.add((SqlE) pis.get(i));
		}
		return eg;
	}

	/**
	 * 将条件转换成SQL语句
	 * 
	 * <pre>
	 * Create By ray
	 * </pre>
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toSQL() throws Exception {
		StringBuffer sb;
		if (pis.isEmpty()) {
			return "";
		} else {
			sb = new StringBuffer();
			int oi = -1;
			for (int i = 0; i < pis.size(); i++) {
				if (pis.get(i) instanceof SqlE) {
					SqlE p = (SqlE) pis.get(i);
					if (i == 0 && !p.getSign().equalsIgnoreCase("where")) {
						throw new Exception("条件中where的位置应在第一位,请调整条件顺序!!");
					}
					if (p.getSign().equalsIgnoreCase("asc") || p.getSign().equalsIgnoreCase("desc")) {
						if (oi > -1) {
							sb.deleteCharAt(sb.length() - 1);
							sb.append(", " + p.getName() + " " + p.getSign() + " ");
						} else {
							sb.append("ORDER BY " + p.getName() + " " + p.getSign() + " ");
						}
						oi = i;
					} else {
						if (oi > -1 && i > oi)
							throw new Exception("条件中order by的位置应在最后面,请调整条件顺序!!");
						sb.append(p.getSign() + " " + p.toString() + " ");
					}
				} else if (pis.get(i) instanceof SqlEG) {
					SqlEG pg = (SqlEG) pis.get(i);
					if (pg.isEmpty()) {
						throw new Exception("条件组" + (i + 1) + "为空!!");
					}
					if (i == 0 && !pg.getSign().equalsIgnoreCase("where")) {
						throw new Exception("条件中where的位置应在第一位,请调整条件顺序!!");
					}
					if (oi > -1 && i > oi)
						throw new Exception("条件中order by的位置应在最后面,请调整条件顺序!!");
					StringBuffer tsb = new StringBuffer("(");
					for (int j = 0; j < pg.get().size(); j++) {
						SqlE p = pg.get().get(j);
						if (p.getSign().equalsIgnoreCase("exp") || p.getSign().equalsIgnoreCase("and") || p.getSign().equalsIgnoreCase("or")) {
							if (p.getSign().equalsIgnoreCase("exp")) {
								if (j != 0)
									throw new Exception("条件组中第一位必须是EXP,请调整条件顺序!!");
								tsb.append(p.toString() + " ");
							} else {
								tsb.append(p.getSign() + " " + p.toString() + " ");
							}

						}
					}
					tsb.deleteCharAt(tsb.length() - 1).append(")");
					sb.append(pg.getSign() + " " + tsb + " ");
				}
			}
			return sb.deleteCharAt(sb.length() - 1).toString();
		}
	}
}
