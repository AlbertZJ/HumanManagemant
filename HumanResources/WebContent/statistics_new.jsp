<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息的统计界面</title>

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <style>
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
  <script>
  $(function() {
    $( document ).tooltip({
      track: true
    });
  });
  </script>
</head>
<body bgcolor="lightblue">
 
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/humanresources?useUnicode=true&characterEncoding=utf-8"
		user="root" password="123456" />
	<sql:query dataSource="${snapshot}" var="result1">
SELECT * from department;
</sql:query>
<sql:query dataSource="${snapshot}" var="result2">
SELECT * from technical_title;
</sql:query>
<sql:query dataSource="${snapshot}" var="result3">
SELECT * from post;
</sql:query>
 <sql:query dataSource="${snapshot}" var="result4">
SELECT * from think;
</sql:query>
 <center> 
	 <font face="楷体" size="6" color="#000"  >信息的统计</font>  
	</center>
	<form action = "think.jsp" method = "post" onsubmit = "return validate()" style="center">
  	<table width="300" height = "180" border="5"  align="center"    >
  	   
  	   
 	  <tr  >
 		<th   >性别：</th>
 		 
					<td  >
					<select name="sex"  >
					 
 		<option  >男</option>
 		<option  >女</option>
 		 
 		 
 		</select>
					 		</td>
			
 		 
 	  </tr>
 	   
 	  <tr>
 		<th>学历：</th>
 		<td>
 		<select name="edu_background">
 		 
 		<option  >专科</option>
 		<option  >本科</option>
 		<option  >硕士</option>
 		<option  >博士</option>
 		<option  >其他</option>
 		</select>
 		</td>
 	  </tr>
 	  <tr>
		<th>专业：</th>
		<td>
		<select name="speciality">
		 
 		<c:forEach var="row" items="${result4.rows}">
 		<option  ><c:out value="${row.speciality}" /></option>
 		 </c:forEach>
 		</select>
 		</td>
 	  </tr>
 	  <tr>
 		<th>外语情况：</th>
 		<td>
 		<select name="foreign_language">
 		 
 		<option  >英语</option>
 		<option  >法语</option>
 		<option  >西班牙语</option>
 		<option  >俄语</option>
 		 
 		</select>
 		 </td>
 	  </tr>
 	   
 	  <tr>
 		<th>婚姻状况：</th>
 		<td>
 		<select name="marriage">
 		 
 		<option  >已婚</option>
 		<option  >未婚</option>
 		 
 		</select>
 		</td>
 	  </tr>
 	   <tr>
		<th>工作岗位：</th>
		<td> 
        <select name="post">
         
 		<c:forEach var="row" items="${result3.rows}">
 		<option  ><c:out value="${row.post}" /></option>
 		 </c:forEach>
 		</select>
 		</td>
 	  </tr>
 	  <tr>
 		<th>所在部门：</th>
 		<td>
 		 
 		<select name="department">
 		 
 		<c:forEach var="row" items="${result1.rows}">
 		<option  ><c:out value="${row.department}" /></option>
 		 </c:forEach>
 		</select>
 		 
 		 
			 
 		 
 		</td>
 	  </tr>
 	  <tr>
 		<th>职称：</th>
 		<td>
 		<select name="technical_title">
 		 
 		<c:forEach var="row" items="${result2.rows}">
 		<option  ><c:out value="${row.technical_title}" /></option>
 		 </c:forEach>
 		</select>
 		</td>
 	  </tr>
 	  <tr>
 		<th>状态：</th>
 		<td>
 		<select name="state">
 		 
 		<option  >在职</option>
 		<option  >转出</option>
 		<option  >辞职</option>
 		<option  >辞退</option>
 		<option  >退休</option>
 		 
 		</select>
 		</td>
 	  </tr>
 	   
 	  
	  <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" value="确定">    
 		  <input type="reset" value="取消">
 		</td>
	  </tr>
	</table>
    </form>
     
</body>
</html>