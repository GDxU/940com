package com.vinbet.mobile.sys.h2.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标识POJO字段为表中的一个字段
 * <ul>
 * <li><b>value</b>: 设置表中的字段名,不设置默认为字段名首字母小写。
 * <li><b>pk</b>: 标识该字段是否为主键,不支持复合主键。
 * <li><b>uc</b>: Update Criteria的缩写,标识该字段是做作为更新条件
 * <li><b>type</b>: 设置表中的字段类型,不设置自动检测,自动映射类型为:
 * </ul>
 * 
 * <pre>
 * 	int,short-->int
 * 	double-->double
 * 	float-->real
 * 	long-->bigint
 * 	date-->timestamp
 * 	string-->varchar
 *  boolean-->boolean
 * </pre>
 * 
 * 
 * @author Yenn
 * 
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Column {
	String value() default "";

	boolean pk() default false;

	boolean uc() default false;

	String type() default "";
}
