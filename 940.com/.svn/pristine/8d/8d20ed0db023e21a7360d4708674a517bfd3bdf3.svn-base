package com.chuangdun.jsl.lab;

import com.sun.rowset.CachedRowSetImpl;

public class Page {

	private int pageCount;	 //总页数
	private int currentPage;//当前页
	private int pageSize=25;
	private int totalCount;  //总记录数
	private int startnum;	//开始条数
	private int endnum;		//结束条数
	private CachedRowSetImpl cachedRowSetImpl;
	private String tips;
	private String error;
	private String searchStr;
	private String type;
	private String pageStr;
	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}

	private int status;
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	public String getError()
	{
		return error;
	}
	
	public void setError(String error)
	{
		this.error = error;
	}
	
	public String getTips()
	{
		return tips;
	}
	
	public void setTips(String tips)
	{
		this.tips = tips;
	}
	
	public int getStartnum()
	{
		return (getCurrentPage()-1)*getPageSize();
//		return startnum;
	}
	public void setStartnum(int startnum)
	{
		this.startnum = startnum;
	}
	public int getEndnum()
	{
		return getCurrentPage()*getPageSize();
//		return endnum;
	}
	public void setEndnum(int endnum)
	{
		this.endnum = endnum;
	}

	
	
	public int getPageCount()
	{
		if(totalCount>pageSize){
        	return (int)Math.ceil((double)totalCount/pageSize);
		}
		return pageCount;
	}
	public void setPageCount(int pageCount)
	{
		this.pageCount = pageCount;
	}
	public int getCurrentPage()
	{
		return currentPage;
	}
	public void setCurrentPage(int currentPage)
	{
		if(currentPage==0)currentPage=1;
		this.currentPage = currentPage;
	}
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}
	public int getTotalCount()
	{
		return totalCount;
	}
	public void setTotalCount(int totalCount)
	{
		this.totalCount = totalCount;
	}
	public CachedRowSetImpl getCachedRowSetImpl()
	{
		return cachedRowSetImpl;
	}
	public void setCachedRowSetImpl(CachedRowSetImpl cachedRowSetImpl)
	{
		this.cachedRowSetImpl = cachedRowSetImpl;
	}
	
	public String pager(String url)
	{
		StringBuffer str=new StringBuffer();
		int pace=12;
		int start=currentPage-pace;//for循环起始页
		start = (start < 1) ? 1 : start;//当出现0,-1页时，纠正为 1
        int max = pace * 2 + start + 1;//限制页数范围
        if (start > 1)
        {
        	str.append("<a href=\""+url+"_1.html\">1</a>...  ");
        }
        String font="";
		for(int i=start;i<=getPageCount();i++){
    		if(currentPage==i)
    		{
    			font="<a href=\"javascript:void(0);\" class=\"cur\">"+i+"</a>";
    		}
    		else
    		{
    			font="<a href=\""+url+"_"+i+".html\">"+i+"</a> ";
    		}
    		 if (i < max)//在“限制页数范围”内
                 str.append(font);
             else
             {
                 if (i == getPageCount())//超过限制页数，仅显示最后一页
                	 str.append("…" + "<a href=\""+url+"_"+i+".html\">"+i+"</a>" );
             }
    	}
		return str.toString();
	}
}
