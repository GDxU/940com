 
/*  
 * 文 件 名:  DictType.java  
 * 版    权:  CEP Technologies Co., Ltd. Copyright @2014,  All rights reserved  
 * 描    述:  <描述> 
 * 创建人： Peter Peng
 * @since 2014-11-7 下午3:17:53
 * Version   修改人          修改时间              描述                          MQC号
 * -------   -----    ---------  -----------    ------
 *   1.0     xxxxxx    2014-11-7   Description      M
 * 
 */
package com.vinbet.mobile.entity.portal;

/** <一句话功能简述> 
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  Peter Peng
 * @version  [Ver 1.0]
 * @since 2014-11-7 下午3:17:53
 */
public class DictType {
	private String dictTypeId;//类型代码
    private String dictTypeName;//类型名称
    private String remark;//备注
	public String getDictTypeId() {
		return dictTypeId;
	}
	public void setDictTypeId(String dictTypeId) {
		this.dictTypeId = dictTypeId;
	}
	public String getDictTypeName() {
		return dictTypeName;
	}
	public void setDictTypeName(String dictTypeName) {
		this.dictTypeName = dictTypeName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
