package com.vinbet.mobile.util;

import java.util.Random;
import java.util.regex.Pattern;

/**
 * 字符串处理
 */
public final class StringUtil {

	/**
	 * 转换字符串
	 * 
	 * @param sour
	 *            待转换
	 * @param init
	 *            缺省值
	 * @param length
	 *            截取字符串长度,如果超过此长度,后面显示...;不希望截取可填入0
	 * @return String 字串
	 */
	public static String toString(Object sour, String init, int length) {
		String dest = null;
		try {
			dest = (String) sour;
			if (dest == null || "".equals(dest)) {
				dest = init;
			}
		} catch (Exception e) {
			dest = init;
		}
		if (length > 0 && dest != null && dest.length() > length && dest.length() > 3) {
			dest = dest.substring(0, length - 3) + "...";
		}
		return dest;
	}

	/**
	 * 轉成字串
	 * 
	 * @param sour
	 *            待轉資料
	 * @param init
	 *            預設值
	 * @return String 字串
	 */
	public static String toString(Object sour, String init) {
		return toString(sour, init, 0);
	}

	/**
	 * 轉成字串
	 * 
	 * @param sour
	 *            待轉資料
	 * @return String 字串
	 */
	public static String toString(Object sour) {
		return toString(sour, "");
	}
	
    /**
     * 判断一个对象是否为空
     * 
     * @param obj 任意对象
     * @return 是/否
     */
    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        } else {
            if (obj instanceof java.lang.String) {
                if ("".equals(obj.toString().trim())) {
                    return true;
                }
            } else if (obj instanceof java.lang.StringBuffer) {
                if ("".equals(obj.toString().trim())) {
                    return true;
                }
            }
        }
        return false;

    }
    
    /**
     * 创建指定数量的随机字符串
     * @param numberFlag 是否是数字
     * @param length
     * @return
     */
    public static String createRandom(boolean numberFlag, int length){
     String retStr = "";
     String strTable = numberFlag ? "1234567890" : "1234567890abcdefghijkmnpqrstuvwxyz";
     int len = strTable.length();
     boolean bDone = true;
     do {
      retStr = "";
      int count = 0;
      for (int i = 0; i < length; i++) {
       double dblR = Math.random() * len;
       int intR = (int) Math.floor(dblR);
       char c = strTable.charAt(intR);
       if (('0' <= c) && (c <= '9')) {
        count++;
       }
       retStr += strTable.charAt(intR);
      }
      if (count >= 2) {
       bDone = false;
      }
     } while (bDone);

     return retStr;
    }
    
	/**
	 * 功能描述：判断是否为整数
	 * 
	 * @param str
	 *            传入的字符串
	 * @return 是整数返回true,否则返回false
	 */
	public static boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]+$");
		return pattern.matcher(str).matches();
	}
	
	/**
	 * 功能描述：格式化银行卡
	 * 
	 * @param str
	 *            传入未格式化的银行卡号
	 * @return 4位为一组 并且后隐藏最后四位以外的银行卡号
	 */
	public static String formatCardNo(String cardNo){
		int maxlength = 30;
		if(cardNo.length()<maxlength){
			maxlength=cardNo.length();
		}
		String temp = "";
		for(int i=0;i<maxlength;i++){
			if(i<maxlength-4){
				temp=temp+"*";
			}else{
				temp=temp+cardNo.substring(i,i+1);
			}
			if(i!=0&&(i+1)%4==0&&i!=(cardNo.length()-1)){
				temp = temp+" ";
			}
		}
		return temp;
	}
	
	
	/**
	 * 功能描述：易支付充值时候，随机生成尾数。
	 * 
	 * @param str
	 *            传入生成字符串的长度  
	 * @return 生成的尾数
	 */
    public static Double getRandomEasyPayMoney(int length) { //length表示生成字符串的长度  
        String base = "0123456789";     
        Random random = new Random();     
        StringBuffer sb;  
        Double easyPayMoney;     
        if(length==2){
        	do{
            	sb = new StringBuffer();  
    	        for (int i = 0; i < length; i++) {     
    	            int number = random.nextInt(base.length());     
    	            sb.append(base.charAt(number));     
    	        }  
    	        easyPayMoney=Double.valueOf(sb.toString());  
    	        easyPayMoney=easyPayMoney/100;
            }while(easyPayMoney.toString().length()>length+2);//两位数除以100前面也会多加一个0，同时会有小数点，所以长度要+2
        }else{
        	do{
        		sb = new StringBuffer();  
        		for (int i = 0; i < length; i++) {     
        			int number = random.nextInt(base.length());     
        			sb.append(base.charAt(number));     
        		}  
        		easyPayMoney=Double.valueOf(sb.toString());  
        		easyPayMoney=easyPayMoney/100;
        	}while(easyPayMoney.toString().length()>length+1);//除以100后，会有小数点，所以长度要+1
        }
        return easyPayMoney;     
     }
    
    
    /*根据List.size大小，随机获取list的一个序列，即可以随机获取list中的对象。*/
    public static int getRandomListIndex(int size) { 
    	final int nodeNum = size;
	    int baseNum=1;
	    String listSizeLength=size+"";
	    for(int i=0;i<listSizeLength.length();i++){
	    	baseNum=baseNum*10;
	    }
	    int random = (int) (Math.random() * baseNum);
	    int index=random % nodeNum;
	    return index;
    }
    
    //手机加星号
    public static String getStarMobile(String mobile) {
    	if(StringUtil.isEmpty(mobile))
   		{
   			return null;
   		}
    	if(mobile.length()>3){
    		String tmp = mobile.substring(mobile.length()-3, mobile.length());
    		String str ="";
    		for(int i =0;i<mobile.length()-3;i++){
    			str +="*";
    		}
    		mobile=str+tmp;
    	}
   		return mobile;
    }
    
    //邮箱加星号
   	public static String getStarEmail(String email) {
   		if(StringUtil.isEmpty(email))
   		{
   			return null;
   		}
   		if(email.indexOf("@")==-1)
   		{
   			return email;
   		}
   		String temp = email.substring(0, email.indexOf("@"));
   		if (temp.length() > 2) {
   			temp = temp.substring(0, 2);
   		}

   		return temp + "***"+ email.substring(email.indexOf("@"), email.length());
   	}
    
   
    
    public static void main(String[] args) {
		double a = StringUtil.getRandomEasyPayMoney(2);
		System.out.println(a);
	}

}