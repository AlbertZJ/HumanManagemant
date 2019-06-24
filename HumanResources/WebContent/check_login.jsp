<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="graduate.Conver2MD5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录检查界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			// 执行查询
			//System.out.println(" 实例化Statement对象...");
			stmt = conn.createStatement();			 
			String p_accounts = (String) request.getParameter("p_accounts");
			request.getSession().setAttribute("username", p_accounts);
			String password = (String) request.getParameter("password");//取出login.jsp的值
			String pwd_md5 = Conver2MD5.getMD5(password); 
			
			String sql;
			Boolean pwd;					 
			sql = "select * from manager  where p_accounts='" + p_accounts + "'";			 
			ResultSet rs = stmt.executeQuery(sql);
			// 展开结果集数据库
			if (rs != null && rs.next()) {				 
					pwd = pwd_md5.equals(Conver2MD5.getMD5(rs.getString("password")));				 
				if (pwd) {					 
						response.sendRedirect("main.jsp");					 
				} else {
					out.print("<script type='text/javascript' language='javaScript'> alert('密码错误');</script>");
					response.setHeader("refresh", "0;url=login.jsp");
				}
			} else {
				out.print("<script type='text/javascript' language='javaScript'> alert('账号错误');</script>");
				response.setHeader("refresh", "0;url=login.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>