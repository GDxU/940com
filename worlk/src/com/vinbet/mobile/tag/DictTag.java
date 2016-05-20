package com.vinbet.mobile.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;
import org.nutz.mvc.Mvcs;

import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.StringUtil;
/**
 * 字典控件。
 * <p>
 * <i>版本：</i>2010-9-8<br>
 * <i>作者：</i>罗军林 <br>
 * </p>
 */
public class DictTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(DictTag.class.getName());

	// 以下为标签对应的属性，除code、showTip、selectValue为自定义属性外，其它均为select标签属性
	private String id;
	private String name;
	private String style;
	private String className;
	private String tabIndex;
	private String onchange;
	private Boolean isCreateLable = false;//是自动创建Lable
	private String showTipInfo;//提示信息

	private String selectValue; // 支持多个值,以","分割
	private Boolean showTip = true;
	private Boolean dataMini = false;//只支持jquerymobile
	private String filterStr;
	private String dictTypeId;
	
	private String datatype;//验证框架增加的属性
	private String nullmsg;//验证框架增加的属性
	private String errormsg;//验证框架增加的属性
	private String disabled;//增加不可用属性

	private Boolean isDESC = false;// 是否降序

	/** 控件类型 */
	private String controlType;
	private static String CONTROL_TYPE_SELECT = "1";
	private static String CONTROL_TYPE_RADIO = "2";
	private static String CONTROL_TYPE_LABLE = "3";
	private static String CONTROL_TYPE_CHECKBOX = "4";
	private static String CONTROL_TYPE_TABLEVALUE = "5";
	private static String CONTROL_TYPE_LIST = "6";//在线支付图标控件标签
	private static String CONTROL_TYPE_MOBILETYPEUL="7";
	private static String CONTROL_TYPE_LANG="8";//语言栏层。
	private static String CONTROL_TYPE_BankName="9"; //银行卡选择
	
	@Override
	public int doStartTag() throws JspException {
		try {
			List<Dict> dictList = getDictListByTypeIdList(dictTypeId);
			removeFilterForList(dictList);	
			removeHideForList(dictList);

			if (isDESC != null) {
				Collections.sort(dictList, new DictVOComparator(isDESC));
			}

			if (CONTROL_TYPE_SELECT.equals(controlType)) {
				generationSelectHTML(dictList);
			} else if (CONTROL_TYPE_RADIO.equals(controlType)) {
				generationRadioHTML(dictList);
			} else if (CONTROL_TYPE_LABLE.equals(controlType)) {
				generationLableHTML(dictList);
			} else if (CONTROL_TYPE_CHECKBOX.equals(controlType)) {
				generationCheckBoxHTML(dictList);
			}else if (CONTROL_TYPE_TABLEVALUE.equals(controlType)) {
				generationTableHTML(dictList);
			}else if(CONTROL_TYPE_LIST.equals(controlType)){
				paymetPlatListHTML(dictList);
			}else if(CONTROL_TYPE_MOBILETYPEUL.equals(controlType)){
				generationmobiletypeulHTML(dictList);
			}else if(CONTROL_TYPE_LANG.equals(controlType)){
				generationLangDivHTML(dictList);
			}else if(CONTROL_TYPE_BankName.equals(controlType))
			{
				generationBankNameulHTML(dictList);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 获取指定类型下的字典列表。<br>
	 * 
	 * @param dictType
	 * @return
	 */
    public List<Dict> getDictListByTypeIdList(final String dictType) {
        //return AppCache.getDictListByTypeId(dictType);
        return AppCache.getI18nDictListByType(dictType);
    }


	/**
	 * 删除指定filterStr存在的项。
	 * 
	 * <p>
	 * <i>版本：</i>2010-9-25 <br>
	 * <i>作者：</i>罗军林 <br>
	 * </p>
	 * 
	 * @param dictList
	 */
	private void removeFilterForList(Collection<Dict> dictList) {
		if (filterStr != null && filterStr.trim().length() > 0) {
			String[] filterIds = filterStr.split(",");
			synchronized (dictList){
				Iterator<Dict> iterator = dictList.iterator();
				while (iterator.hasNext()) {
					Dict item = iterator.next();
					for (String fid : filterIds) {
						if (item.getDictTypeId().equals(dictTypeId)
								&& item.getDictCode().equals(fid)) {
							iterator.remove();
						}
					}
				}
			}
		}
	}
	
	private void removeHideForList(List<Dict> dictList) {
		List<Dict>  dictRemoveList=new ArrayList<Dict>();
		synchronized (dictList){
	        for (Dict item : dictList) {
	            if (item.getStatus() == Constants.DICT_STATUS_N) {
	                dictRemoveList.add(item);
	            }
	        }
		}

      //过滤掉已经停用的数据字典项
        dictList.removeAll(dictRemoveList);
	}
	

	/**
	 * 生成LABLE控件。
	 * 
	 * <p>
	 * <i>版本：</i>2010-9-8 <br>
	 * <i>作者：</i>罗军林 <br>
	 * </p>
	 * 
	 * @param dictList
	 * @throws IOException
	 */
	private void generationLableHTML(Collection<Dict> dictList)
			throws IOException {
		StringBuffer out = new StringBuffer();
		String[] values = null;
		if (null != selectValue && !"".equals(selectValue)) {
			values = selectValue.split(",");
		}
		out.append("<span");
		if (this.id != null)
			out.append(" id=\"" + this.id + "\"");
		if (this.name != null)
			out.append(" name=\"" + this.name + "\"");
		if (this.className != null)
			out.append(" class=\"" + this.className + "\"");
		out.append(">");
		if (values != null && values.length > 0) {
			String temp;
			for (int i = 0; i < values.length; i++) {
				temp = values[i];
				if (i > 0){
					out.append("、");
				}
				synchronized (dictList){
					for (Dict item : dictList) {
						if (temp.equals(item.getDictCode())) {
							out.append(item.getDictName());
							break;
						}
					}
				}

			}
		}
		out.append("</span>");
		pageContext.getOut().write(out.toString());
	}

	/**
	 * 根据list内容动态输出该HTML脚本。<br>
	 * 默认情况下会有“请选择...”选项,如果有默认选择值但在列表不存在，则会默认选择“请选择...”项;<br>
	 * 如果showTip=false即“请选择...”，如果有默认选择值但不存在，将会默认选择第一项;<br>
	 * 控件的value值为DictVO的dictCode;<br>
	 * <p>
	 * 生成的示例： <SELECT id="participantType" name="participantType"
	 * onchange="showChange();" style="width:110px"> <OPTION VALUE="001"
	 * >个人</OPTION> <OPTION VALUE="002" >企业</OPTION> </SELECT>
	 * </p>
	 * 
	 * @param list
	 * @throws Exception
	 */
	private void generationSelectHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();
		StringBuffer temp = new StringBuffer();
		boolean isBeSelected = false;// 标识默认选择值是否存在

		out.append("<SELECT ");
		if(dataMini) out.append(" data-mini=\"" + true + "\"");
		if (this.id != null)	out.append(" id=\"" + this.id + "\"");
		if (this.name != null) out.append(" name=\"" + this.name + "\"");
		else	throw new Exception("The 'name' attrib not null! ");
		if (this.className != null)  out.append(" class=\"" + this.className + "\"");
		if (this.onchange != null)	out.append(" onchange=\"" + this.onchange + "\"");
		if (this.tabIndex != null) out.append(" tabIndex=\"" + this.tabIndex + "\"");
		if (this.style != null)	out.append(" style=\"" + this.style + "\"");
		if (this.datatype != null)out.append(" datatype=\"" + this.datatype +"\"");		
		if (this.nullmsg != null)out.append(" nullmsg=\"" + this.nullmsg +"\"");		
		if (this.errormsg != null)out.append(" errormsg=\"" + this.errormsg +"\"");
		if (this.disabled != null)out.append(" disabled=\"" + this.disabled +"\"");
		out.append(">\n");

		 String language = Mvcs.getLocalizationKey();
		 synchronized (list){
			for (Dict item : list) {			
				//货币类型特殊处理 中文就显示文字说明 例如 人民币（CNY） 英文语言就显示货币代码 CNY
				if(!language.equals("zh")&&dictTypeId.equals("currencyForDict"))
				{
					//字典项需要添加正则表达式。
					temp.append("<OPTION VALUE=\"" + item.getDictCode()	+ "\"  rules=\""+item.getRules()+"\">" + item.getDictCode() + "</OPTION>\n");
				}else{
					if (item.getDictName() != null	&& item.getDictCode().equals(this.selectValue)) {
						isBeSelected = true;
						if(item.getRules()!=null){
							//字典项需要添加正则表达式。
							temp.append("<OPTION VALUE=\"" + item.getDictCode()	+ "\"  rules=\""+item.getRules()+"\" SELECTED>" + item.getDictName() + "</OPTION>\n");
						}else{
							temp.append("<OPTION VALUE=\"" + item.getDictCode()	+ "\"  SELECTED>" + item.getDictName() + "</OPTION>\n");
						}
					} else {
						if(item.getRules()!=null){
							//字典项需要添加正则表达式。
							temp.append("<OPTION VALUE=\"" + item.getDictCode()	+ "\"  rules=\""+item.getRules()+"\">" + item.getDictName() + "</OPTION>\n");
						}else{
							temp.append("<OPTION VALUE=\"" + item.getDictCode()	+ "\">" + item.getDictName() + "</OPTION>\n");
						}
					}
				}

			}
	   }


		
		if (isBeSelected &&  showTip) {
			out.append("<OPTION  value=\"\">");
			if(showTipInfo!=null){
				out.append(showTipInfo);
			}else{
				out.append(getDefaultShowTipInfo());
			}
			out.append("</OPTION>\n");
		} else if (showTip) {
			out.append("<OPTION  SELECTED value=\"\">");
			if(showTipInfo!=null ){
				out.append(showTipInfo);
			}else{
				out.append(getDefaultShowTipInfo());
			}
			out.append("</OPTION>\n");
		}

		out.append(temp);
		out.append("</SELECT>\n");
		pageContext.getOut().write(out.toString());
	}

	/**
	 * 根据list内容动态输出该HTML脚本。<br>
	 * id的生成较特殊，是根据id名再加索引值来构成的,<br>
	 * 控件的value值为SysrefcodeDO的主键,控件的code值为SysrefcodeDO的value;<br>
	 * ;
	 * <p>
	 * 示例： <div id="sex"> <INPUT TYPE="radio" name="sex" id="sex0"
	 * class="validate-one-required" tabIndex="2" code="1"
	 * value="17">男&nbsp;</INPUT> <INPUT TYPE="radio" name="sex" id="sex1"
	 * class="validate-one-required" tabIndex="2" code="0"
	 * value="18">女&nbsp;</INPUT> </div>
	 * </p>
	 * 
	 * @param list
	 * @throws Exception
	 */
	private void generationRadioHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();

		int i = 0;// 用于组合ID
		out.append("<span id=\"" + this.id + "\">\n");
		synchronized (list){
			for (Dict item : list) {
				if(isCreateLable)out.append("<label>");			
				out.append("<INPUT TYPE=\"radio\" ");
				if (this.name != null)
					out.append(" name=\"" + this.name + "\"");
				else
					throw new Exception("The 'name' attrib not null! ");
				if (this.id != null)
					out.append(" id=\"" + this.id + (i++) + "\"");
				if (this.className != null)
					out.append(" class=\"" + this.className + "\"");
				if (this.onchange != null)
					out.append(" onchange=\"" + this.onchange + "\"");
				if (this.tabIndex != null)
					out.append(" tabIndex=\"" + this.tabIndex + "\"");
				if (this.style != null)
					out.append(" style=\"" + this.style + "\"");
				if (item.getRules() != null)
					out.append(" rules=\"" + item.getRules() + "\"");			
				out.append(" value=\"" + item.getDictCode() + "\"");
				if (this.selectValue != null
						&& this.selectValue.equals(String.valueOf(item
								.getDictCode())))
					out.append(" checked=\"checked\" ");
				out.append(">" + item.getDictName() + "&nbsp;");
				out.append("</INPUT>\n");			
				if(isCreateLable)out.append("</label>");
			}
		}

		out.append("</span>\n");
		pageContext.getOut().write(out.toString());
	}

	private void generationCheckBoxHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();
		String[] selectValues = this.selectValue != null ? this.selectValue.split(",") : new String[] {};

		int i = 0;// 用于组合ID
		out.append("<span id=\"" + this.id + "\">\n");
		synchronized (list){
			for (Dict item : list) {
				if(isCreateLable)out.append("<label>");			
				out.append("<INPUT TYPE=\"checkbox\" ");
				if (this.name != null)
					out.append(" name=\"" + this.name + "\"");
				else
					throw new Exception("The 'name' attrib not null! ");
				if (this.id != null)
					out.append(" id=\"" + this.id + (i++) + "\"");
				if (this.className != null)
					out.append(" class=\"" + this.className + "\"");
				if (this.onchange != null)
					out.append(" onchange=\"" + this.onchange + "\"");
				if (this.tabIndex != null)
					out.append(" tabIndex=\"" + this.tabIndex + "\"");
				if (this.style != null)
					out.append(" style=\"" + this.style + "\"");
				if (item.getRules() != null)
					out.append(" rules=\"" + item.getRules() + "\"");			
				out.append(" value=\"" + item.getDictCode() + "\"");
				for (String value : selectValues) {
					if (value.trim().equals(String.valueOf(item.getDictCode()))) {
						out.append(" checked=\"checked\" ");
					}
				}
				out.append(">" + item.getDictName() + "&nbsp;");
				out.append("</INPUT>\n");
				
				if(isCreateLable)out.append("</label>");
			}
		}

		out.append("</span>\n");
		pageContext.getOut().write(out.toString());
	}

	/* 生成支付平台图标标签，非通用标签。*/
	private void paymetPlatListHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();
		synchronized (list){
			for (Dict item : list) {		
				out.append("<input type=\"radio\" ");
				if (this.name != null)
					out.append(" name=\"" + this.name + "\"");
				else
					throw new Exception("The 'name' attrib not null! ");
				if (this.className != null)
					out.append(" class=\"" + this.className + "\"");
				if (this.onchange != null)
					out.append(" onclick=\"" + this.onchange + "\"");			
				out.append(" value=\"" + item.getDictCode() + "\"");
				if (this.selectValue != null && this.selectValue.equals(String.valueOf(item.getDictCode())))
					out.append(" checked=\"checked\"");			
				out.append("/><img src=\""+item.getIcon()+"\" alt=\""+item.getDictName()+"\" style=\"vertical-align:middle\"/>\n");		
			}
		}

		pageContext.getOut().write(out.toString());
	}
	/**
	 * <一句话功能简述> 
	 * <pre>
	 * <功能详细描述>  
	 * </pre>
	 * @author  caibiao  
	 * @param list
	 * @throws Exception 
	 * @since  2014-12-30 下午3:11:04
	 */
	private void generationmobiletypeulHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();
		out.append("<ul");
		if (this.id != null) {
			out.append(" ID=\"").append(this.id).append("\"");
		}
		if (this.className != null) {
			out.append(" class=\"").append(this.className).append("\"");
		} 
		if (this.style != null) {
			out.append(" style=\"").append(this.style).append("\"");
		} 
		out.append(" >");
			
		if(showTip){
			if( showTipInfo!=null && showTipInfo.trim().length()>0){
				out.append("<li>").append(showTipInfo).append("</li>");
			}else{
				out.append("<li>").append("请选择").append("</li>");
			}
		}
		synchronized (list){
			for (Dict item : list) {
				out.append("<li rules=\"").append(item.getRules()).append("\"").append(" value=\"").append(item.getDictCode()).append("\"").append(" >") 
				.append("<label>").append(item.getDictName()).append("</label>")
				.append(" <img src=\"").append(item.getIcon()).append("\"").append(" />")
				.append("</li>");				
			}
		}

		out.append("</ul>");

		pageContext.getOut().write(out.toString());
	}
	
	private void generationBankNameulHTML(Collection<Dict> list) throws Exception {
		StringBuffer out = new StringBuffer();
		if(StringUtil.isEmpty(this.id)){
		  out.append("<a href=\"javaScript:void(0)\" id=\"select_bank\">");	
		  out.append("<em id=\"bank_image\" class=\"curbank_name fleft\" style=\"width:93px;height:24px;line-height: 24px;\">&nbsp;&nbsp;");
		}else{
			out.append("<a href=\"javaScript:void(0)\" id=\"select_bank_"+this.id+"\">");	
			out.append("<em id=\"bank_image_"+this.id+"\" class=\"curbank_name fleft\" style=\"width:93px;height:24px;line-height: 24px;\">&nbsp;&nbsp;");
		}							   
	    out.append(getDefaultShowTipInfo());	  
	    out.append("</em>");
	    out.append("<i class=\"down_arrow fleft down_arrow_s\">&nbsp;</i>");
	    out.append("</a>");	    
		out.append("<ul");
		if (this.id != null) {
			out.append(" ID=\"").append(this.id).append("\"");
		}
		if (this.className != null) {
			out.append(" class=\"").append(this.className).append("\"");
		} 	 
		out.append(" style=\"").append("display:none ;z-index:999;").append("\"");	 
		out.append(" >");
		
		synchronized (list){
			for (Dict item : list) {
				out.append("<li id=\"").append(item.getDictCode()).append("\"").append(" name=\"").append(item.getDictName()).append("\"").append(" >") 
				 .append(" <img src=\"").append(item.getIcon()).append("\"").append(" style=\"width:88px;height:24px;\" alt=\"").append(item.getDictName()).append("\"/>")
				 .append("</li>");  
			}
		}

		out.append("</ul>");

		pageContext.getOut().write(out.toString());
	}
	
	//添加对列表显示的支持 begin
	private void generationTableHTML(List<Dict> list) throws Exception {
		StringBuffer out =new StringBuffer();
		String temp="";
		try {
			out.append("{");
			synchronized (list){
				for (Dict item : list) {		
					out.append("\""+item.getDictCode()+"\":\""+item.getDictName()+"\",");				
				}
			}

			out.append("}");
			temp=out.substring(0,(out.toString().length()-2))+"}";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		pageContext.getOut().write(temp);
	}
	
	/**
	 * 语言栏层特用标签，非通用标签。
	 * @author  cjp 
	 * @param list
	 * @throws Exception 
	 * @since  2015-1-13 上午11:05:11
	 */
	private void generationLangDivHTML(Collection<Dict> list) throws Exception{
		String selectLangName="";
		String selectLangcode=Mvcs.getLocalizationKey();
		synchronized (list){
			for(Dict dict:list){
				if(dict.getDictCode().equals(selectLangcode)){
					selectLangName=dict.getDictName(); 
					break;
				}
			} 
		}
 
		StringBuffer out = new StringBuffer(); 
		out.append("<li id=\"cep_language\">");
		out.append("<a class=\"cep-language-").append(selectLangcode).append("\" href=\"javaScript:void(0)\"  hidefocus=\"true\"><em>").append(selectLangName).append("</em><i>&nbsp;</i></a>\n");
		out.append("<ul class=\"language-select\">");
		synchronized (list){
			for(Dict dict:list){
				if(!dict.getDictCode().equals(selectLangcode)){
					out.append("<li><a href=\"javaScript:void(0)\"  onclick=\"changeLanguage('").append(dict.getDictCode()).append("')\" class=\"cep-language-").append(dict.getDictCode()).append("\"><em>").append(dict.getDictName()).append("</em></a></li>\n");
				}			 
			} 
		}

		out.append("</ul>\n</li>"); 
		pageContext.getOut().write(out.toString());
	}
	
	private String getDefaultShowTipInfo(){
		return AppCache.getInternationInfo("294", Mvcs.getLocalizationKey());
	}
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public String getSelectValue() {
		return selectValue;
	}

	public void setSelectValue(String selectValue) {
		this.selectValue = selectValue;
	}

	public String getTabIndex() {
		return this.tabIndex;
	}

	public void setTabIndex(String tableIndex) {
		this.tabIndex = tableIndex;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public Boolean getShowTip() {
		return showTip;
	}

	public void setShowTip(Boolean showTip) {
		this.showTip = showTip;
	}

	public Boolean getDataMini() {
		return dataMini;
	}

	public void setDataMini(Boolean dataMini) {
		this.dataMini = dataMini;
	}

	public String getFilterStr() {
		return filterStr;
	}

	public void setFilterStr(String filterStr) {
		this.filterStr = filterStr;
	}

	public String getDictType() {
		return dictTypeId;
	}

	public void setDictType(String dictTypeId) {
		this.dictTypeId = dictTypeId;
	}

	public String getControlType() {
		return controlType;
	}

	public void setControlType(String controlType) {
		this.controlType = controlType;
	}

	public Boolean getIsDESC() {
		return isDESC;
	}

	public void setIsDESC(Boolean isDESC) {
		this.isDESC = isDESC;
	}

	public Boolean getIsCreateLable() {
		return isCreateLable;
	}

	public void setIsCreateLable(Boolean isCreateLable) {
		this.isCreateLable = isCreateLable;
	}

	public String getShowTipInfo() {
		return showTipInfo;
	}

	public void setShowTipInfo(String showTipInfo) {
		this.showTipInfo = showTipInfo;
	}

	public String getDatatype() {
		return datatype;
	}

	public String getNullmsg() {
		return nullmsg;
	}

	public void setNullmsg(String nullmsg) {
		this.nullmsg = nullmsg;
	}

	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		if(errormsg!=null){
			//String temp = LocalizedTextUtil.findDefaultText(errormsg, I18nIntercept.getRequest().getLocale());
			this.errormsg = errormsg;
		}
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	
	
}

/**
 * 字典表的排放比较器。
 * <p>
 * <i>版本：</i>2010-11-11<br>
 * <i>作者：</i>罗军林 <br>
 * </p>
 */
class DictVOComparator implements Comparator<Dict> {
	private final Boolean isDesc;

	public DictVOComparator(Boolean isDesc) {
		this.isDesc = isDesc;
	}

	public DictVOComparator() {
		this.isDesc = false;
	}

	public int compare(Dict o1, Dict o2) {
		if (isDesc) {
			if (o2.getSortNo() > o1.getSortNo()) {
				return 1;
			} else if ( o2.getSortNo()==o1.getSortNo()) {
				return 0;
			} else {
				return -1;
			}
		} else {
			if (o1.getSortNo() > o2.getSortNo()) {
				return 1;
			} else if ( o1.getSortNo()==o2.getSortNo()) {
				return 0;
			} else {
				return -1;
			}
		}
	}
}
