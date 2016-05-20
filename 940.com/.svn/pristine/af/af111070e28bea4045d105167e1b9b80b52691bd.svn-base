package com.chuangdun.jsl.web.teacher;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Share;
import com.chuangdun.jsl.bean.Teacher;
import com.chuangdun.jsl.dao.TeacherDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class TeacherListServlet
 */
@WebServlet("/TeacherListServlet")
public class TeacherListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = SYS.RequestInt(request, "page", 1);
		int line = SYS.RequestInt(request, "line", 6);
		
		TeacherDao teacherDao=new TeacherDao();
		
		Page teacherPage=teacherDao.getTeacherPage(page, line);
		JSONObject result = new JSONObject();

		result.element("count", teacherPage.getTotalCount());
		result.element("tips", teacherPage.getTips());
		
		CachedRowSetImpl rs = teacherPage.getCachedRowSetImpl();
		JSONArray jsArray = new JSONArray();
		System.out.println("result beforeArray:"+jsArray.toString());
		try {

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String introduction = rs.getString("introduction");	
				String profile_img = rs.getString("profile_img");
				int priority =rs.getInt("priority");
				int level=rs.getInt("t_level");
				String profile_thumb=rs.getString("profile_thumb");
		        String qq=rs.getString("qq");
		        String yy=rs.getString("yy");
		        
				Teacher teacher = new Teacher();
				teacher.setName(name);
				teacher.setTitle(title);
				teacher.setIntroduction(introduction);
				teacher.setProfileUrl(profile_img);
				teacher.setPriority(priority);
				teacher.setLevel(level);
				teacher.setProfileThumbUrl(profile_thumb);
				teacher.setQq(qq);
				teacher.setYy(yy);
				jsArray.add(teacher);
			}
			System.out.println(result.toString());
			result.element("status", teacherPage.getStatus());
			System.out.println(result.toString());
			if (jsArray.size() != 0)
				result.element("list", jsArray);
			else
				result.element("list", "");
			System.out.println( result.toString());
			response.getOutputStream().write(
					result.toString().getBytes("utf-8"));
		} catch (SQLException e) {
			e.printStackTrace();
			result.element("status", 0);
			result.element("list", "");
			response.getOutputStream().write(
					result.toString().getBytes("utf-8"));
		}
		System.out.println("result122:" + result.toString());

	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	public static void main(String[] args) {
		 JSONObject jsonObject = new JSONObject();//静待方法，直接通过类名+方法调用
	        // 输出jsonobject对象
	        System.out.println("jsonObject：" + jsonObject);
	        // 判读输出对象的类型
	        boolean isArray = jsonObject.isArray();
	        boolean isEmpty = jsonObject.isEmpty();
	        boolean isNullObject = jsonObject.isNullObject();
	        System.out.println("是否为数组:" + isArray + "， 是否为空:" + isEmpty
	                + "， isNullObject:" + isNullObject);

	        // 添加属性，在jsonObject后面追加元素。
	        jsonObject.element("address", "福建省厦门市");
	        System.out.println("添加属性后的对象：" + jsonObject);

	        
	        
	        JSONObject jsonObject1 = new JSONObject();
	        jsonObject1.element("aa", "222");
	        JSONObject jsonObject2 = new JSONObject();
	        jsonObject2.element("aa", "333");
	        // 返回一个JSONArray对象
	        JSONArray jsonArray = new JSONArray();
//	        jsonObject.put("jsonArray", jsonArray);
	        jsonArray.add(jsonObject1);
	        jsonObject.element("jsonArray", jsonArray);
	        //在jsonObject后面住家一个jsonArray
	        JSONArray array = jsonObject.getJSONArray("jsonArray");
	        System.out.println(jsonObject);
	        for (int i = 0; i <array.size(); i++) {
	        	JSONObject jo=array.getJSONObject(i);
	        	System.out.println(jo);
	        			
			}
	        
	        
	        System.out.println("返回一个JSONArray对象：" + array + jsonObject.optJSONObject("jsonArray").isArray());
	}
}
