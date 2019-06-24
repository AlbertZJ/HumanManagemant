<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<head>
<title>员工信息管理界面</title>
</head> 
<body bgcolor="lightblue">
	<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/humanresources?useUnicode=true&characterEncoding=utf-8"
		user="root" password="123456" />
	<sql:query dataSource="${snapshot}" var="result">
SELECT * from employee;
</sql:query>
 
	<center>
		<h1>员工信息显示界面</h1>
	</center>
	<table border="1" width="100%">
		<tr>
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
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.e_name}" /></td>
				<td><c:out value="${row.sex}" /></td>
				<td><c:out value="${row.age}" /></td>
				<td><c:out value="${row.edu_background}" /></td>
				<td><c:out value="${row.speciality}" /></td>
				<td><c:out value="${row.foreign_language}" /></td>
				<td><c:out value="${row.grad_time}" /></td>
				<td><c:out value="${row.marriage}" /></td>
				<td><c:out value="${row.post}" /></td>
				<td><c:out value="${row.department}" /></td>
				<td><c:out value="${row.technical_title}" /></td>
				<td><c:out value="${row.state}" /></td>
				 	
			</tr>
		</c:forEach>
	</table>
</body>
</html>