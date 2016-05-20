package com.chuangdun.jsl.dao.licence;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.SYS;


public class Image extends HttpServlet {

	private static final long serialVersionUID = 1081017858677158746L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		long id = SYS.RequestLong(request, "id", 0l);
		String seller = SYS.RequestStringToLower(request, "seller");
		int type=SYS.RequestInt(request, "type", 2);
		
		String tips = "";
		
		// ------------------------- 以下访问数据库 -------------------------
		Connection conn = null;
		CallableStatement call = null;
		try
		{
			conn = DBM.getInstance().getConnection();
			call = conn.prepareCall("{call KD_LICENCE(?,?,?,?)}");
			call.setLong(1, id);
			call.setString(2, seller);
			call.setInt(3, type);
			call.registerOutParameter(4, oracle.jdbc.OracleTypes.NVARCHAR);
			call.execute();
			tips = call.getString(4);
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
		if("$OK$".equals(tips)&&type>0)
		{
			String certpath="inc/khd_cert_kd.png";
			switch (type)
			{
				case 1:
					certpath="inc/sududa_cert.png";
					break;
				case 2:
					certpath="inc/khd_cert_kd.png";
					break;
				case 3:
					certpath="inc/khd_cert_zx.png";
					break;				
				default:
					break;
			}
			response.setContentType("image/jpeg");
			BufferedImage img = addTextToImage(this.getServletContext().getRealPath(certpath), id, seller);
			ImageIO.write(img, "jpg", response.getOutputStream());
		}		
		else
		{
			response.sendRedirect("/inc/licence_error.png");
//			BufferedImage errorImg = ImageIO.read(new FileInputStream(this.getServletContext().getRealPath("inc/licence_error.png")));
//			ImageIO.write(errorImg, "jpg", response.getOutputStream());
		}

	}

	private BufferedImage addTextToImage(String fileName, long id, String seller) throws IOException
	{
		if (seller == null || "".equals(seller) || id < 1)
		{
			return null;
		}
		File webFile = new File(fileName); // 加载文件
		if (!webFile.exists())
		{
			return null;
		}

		java.awt.Image imageWeb = ImageIO.read(webFile); // 读取图片文件
		int widthWeb = imageWeb.getWidth(null);
		int heightWeb = imageWeb.getHeight(null);
		BufferedImage bufImageWeb = new BufferedImage(widthWeb, heightWeb, BufferedImage.TYPE_INT_BGR);
		Graphics2D g = bufImageWeb.createGraphics();
		// g.drawImage(imageWeb, 0, 0, widthWeb, heightWeb, null);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		g.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);
		g.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		g.drawImage(imageWeb.getScaledInstance(widthWeb, heightWeb, java.awt.Image.SCALE_SMOOTH), 0, 0, null);

		Font f = new Font("微软雅黑", Font.BOLD, 18);
		g.setFont(f);
		g.setColor(new Color(0x7f7c51));// CC0000

		String serialDraw = String.valueOf(id);
		g.drawString(serialDraw, 275, 323);

		Font f1 = new Font("微软雅黑", Font.BOLD, 20);
		g.setColor(new Color(0x7f7c51));// #7f7c51
		g.setFont(f1);
		g.drawString(seller, 300, 402);
		g.dispose();
		return bufImageWeb;
	}
}
