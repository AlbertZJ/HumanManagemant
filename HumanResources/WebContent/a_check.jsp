<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="human.EmployeeDAO"%>
<%@page import="human.Employee"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询信息界面</title>
</head>
<body bgcolor="lightblue">
	<center>
		<font face="楷体" size="6" color="#000">查询结果</font>
		 	<table border="1" bordercolor="pink">
				<tr height="10">
					<th>编号</th>
		<th>员工的姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>学历</th>
			<th>专业</th>
			<th>外语情况</th>
			<th>毕业时间</th>
			<th>婚姻状况</th>
			<th>工作岗位</th>
			<th>所在部门</th>
			<th>职称</th>
			<th>状态</th>
				</tr>
				<%
				request.setCharacterEncoding("utf-8");
				String e_id = (String) request.getParameter("e_id");
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
			System.out.println(edu_background);
				EmployeeDAO dao = new EmployeeDAO();
					List<Employee> list = dao.readFirstTitle();
					for (Employee tl : list) {
						if(tl.getE_id().equals(e_id)|| tl.getE_name().equals(e_name)||tl.getEdu_background().equals(edu_background)||
								tl.getSpeciality().equals(speciality)||tl.getPost().equals(post)||tl.getDepartment().equals(department)
								||tl.getTechnical_title().equals(technical_title)||tl.getState().equals(state)){
				%>
				<tr>
				<td><input type="text" value="<%=tl.getE_id()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getE_name()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getSex()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getAge()%>"
					  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getEdu_background()%> "
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getSpeciality()%> "
						  readonly="readonly"></td>
						  <td><input type="text" value="<%=tl.getForeign_language()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getGrad_time()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getMarriage()%>"
					  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getPost()%> "
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getDepartment()%> "
						  readonly="readonly"></td>
						  <td><input type="text" value="<%=tl.getTechnical_title()%>"
						  readonly="readonly"></td>
					<td><input type="text" value="<%=tl.getState()%>"
					  readonly="readonly"></td>
					 
				</tr>
				<%
						}}
				%>
			</table>
		 
	</center>
</body>
</html>