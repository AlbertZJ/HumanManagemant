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
	 
<sql:query dataSource="${snapshot}" var="result2">
SELECT * from technical_title;
</sql:query>
<sql:query dataSource="${snapshot}" var="result3">
SELECT * from think;
</sql:query>   
	<center>
		<h1>职称和专业的显示界面</h1>
	</center>
	<h4>职称：</h4>
<ul style="list-style-type:circle">
<c:forEach var="row" items="${result2.rows}">
 			<li><c:out value="${row.technical_title}" /></li>
 		</c:forEach>
  </ul>  
	 <h4>专业种类：</h4>
<ul style="list-style-type:circle">
<c:forEach var="row" items="${result3.rows}">
				<li><c:out value="${row.speciality}" /></li>				 			 
				 	</c:forEach>  
</ul>  
 			 			 
</body>
</html>