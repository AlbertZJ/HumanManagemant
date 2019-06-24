<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="human.EmployeeDAO"%>
<%@page import="human.Employee"%>

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
				String e_name = (String) request.getParameter("e_name");
				String sex = (String) request.getParameter("sex");//取出login.jsp的值
				String age = (String) request.getParameter("age");
				String edu_background = (String) request.getParameter("edu_background");
				String speciality = (String) request.getParameter("speciality");//取出login.jsp的值
				String foreign_language = (String) request.getParameter("foreign_language");
				String grad_time = (String) request.getParameter("grad_time");
				String marriage = (String) request.getParameter("marriage");//取出login.jsp的值
				String post = (String) request.getParameter("post");
				String department = (String) request.getParameter("department");
				String technical_title = (String) request.getParameter("technical_title");//取出login.jsp的值
				String state = (String) request.getParameter("state");				
				Boolean pwd;
				sql = "insert into employee (e_name,sex,age,edu_background,speciality,foreign_language,grad_time,marriage,post,department,technical_title,state) values('" + e_name + "','"+ sex + "','" + age + "','" + edu_background + "','" + speciality + "','" + foreign_language + "','" + grad_time + "','" + marriage + "','" + post + "','" + department + "','" + technical_title + "','" + state + "')";
				stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('添加员工数据成功');</script>");
				response.setHeader("refresh", "0;url=employee_news.jsp");
			} else if (sub.equals("删除")) {
				String[] e_id = request.getParameterValues("no");
				int i;
				EmployeeDAO dao = new EmployeeDAO();
				List<Employee> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Employee tl : list) {
					for (i = 0; i < e_id.length; i++) {
						if (tl.getE_id().equals(e_id[i])) {
							sql = "DELETE FROM employee WHERE e_id='" + e_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除成功');</script>");
				response.setHeader("refresh", "0;url=employee_archive.jsp");
			} else if (sub.equals("修改")) {
				String[] e_id = request.getParameterValues("no");				
				String e_name;
				String sex;
				String age;
				String edu_background;
				String speciality;
				String foreign_language;
				String grad_time;
				String marriage;
				String post;
				String department;
				String technical_title;
				String state;				 
				int j=0;
				EmployeeDAO dao = new EmployeeDAO();
				List<Employee> list = dao.readFirstTitle();
				String check_num;
				String s="";
				check_num = (String) request.getParameter("check_num");								
				for (Employee tl : list) {
					for (j = 0; j < e_id.length; j++) {
				 		if (tl.getE_id().equals(e_id[j])) {							 
							s="e_name"+e_id[j];							 
							  e_name = (String) request.getParameter(s);
							  s="sex"+e_id[j];							   
							  System.out.println(s);
							  sex = (String) request.getParameter(s);//取出login.jsp的值							  
							  s="age"+e_id[j];							  
							  age = (String) request.getParameter(s);
							  s="edu_background"+e_id[j];							  
							  edu_background = (String) request.getParameter(s);
							  s="speciality"+e_id[j];							   
							  speciality = (String) request.getParameter(s);//取出login.jsp的值
							  s="foreign_language"+e_id[j];							   
							  foreign_language = (String) request.getParameter(s);
							  s="grad_time"+e_id[j];							  
							  grad_time = (String) request.getParameter(s);
							  s="marriage"+e_id[j];							  
							  marriage = (String) request.getParameter(s);//取出login.jsp的值
							  s="post"+e_id[j];							   
							  post = (String) request.getParameter(s);
							  s="department"+e_id[j];							   
							  department = (String) request.getParameter(s);
							  s="technical_title"+e_id[j];							   
							  technical_title = (String) request.getParameter(s);//取出login.jsp的值
							  s="state"+e_id[j];							  
							  state = (String) request.getParameter(s);
							sql = "UPDATE employee SET  e_name='" + e_name + "',sex='" + sex + "',age='" + age + "',edu_background='" + edu_background + "',speciality='" + speciality + "',foreign_language='" + foreign_language + "',grad_time='" + grad_time + "',marriage='" + marriage + "',post='" + post + "',department='" + department + "',technical_title='" + technical_title + "',state='" + state + "'  WHERE e_id='" + e_id[j] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('修改成功');</script>");
				response.setHeader("refresh", "0;url=employee_archive.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>