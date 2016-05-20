package com.vinbet.mobile.util.jmx;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface CommAnnotation {
	String value();
}
