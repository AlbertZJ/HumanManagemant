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
<title>查询信息界面</title>

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
 
	<center> <font face="楷体" size="6" color="#000"  >查询信息界面</font>  
	</center> <form action = "a_check.jsp" method = "post" onsubmit = "return validate()" style="center">
  	<table width="300" height = "180" border="5"  align="center" bordercolor="#A0A0A0"   >
  	   <tr>
  	   <th>员工的编号：</th>
		<td   ><input type="text" name="e_id"  maxlength = "16"  ></td>
 	  </tr>
  	    <tr>
		<th>员工的姓名：</th>
		<td   ><input type="text" name="e_name" title="输入员工的姓名" maxlength = "16"  ></td>
 	  </tr>  
 	   
 	   
 	  <tr>
 		<th>学历：</th>
 		<td>
 		<select name="edu_background">
 		<option></option>
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
		<option></option>
 		<c:forEach var="row" items="${result4.rows}">
 		<option  ><c:out value="${row.speciality}" /></option>
 		 </c:forEach>
 		</select>
 		</td>
 	  </tr>
 	   
 	   
 	  
 	   <tr>
		<th>工作岗位：</th>
		<td> 
        <select name="post">
        <option></option>
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
 		<option></option>
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
 		<option></option>
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
 		<option></option>
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
 		  <input type="submit" value="查询">    
 		  <input type="reset" value="重  置">
 		</td>
	  </tr>
	</table>
    </form>
     
</body>
</html>