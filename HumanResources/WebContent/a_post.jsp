<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="human.PostDAO"%>
<%@page import="human.Post"%>

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
<title>添加员工界面</title>
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
			if (sub.equals("增加")) {
					String post,department,p,d;					 
					int i=1;
					for(i=1;i<6;i++){
						p="post"+i;
						d="department"+i;						 						 
						 post = (String) request.getParameter(p);
						 department = (String) request.getParameter(d);
						 if(!post.equals("")){							 
							 sql = "insert into post (post) values('" + post + "')";
								stmt.executeUpdate(sql);
						 }
						 if(!department.equals("")){
							 sql = "insert into department  (department) values('" + department + "')";
								stmt.executeUpdate(sql);
						 } 
					}
				out.print("<script type='text/javascript' language='javaScript'> alert('添加数据成功');</script>");
				response.setHeader("refresh", "0;url=add_post.jsp");
			} else if (sub.equals("删除")) {
				String[] e_id = request.getParameterValues("no");
				int i;
				PostDAO dao = new PostDAO();
				List<Post> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Post tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							sql = "DELETE FROM post WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除成功');</script>");
				response.setHeader("refresh", "0;url=post_archive.jsp");
			} else if (sub.equals("修改")) {
				String[] e_id = request.getParameterValues("no");
				 String s="";
				int i;
				String post; 
				PostDAO dao = new PostDAO();
				List<Post> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Post tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getId().equals(e_id[i])) {
							s="post"+e_id[i];
							post = (String) request.getParameter(s);
							sql = "UPDATE post SET    post='" + post + "'   WHERE id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('修改成功');</script>");
				response.setHeader("refresh", "0;url=post_archive.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>