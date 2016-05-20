package com.vinbet.mobile.sys.h2.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 实体信息类
 * @author ray
 *
 */
public class Entity {

	protected Class<?> cls;

	protected String tableName;

	protected List<ColMapping> cols = new ArrayList<ColMapping>();

	public Class<?> getCls() {
		return cls;
	}

	public String getTableName() {
		return tableName;
	}

	public List<ColMapping> getCols() {
		return cols;
	}

}
