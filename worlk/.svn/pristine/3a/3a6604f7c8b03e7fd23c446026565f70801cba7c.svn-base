package com.vinbet.mobile.sys.h2.util;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.objectweb.asm.ClassReader;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.tree.AnnotationNode;
import org.objectweb.asm.tree.ClassNode;
import org.objectweb.asm.tree.FieldNode;
import org.objectweb.asm.tree.MethodNode;

import com.esotericsoftware.reflectasm.ConstructorAccess;
import com.esotericsoftware.reflectasm.FieldAccess;
import com.esotericsoftware.reflectasm.MethodAccess;
import com.vinbet.mobile.sys.h2.util.EO.FO;

/**
 * 实体工具类 用于解析pojo并转化为entity
 * 
 * @author Ray
 * 
 */
public class EntityUtil {

	private static Map<String, EO> eoMap = new HashMap<String, EO>();

	private static String getName(String s) {
		return s.substring(s.lastIndexOf("/") + 1, s.length() - 1);
	}

	private static EO toEO(Class<?> cls) throws Exception {
		String classFilename = cls.getName().replace('.', '/') + ".class";
		InputStream inputStream = cls.getClassLoader().getResourceAsStream(classFilename);
		if (inputStream == null) {
			inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(classFilename);
		}
		EO eo = new EO();
		ClassReader cr = new ClassReader(inputStream);
		ClassNode cn = new ClassNode(Opcodes.ASM4);
		cr.accept(cn, Opcodes.ASM4);
		List<AnnotationNode> anos = cn.visibleAnnotations;
		if (null != anos) {
			for (AnnotationNode anno : anos) {
				String an = getName(anno.desc);
				Map<String, Object> amap = new HashMap<String, Object>();
				List<Object> objs = anno.values;
				if (null != objs) {
					boolean isVal = false;
					String k = null;
					for (Object o : objs) {
						if (isVal) {
							amap.put(k, o);
							isVal = false;
						} else {
							k = String.valueOf(o);
							isVal = true;
						}

					}

				}
				eo.ano.put(an, amap);
			}
		}
		int fi = 0;
		List<FieldNode> fields = cn.fields;
		List<MethodNode> methods = cn.methods;
		for (FieldNode field : fields) {
			FO fo = eo.getFO();
			fo.n = field.name;
			fo.ftn = getName(field.desc);
			if (field.access == Opcodes.ACC_PUBLIC) {
				fo.isPub = true;
			} else if (field.access == Opcodes.ACC_PRIVATE) {
				for (MethodNode method : methods) {
					if (method.access == Opcodes.ACC_PUBLIC) {
						if (("set" + fo.n).equalsIgnoreCase(method.name)) {
							fo.isSet = true;
							fo.sn = method.name;
						} else if (("get" + fo.n).equalsIgnoreCase(method.name)) {
							fo.isGet = true;
							fo.gn = method.name;
						}
					}
				}
			}
			List<AnnotationNode> annos = field.visibleAnnotations;
			if (null != annos) {
				for (AnnotationNode anno : annos) {
					String an = getName(anno.desc);
					Map<String, Object> amap = new HashMap<String, Object>();
					List<Object> objs = anno.values;
					if (null != objs) {
						boolean isVal = false;
						String k = null;
						for (Object o : objs) {
							if (isVal) {
								amap.put(k, o);
								k = null;
								isVal = false;
							} else {
								k = String.valueOf(o);
								isVal = true;
							}
						}
					}
					fo.ano.put(an, amap);
				}
			}
			eo.foMap.put(fo.n, fi);
			eo.fos.add(fo);
			fi++;
		}
		eo.fa = FieldAccess.get(cls);
		eo.ma = MethodAccess.get(cls);
		eo.ca = ConstructorAccess.get(cls);
		return eo;
	}

	public static EO getEO(Class<?> cls) throws Exception {
		if (null == eoMap.get(cls.getName()))
			eoMap.put(cls.getName(), toEO(cls));
		return eoMap.get(cls.getName());
	}

	public static Entity toEntity(Object o) throws Exception {
		Entity entity = new Entity();
		Class<?> cls = o.getClass();
		if (null == eoMap.get(cls.getName()))
			eoMap.put(cls.getName(), toEO(cls));
		EO eo = eoMap.get(cls.getName());
		entity.cls = cls;
		if (null == eo.ano.get("Table")) {
			throw new Exception("The class not defined table name!!-->" + cls.getName());
		}
		if (null == eo.ano.get("Table").get("value")) {
			entity.tableName = cls.getSimpleName().substring(0, 1).toLowerCase() + cls.getSimpleName().substring(1);
		} else {
			entity.tableName = String.valueOf(eo.ano.get("Table").get("value"));
		}

		List<FO> fos = eo.fos;
		for (FO fo : fos) {
			Map<String, Object> anoCol = fo.ano.get("Column");
			if (null != anoCol) {
				ColMapping cm = new ColMapping();
				cm.pojoField = fo.n;
				cm.pojoFieldType = fo.ftn;
				cm.pojoFieldVal = fo.get(o);
				if (null != anoCol.get("value")) {
					cm.tableColumn = String.valueOf(anoCol.get("value"));
				} else {
					cm.tableColumn = fo.n.substring(0, 1).toLowerCase() + fo.n.substring(1);
				}
				if (null != anoCol.get("type")) {
					cm.tableColumnType = String.valueOf(anoCol.get("type"));
				} else {
					cm.tableColumnType = toTableColumn(cm.pojoFieldType);
				}
				if (null != anoCol.get("pk") && Boolean.parseBoolean(String.valueOf(anoCol.get("pk")))) {
					cm.isPk = Boolean.parseBoolean(String.valueOf(anoCol.get("pk")));
				}
				if (null != anoCol.get("uc") && Boolean.parseBoolean(String.valueOf(anoCol.get("uc")))) {
					cm.isUc = Boolean.parseBoolean(String.valueOf(anoCol.get("uc")));
				}
				Map<String, Object> anoInd = fo.ano.get("Index");
				if (null != anoInd) {
					if (null != anoInd.get("value")) {
						cm.indexName = String.valueOf(anoInd.get("value"));
					} else {
						cm.indexName = "index_" + cm.tableColumn;
					}
				}
				entity.cols.add(cm);
			}
		}

		return entity;
	}

	private static String toTableColumn(String s) throws Exception {
		String cn = s.toLowerCase();
		if (cn.contains("int") || cn.contains("short")) {
			return "int";
		} else if (cn.contains("double")) {
			return "double";
		} else if (cn.contains("float")) {
			return "real";
		} else if (cn.contains("long")) {
			return "bigint";
		} else if (cn.contains("date")) {
			return "timestamp";
		} else if (cn.contains("string")) {
			return "varchar";
		} else if (cn.contains("boolean")) {
			return "boolean";
		}
		throw new Exception("不能自动匹配字段类型,请手动指定该类型!!" + s);
	}
}
