package com.vinbet.mobile.util.jmx;

import java.lang.reflect.Method;

import javax.management.InstanceNotFoundException;
import javax.management.MBeanException;
import javax.management.RuntimeOperationsException;
import javax.management.modelmbean.InvalidTargetObjectTypeException;
import javax.management.modelmbean.ModelMBeanInfo;
import javax.management.modelmbean.ModelMBeanInfoSupport;
import javax.management.modelmbean.ModelMBeanOperationInfo;
import javax.management.modelmbean.RequiredModelMBean;

/**
 * JMX模型BEAN工具类。
 * 
 * @author Sunny
 * 
 */
public class RequiredModelMBeanUtil {

	public static RequiredModelMBean createModelBean(Object o) throws RuntimeOperationsException, MBeanException, InstanceNotFoundException, InvalidTargetObjectTypeException {
		Method[] methods = o.getClass().getDeclaredMethods();
		ModelMBeanOperationInfo[] operations = new ModelMBeanOperationInfo[methods.length];
		for (int i = 0; i < methods.length; i++) {
			String desc = null;
			CommAnnotation annotation = methods[i].getAnnotation(CommAnnotation.class);
			if (annotation != null) {
				desc = annotation.value();
			}
			operations[i] = new ModelMBeanOperationInfo(desc, methods[i]);
		}

		ModelMBeanInfo mBeanInfo = new ModelMBeanInfoSupport(o.getClass().getName(), null, null, null, operations, null);

		RequiredModelMBean requiredModelMBean = new RequiredModelMBean(mBeanInfo);
		requiredModelMBean.setManagedResource(o, "ObjectReference");
		return requiredModelMBean;
	}

}