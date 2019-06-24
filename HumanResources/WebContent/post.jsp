<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<head>
<title>部门和工作岗位显示界面</title>
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
SELECT * from post;
</sql:query>
 <sql:query dataSource="${snapshot}" var="result1">
SELECT * from department;
</sql:query>
	<center>
		<h1>部门和工作岗位显示</h1>
	</center>
	 <h4>部门：</h4>
<ul style="list-style-type:circle">
<c:forEach var="row" items="${result1.rows}">
				<li><c:out value="${row.department}" /></li>				 			 
				 	</c:forEach>  
</ul>  
<h4>工作岗位：</h4>
<ul style="list-style-type:circle">
<c:forEach var="row" items="${result.rows}">
 			<li><c:out value="${row.post}" /></li>
 		</c:forEach>
  </ul>  			 		
</body>
</html>