package com.chuangdun.jsl.lab;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class Cached {

	public static Map<String, String> getConfig()
	{
		String cacheName = "KHD_CONFIG_CACHE";
		Map<String, String> map = (Map<String, String>) Memcached.get(cacheName);
		if (map == null || map.isEmpty())
		{
			map=new HashMap<String,String>();
			String kd_down_pc = null, kd_down_ios = null, kd_down_android = null, zx_down_pc = null;
			// ------------------------- 以下访问数据库 -------------------------
			Connection conn = null;
			CallableStatement call = null;
			ResultSet rs = null;
			try
			{
				conn = DBM.getInstance().getConnectionByClassForName();
				call = conn.prepareCall("{call KHD_CONFIG_CACHE(?)}");
				call.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
				call.execute();
				rs = (ResultSet) call.getObject(1);

				if (rs.next())
				{
					kd_down_pc=rs.getString("c_kd_down_pc");
					kd_down_ios=rs.getString("c_kd_down_ios");
					kd_down_android=rs.getString("c_kd_down_android");
					zx_down_pc=rs.getString("c_zx_down_pc");
				}

				rs.close();
				call.close();
				conn.close();
				conn = null;
			}
			catch (Exception e)
			{
				e.printStackTrace();
				if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
				{
					try
					{
						rs.close();
						call.close();
						conn.close();
					}
					catch (Exception e2)
					{

					}
				}
			}
			map.put("kd_down_pc", kd_down_pc);
			map.put("kd_down_ios", kd_down_ios);
			map.put("kd_down_android", kd_down_android);
			map.put("zx_down_pc", zx_down_pc);
		}
		return map;
	}

}
