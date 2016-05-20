package com.vinbet.mobile.sys.h2.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 声明的一个 POJO 所对应的数据表名.
 * <ul>
 * <li><b>value</b>: 设置数据库中的表名,不设置默认为类名首字母小写。
 * </ul>
 * @author Yenn
 *
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Table {
	String value() default "";
}
