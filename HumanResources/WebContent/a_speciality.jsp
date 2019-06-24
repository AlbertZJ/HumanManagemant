<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="human.SpecialityDAO"%>
<%@page import="human.Speciality"%>

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
<title>专业删除和修改界面</title>
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
			if (sub.equals("添加")) {
					String speciality,technical_title,p,d;					 
					int i=1;
					for(i=1;i<6;i++){
						p="speciality"+i;
						d="technical_title"+i;
					    speciality = (String) request.getParameter(p);
						technical_title = (String) request.getParameter(d);
						 if(!technical_title.equals("")){							 
							 sql = "insert into technical_title (technical_title) values('" + technical_title + "')";
								stmt.executeUpdate(sql);
						 }
						 if(!speciality.equals("")){
							 sql = "insert into think  (speciality) values('" + speciality + "')";
								stmt.executeUpdate(sql);
						 } 
					}
				out.print("<script type='text/javascript' language='javaScript'> alert('添加数据成功');</script>");
				response.setHeader("refresh", "0;url=add_speciality.jsp");
			} else if (sub.equals("删除")) {
				String[] e_id = request.getParameterValues("no");
				int i;
				SpecialityDAO dao = new SpecialityDAO();
				List<Speciality> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Speciality tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							sql = "DELETE FROM think WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除成功');</script>");
				response.setHeader("refresh", "0;url=speciality_archive.jsp");
			} else if (sub.equals("修改")) {
				String[] e_id = request.getParameterValues("no");
				 String s="";
				int i;
				String speciality; 
				SpecialityDAO dao = new SpecialityDAO();
				List<Speciality> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Speciality tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							s="speciality"+e_id[i];
							speciality = (String) request.getParameter(s);
							sql = "UPDATE think SET    speciality='" + speciality + "'   WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('修改成功');</script>");
				response.setHeader("refresh", "0;url=speciality_archive.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>