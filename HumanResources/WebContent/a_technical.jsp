<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="human.TechnicalDAO"%>
<%@page import="human.Technical"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称的删除和修改</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			stmt = conn.createStatement();

			String sql;
			String sub = (String) request.getParameter("sub");
			  if (sub.equals("删除")) {
				String[] e_id = request.getParameterValues("no");
				int i;
				TechnicalDAO dao = new TechnicalDAO();
				List<Technical> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Technical tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							sql = "DELETE FROM technical_title WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除成功');</script>");
				response.setHeader("refresh", "0;url=technical_title.jsp");
			} else if (sub.equals("修改")) {
		 		String[] e_id = request.getParameterValues("no");
				 String s="";
				int i;
				String technical_title; 
				TechnicalDAO dao = new TechnicalDAO();
				List<Technical> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Technical tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							s="technical_title"+e_id[i];
						 	technical_title = (String) request.getParameter(s);
						 		sql = "UPDATE technical_title SET    technical_title='" + technical_title + "'   WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);														 
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('修改成功');</script>");
				response.setHeader("refresh", "0;url=technical_title.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>