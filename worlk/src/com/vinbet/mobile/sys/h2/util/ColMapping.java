package com.vinbet.mobile.sys.h2.util;


/**
 * 实体与表字段的映射类
 * @author ray
 *
 */
public class ColMapping {
	
	String pojoField;
	
	Object pojoFieldVal;
	
	String pojoFieldType;
	
	String tableColumn;
	
	String tableColumnType;
	
	boolean isPk;
	
	boolean isUc;
	
	String indexName;
	
	boolean isEnabled;
	
	int pi;

	public String getPojoField() {
		return pojoField;
	}

	public Object getPojoFieldVal() {
		return pojoFieldVal;
	}

	public String getPojoFieldType() {
		return pojoFieldType;
	}

	public String getTableColumn() {
		return tableColumn;
	}

	public String getTableColumnType() {
		return tableColumnType;
	}

	public boolean isPk() {
		return isPk;
	}

	public boolean isUc() {
		return isUc;
	}

	public int getPi() {
		return pi;
	}

	public String getIndexName() {
		return indexName;
	}

	public boolean isEnabled() {
		return isEnabled;
	}
	
	
	
	
	
	
}
