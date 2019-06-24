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
<title>添加部门和工作岗位界面</title>

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
	 
<sql:query dataSource="${snapshot}" var="result3">
SELECT * from post;
</sql:query>
 	<center>  <font face="楷体" size="6" color="#000"  >添加部门和工作岗位</font>  
	</center>
	<form action = "a_post.jsp" method = "post" onsubmit = "return validate()" style="center">
  	<table   border="1"  align="center" bordercolor="#A0A0A0"   >
 	   <tr>
 	   <th>编号</th>
 	   <th >添加部门</th>
		<th >添加工作岗位</th>		 
 	  </tr>
 	   <tr>
 	   <td>1:</td>
 	   <td>  
        <input type="text" name="department1" title="输入部门" maxlength = "10" value=""  >
 		 </td>
 	   <td>  
        <input type="text" name="post1" title="输入工作岗位" maxlength = "10"   >
 		 </td>		 
 	   </tr>
 	  <tr>
 	  <td>2:</td>
 	  <td>  
        <input type="text" name="department2"   maxlength = "10"   >
 		 </td>
 	   <td>  
        <input type="text" name="post2"   maxlength = "10"   >
 		 </td> 		 
 	   </tr>
 	   <tr>
 	   <td>3:</td>
 	   <td>  
        <input type="text" name="department3"   maxlength = "10"   >
 		 </td>
 	   <td>  
        <input type="text" name="post3"   maxlength = "10"   >
 		 </td> 		 
 	   </tr>
 	   <tr>
 	   <td>4:</td>
 	   <td>  
        <input type="text" name="department4"   maxlength = "10"  >
 		 </td>
 	   <td>  
        <input type="text" name="post4"   maxlength = "10"  >
 		 </td> 		 
 	   </tr>
 	   <tr>
 	   <td>5:</td>
 	   <td>  
        <input type="text" name="department5" title="输入部门" maxlength = "10"  >
 		 </td>
 	   <td>  
        <input type="text" name="post5" title="输入工作岗位" maxlength = "10"  >
 		 </td>		 
 	   </tr>
	  <tr>
 		<td colspan = "3" align = "center">
 		  <input type="submit" name="sub" value="增加">    
 		  <input type="reset" value="取消">
 		</td>
	  </tr>
	</table>
    </form>     
</body>
</html>