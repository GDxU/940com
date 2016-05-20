package com.vinbet.mobile.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * 功能描述：完成与日期相关的各种操作
 * 
 * <p>
 * 包括将日期格式化、从字符串中解析出对应的日期、对日期的加减操作等
 * 
 * @author maluming 2011-4-14
 * @see
 * @since 1.0
 */
public class DateUtil {

	public static Date date = null;

	public static DateFormat dateFormat = null;

	public static Calendar calendar = null;

	/**
	 * 功能描述：按照给出格式解析出日期
	 * 
	 * @param dateStr String 字符型日期
	 * @param format String 格式
	 * @return Date 日期
	 */
	public static Date parseDate(String dateStr, String format) {
		try {
			dateFormat = new SimpleDateFormat(format);
			String dt = dateStr;// .replaceAll("-", "/");
			if ((!dt.equals("")) && (dt.length() < format.length())) {
				dt += format.substring(dt.length()).replaceAll("[YyMmDdHhSs]", "0");
			}
			date = (Date) dateFormat.parse(dt);
		} catch (Exception e) {
		}
		return date;
	}

	/**
	 * 功能描述：格式化日期
	 * 
	 * @param dateStr String 字符型日期：YYYY-MM-DD 格式
	 * @return Date
	 */
	public static Date parseDate(String dateStr) {
		return parseDate(dateStr, "yyyy-MM-dd");
	}

	/**
	 * 功能描述：格式化输出日期
	 * 
	 * @param date Date 日期
	 * @param format String 格式
	 * @return 字符型日期
	 */
	public static String format(Date date, String format) {
		String result = "";
		try {
			if (date != null) {
				dateFormat = new SimpleDateFormat(format);
				result = dateFormat.format(date);
			}
		} catch (Exception e) {
		}
		return result;
	}

	/**
	 * 功能描述：返回年份
	 * 
	 * @param date Date 日期
	 * @return 年份
	 */
	public static int getYear(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	/**
	 * 功能描述：返回月份
	 * 
	 * @param date Date 日期
	 * @return 月份
	 */
	public static int getMonth(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH) + 1;
	}

	/**
	 * 功能描述：返回日份
	 * 
	 * @param date Date 日期
	 * @return 日份
	 */
	public static int getDay(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 功能描述：返回小时
	 * 
	 * @param date 日期
	 * @return 返回小时
	 */
	public static int getHour(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 功能描述：返回分钟
	 * 
	 * @param date 日期
	 * @return 返回分钟
	 */
	public static int getMinute(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MINUTE);
	}

	/**
	 * 返回秒钟
	 * 
	 * @param date Date 日期
	 * @return 返回秒钟
	 */
	public static int getSecond(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.SECOND);
	}

	/**
	 * 功能描述：返回毫秒
	 * 
	 * @param date 日期
	 * @return 返回毫秒
	 */
	public static long getMillis(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}

	/**
	 * 功能描述：返回字符型日期
	 * 
	 * @param date 日期
	 * @return 返回字符型日期 yyyy/MM/dd 格式
	 */
	public static String getDate(Date date) {
		return format(date, "yyyy/MM/dd");
	}

	/**
	 * 功能描述：返回字符型时间
	 * 
	 * @param date Date 日期
	 * @return 返回字符型时间 HH:mm:ss 格式
	 */
	public static String getTime(Date date) {
		return format(date, "HH:mm:ss");
	}

	/**
	 * 功能描述：返回字符型日期时间
	 * 
	 * @param date Date 日期
	 * @return 返回字符型日期时间 yyyy/MM/dd HH:mm:ss 格式
	 */
	public static String getDateTime(Date date) {
		return format(date, "yyyy/MM/dd HH:mm:ss");
	}

	/**
	 * 功能描述：日期相加
	 * 
	 * @param date Date 日期
	 * @param day int 天数
	 * @return 返回相加后的日期
	 */
	public static Date addDate(Date date, int day) {
		calendar = Calendar.getInstance();
		long millis = getMillis(date) + ((long) day) * 24 * 3600 * 1000;
		calendar.setTimeInMillis(millis);
		return calendar.getTime();
	}

