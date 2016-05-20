package com.vinbet.mobile.sys.h2.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 为标识的字段建立索引
 * 支持组合索引
 * <ul>
 * <li><b>value</b>: 设置索引名,组合索引必须设置索引名,多个索引名用","号分隔。
 * </ul>
 * <pre>
 * 普通索引:@Index
 * 组合索引:@Index("indexName")
 * 多个组合索引@Index("indexName1,indexName2")
 * </pre>
 * 
 * 
 * @author Yenn
 * 
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Index {
	
	String value() default "";
	
}
