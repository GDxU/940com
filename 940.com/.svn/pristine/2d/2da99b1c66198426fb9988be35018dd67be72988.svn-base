package com.chuangdun.jsl.dao.licence;

import java.sql.CallableStatement;
import java.sql.Connection;

import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.SYS;



public class Check{

	public String checkUser(long id, String seller)
	{
		String tips = "";
		if ("".equals(seller) || "".equals(seller))
		{
			tips = "卖家账号不能为空！";
		}
		
		else if (id < 1)
		{
			tips = "用户编号错误！";
		}
		else
		{
			// ------------------------- 以下访问数据库 -------------------------
			Connection conn = null;
			CallableStatement call = null;
			try
			{
				conn = DBM.getInstance().getConnection();
				call = conn.prepareCall("{call KD_LICENCE(?,?,?)}");
				call.setLong(1, id);
				call.setString(2, seller);
				call.registerOutParameter(3, oracle.jdbc.OracleTypes.NVARCHAR);
				call.execute();
				tips = call.getString(3);
				call.close();
				conn.close();
				conn = null;
			}
			catch (Exception e)
			{
				e.printStackTrace();
				tips = SYS.dbError;
				if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
				{
					try
					{
						call.close();
						conn.close();
					}
					catch (Exception e2)
					{

					}
				}
			}
		}

		return tips;
	}

}