	/**
	 * 功能描述：年相加
	 * 
	 * @param date Date 日期
	 * @param day year 年数
	 * @return 返回相加后的日期
	 */
	public static Date addYear(Date date, int year) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, year);
		return calendar.getTime();
	}

	/**
	 * 功能描述：日期相减
	 * 
	 * @param date Date 日期
	 * @param date1 Date 日期
	 * @return 返回相减后的日期
	 */
	public static int diffDate(Date date, Date date1) {
		return (int) ((getMillis(date) - getMillis(date1)) / (24 * 3600 * 1000));
	}

	/**
	 * 功能描述：取得指定月份的第一天
	 * 
	 * @param strdate String 字符型日期
	 * @return String yyyy-MM-dd 格式
	 */
	public static String getMonthBegin(String strdate) {
		date = parseDate(strdate);
		return format(date, "yyyy-MM") + "-01";
	}

	/**
	 * 功能描述：取得指定月份的最后一天
	 * 
	 * @param strdate String 字符型日期
	 * @return String 日期字符串 yyyy-MM-dd格式
	 */
	public static String getMonthEnd(String strdate) {
		date = parseDate(getMonthBegin(strdate));
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		return formatDate(calendar.getTime());
	}

	/**
	 * 功能描述：常用的格式化日期
	 * 
	 * @param date Date 日期
	 * @return String 日期字符串 yyyy-MM-dd格式
	 */
	public static String formatDate(Date date) {
		return formatDateByFormat(date, "yyyy-MM-dd");
	}

	/**
	 * 功能描述：以指定的格式来格式化日期
	 * 
	 * @param date Date 日期
	 * @param format String 格式
	 * @return String 日期字符串
	 */
	public static String formatDateByFormat(Date date, String format) {
		String result = "";
		if (date != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat(format);
				result = sdf.format(date);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 计算2个日期之间的相隔天数
	 * 
	 * @param d1 日期1
	 * @param d2 日期2
	 * @return 日期1和日期2相隔天数
	 */
	public int getDaysBetween(Calendar d1, Calendar d2) {
		if (d1.after(d2)) {
			// swap dates so that d1 is start and d2 is end
			Calendar swap = d1;
			d1 = d2;
			d2 = swap;
		}
		int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
		int y2 = d2.get(Calendar.YEAR);
		if (d1.get(Calendar.YEAR) != y2) {
			d1 = (Calendar) d1.clone();
			do {
				days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);
				d1.add(Calendar.YEAR, 1);
			} while (d1.get(Calendar.YEAR) != y2);
		}
		return days;
	}

	/**
	 * 计算2个日期之间的工作天数（去除周六周日）
	 * 
	 * @param d1 日期1
	 * @param d2 日期2
	 * @return 日期1和日期2之间的工作天数
	 */
	public int getWorkingDay(Calendar d1, Calendar d2) {
		int result = -1;
		if (d1.after(d2)) {
			// swap dates so that d1 is start and d2 is end
			Calendar swap = d1;
			d1 = d2;
			d2 = swap;
		}

		// int betweendays = getDaysBetween(d1, d2);

		// int charge_date = 0;

		// 开始日期的日期偏移量
		int charge_start_date = 0;
		// 结束日期的日期偏移量
		int charge_end_date = 0;

		int stmp;
		int etmp;
		stmp = 7 - d1.get(Calendar.DAY_OF_WEEK);
		etmp = 7 - d2.get(Calendar.DAY_OF_WEEK);

		// 日期不在同一个日期内
		if (stmp != 0 && stmp != 6) {// 开始日期为星期六和星期日时偏移量为0
			charge_start_date = stmp - 1;
		}
		if (etmp != 0 && etmp != 6) {// 结束日期为星期六和星期日时偏移量为0
			charge_end_date = etmp - 1;
		}
		// }
		result = (getDaysBetween(this.getNextMonday(d1), this.getNextMonday(d2)) / 7) * 5 + charge_start_date - charge_end_date;
		// System.out.println("charge_start_date>" + charge_start_date);
		// System.out.println("charge_end_date>" + charge_end_date);
		// System.out.println("between day is-->" + betweendays);
		return result;
	}

	/**
	 * 获取当前星期
	 * 
	 * @param date 当前日期
	 * @return 当前日期
	 */
	public String getChineseWeek(Calendar date) {
		final String dayNames[] = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};

		int dayOfWeek = date.get(Calendar.DAY_OF_WEEK);

		// System.out.println(dayNames[dayOfWeek - 1]);
		return dayNames[dayOfWeek - 1];

	}

	/**
	 * 获得日期的下一个星期一的日期
	 * 
	 * @param date
	 * @return
	 */
	public Calendar getNextMonday(Calendar date) {
		Calendar result = null;
		result = date;
		do {
			result = (Calendar) result.clone();
			result.add(Calendar.DATE, 1);
		} while (result.get(Calendar.DAY_OF_WEEK) != 2);
		return result;
	}

	/**
	 * 计算两个日期之间的非工作日天数
	 * 
	 * @param d1 日期1
	 * @param d2 日期2
	 * @return 日期1与日期2之间的非工作天数
	 */
	public int getHolidays(Calendar d1, Calendar d2) {
		return this.getDaysBetween(d1, d2) - this.getWorkingDay(d1, d2);

	}

	public static void main(String[] args) {
		Date d = new Date();
		DateUtil dt = new DateUtil();
		// System.out.println(d.toString());
		// System.out.println(formatDate(d).toString());
		// System.out.println(getMonthBegin(formatDate(d).toString()));
		// System.out.println(getMonthBegin("2008/07/19"));
		// System.out.println(getMonthEnd("2008/07/19"));
		System.out.println(dt.getChineseWeek(Calendar.getInstance()));
	}

}
