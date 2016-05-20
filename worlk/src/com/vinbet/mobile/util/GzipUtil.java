package com.vinbet.mobile.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 解压缩工具
 * 
 * @author Jagger
 * 
 * @date 2013-9-4 下午03:55:29
 */
public class GzipUtil {
	private static final Logger logger = LogManager.getLogger(HttpClientUtil.class);

	/**
	 * 使用gzip压缩对象
	 * 
	 * @param obj
	 *            要压缩的对象
	 * @return 字节数组流
	 */
	public static byte[] gzipObject(Object obj) {
		byte[] data = null;
		ByteArrayOutputStream byteOut = null;
		GZIPOutputStream gzipOut = null;
		ObjectOutputStream objOut = null;
		try {
			// 建立字节数组输出流
			byteOut = new ByteArrayOutputStream();
			// 建立gzip压缩输出流
			gzipOut = new GZIPOutputStream(byteOut);
			// 建立对象序列化输出流
			objOut = new ObjectOutputStream(gzipOut);
			objOut.writeObject(obj);
		} catch (IOException e) {
			logger.error("对象压缩失败...", e);
		} finally {
			if (objOut != null) {
				try {
					objOut.flush();
					objOut.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (gzipOut != null) {
				try {
					gzipOut.finish();
					gzipOut.flush();
					gzipOut.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (byteOut != null) {
				try {
					byteOut.flush();
					byteOut.close();
					// 返回压缩字节流
					data = byteOut.toByteArray();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return data;
	}

	/**
	 * 使用gzip压缩字符串
	 * 
	 * @param str
	 * @return
	 */
	public static String gzipString(String str) {
		if (null == str || "".equals(str)) {
			return null;
		}
		byte[] bytes = null;
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			GZIPOutputStream gzip = new GZIPOutputStream(bos);
			gzip.write(str.getBytes("utf-8"));
			gzip.finish();
			gzip.close();
			bytes = bos.toByteArray();
			bos.close();
		} catch (Exception e) {
			logger.error("字符串压缩失败...", e);
		}
		return new BASE64Encoder().encodeBuffer(bytes);
	}

	/***
	 * 使用gzip解压缩字符串
	 * 
	 * @param str
	 * @return
	 */
	public static String unGzipString(String str) {
		if (null == str || "".equals(str)) {
			return null;
		}
		byte[] bytes = null;
		String out = null;
		try {
			ByteArrayInputStream bis = new ByteArrayInputStream(new BASE64Decoder().decodeBuffer(str));
			GZIPInputStream gzip = new GZIPInputStream(bis);
			byte[] buf = new byte[1024];
			int num = -1;
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			while ((num = gzip.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, num);
			}
			bytes = baos.toByteArray();
			baos.flush();
			baos.close();
			gzip.close();
			bis.close();
			out = new String(bytes, "utf-8");
		} catch (Exception e) {
			logger.debug("字符串解压缩失败..." + e.fillInStackTrace());
		}
		return out;
	}

	/**
	 * 解压缩对象
	 * 
	 * @param <T>被压缩的对象类型
	 * @param t
	 * @param data
	 *            字节数组流
	 * @return
	 */
	public static <T> T unGzipObject(T t, byte[] data) {
		T object_ = null;
		ByteArrayInputStream byteInput = null;
		GZIPInputStream gzipInput = null;
		ObjectInputStream objInput = null;
		try {
			byteInput = new ByteArrayInputStream(data);
			// 建立gzip解压输入流
			gzipInput = new GZIPInputStream(byteInput);
			// 建立对象序列化输入流
			objInput = new ObjectInputStream(gzipInput);
			// 按制定类型还原对象
			object_ = (T) objInput.readObject();
		} catch (Exception e) {
			logger.error("对象解压缩失败...", e);
		} finally {
			if (byteInput != null) {
				try {
					byteInput.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (gzipInput != null) {
				try {
					gzipInput.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (objInput != null) {
				try {
					gzipInput.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return object_;
	}

	/**
	 * 测试压缩和解压缩
	 * 
	 * @param args
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws Exception {
		User user = new User();
		user.setId(1);
		user.setName("xiaojia");
		List<User> list = new ArrayList<User>();
		for (int i = 0; i < 100000; i++) {
			user = new User();
			user.setId(1);
			user.setName("xiaojia" + i);
			list.add(user);
		}
		long x = System.currentTimeMillis();
		for (int i = 0; i < 10; i++) {
			// byte[] data = gzipObject(list);
		}
		System.out.println(System.currentTimeMillis() - x);
		// List<User> list1 = readZipObject(new ArrayList<User>(), data);
		// System.out.println(list1.size());

		// compare();

		System.out.println(null == unGzipString(gzipString(null)));
	}

	/**
	 * 比较：压缩和不压缩的大小
	 */
	private static void compare() throws FileNotFoundException, IOException {
		User user = new User();
		user.setId(1);
		user.setName("xiaojia");
		List<User> list = new ArrayList<User>();
		for (int i = 0; i < 100000; i++) {
			user = new User();
			user.setId(1);
			user.setName("xiaojia" + i);
			list.add(user);
		}

		// 不压缩的情况
		ObjectOutputStream os = new ObjectOutputStream(new FileOutputStream("e:/wxp1.txt"));
		os.writeObject(list);
		os.close();

		// 压缩的情况
		byte[] data = gzipObject(list);
		ObjectOutputStream os1 = new ObjectOutputStream(new FileOutputStream("e:/wxp2.txt"));
		os1.write(data);
		os1.close();
	}
}

class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
