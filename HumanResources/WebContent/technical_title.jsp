<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
    <%@page import="human.EmployeeDAO" %>
    <%@page import="human.Employee" %>
    <%@page import="java.util.List" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称的修改和删除界面</title>

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
 <script language="JavaScript" type="text/JavaScript">
		/* 是否全选标记 */
		var checkedAll = false;

		/* 全选/取消全选 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function selectAll(formName, checkboxName) {
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (checkedAll) {
					e.checked = false;
					form.alls.checked = false;
				} else {
					e.checked = true;
					form.alls.checked = true;
				}
			}
			if (checkedAll) {
				checkedAll = false;
			} else {
				checkedAll = true;
			}
		}
		/* 检查是否有checkbox被选中 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function checkAll(formName, checkboxName) {
			var hasCheck = false;
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (e.checked) {
					hasCheck = true;
				}
			}
			return hasCheck;
		}
		/* 执行操作 */
		function do_action() {
			if (!checkAll("formName", "no")) {
				alert("没有多选框被选中，若要提交至少选择一个！");
			return false;
			} /* else {
				alert("已有checkbox被选中，可以继续后续操作！");
			} */
			return true;
		}
	</script>
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/humanresources?useUnicode=true&characterEncoding=utf-8"
		user="root" password="123456" />
	 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from technical_title;
</sql:query>
  
  
<center>
<font face="楷体"   size="6" color="#000">职称的删除和修改</font>
	<form name="formName" action = "a_technical.jsp" method = "post" onsubmit = "return do_action()">
  	<table      border="1"  >
  	  <tr    height="10">
  	 <th><input type="checkbox" name="alls"
						onClick="selectAll('formName','no')" title="全选/取消全选"> 选择</th>
		 <th>编号</th>
			<th>职称种类</th>
			 		 
  	  </tr>
  	  
   
     
     
       
      <c:forEach var="row" items="${result.rows}">
      <tr>
      <td><input type="checkbox" name="no" title="选择/不选择"
						value="${row.id}"></td>
	 			<td   ><input type="text" name="id${row.id}" value="${row.id}"     readonly="readonly"/></td>
     
	 			  
	 			 <td>
	 			  <input type="text" name="technical_title${row.id}" value="${row.technical_title}" maxlength = "10"/>
	 			 
	 			 </td> 
	 			 </tr> 
		 	</c:forEach>
        
      
        
           
       	    
	   <tr       height="30">
 		<td colspan = "3" align = "center">
 		   <input type="submit" value="删除"  name="sub">  
 		  <input type="submit" value="修改"  name="sub">    
 		  <input type="reset" value="取消">
 		</td>
	  </tr>
	</table>	
    </form>
    </center> 
</body>
</html>