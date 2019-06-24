<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员主界面导航</title>
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <script>
  $(function() {
    $( "#menu" ).menu();
  });
  </script>
  <style>
  .ui-menu { width: 150px; }
  </style>
</head>
<body bgcolor="lightblue">
	 	  
		<ul  id="menu">
			<li > <a>员工信息管理 </a>
			<ul>
			<li><a href="employee_news.jsp" target="mainFrame">员工信息添加</a></li>
			<li><a href="employee_archive.jsp" target="mainFrame">员工信息的删除和修改</a></li>
			
			<li><a href="show_employee.jsp" target="mainFrame">员工信息查询</a></li>
			 </ul>
			</li>
			  <br/>
			<li><a>部门和工作岗位信息管理</a>
			<ul>
			<li><a href="add_post.jsp" target="mainFrame">部门和工作岗位添加</a></li>
			<li><a href="department_archive.jsp" target="mainFrame">部门删除和修改</a></li>
			
			<li><a href="post_archive.jsp" target="mainFrame">工作岗位删除和修改</a></li>
			<li><a href="post.jsp" target="mainFrame">部门和工作岗位显示</a></li>
			
			</ul>
			</li>
			  <br/>
			 
			<li><a >职称信息的管理</a>
			 
			<ul>
			 
			 <li><a href="add_speciality.jsp" target="mainFrame">职称和专业的添加</a></li>
	
			 <li><a href="technical_title.jsp" target="mainFrame">职称的删除和修改</a></li>
	
			 <li><a href="speciality_archive.jsp" target="mainFrame">专业的删除和修改</a></li>
			<li><a href="speciality.jsp" target="mainFrame">职称和专业的显示</a></li>
	</ul>
			</li>

			  <br/>
			<li>
			<a >职工的档案管理</a>
			<ul>
			<li><a href="employee_news.jsp" target="mainFrame">员工信息添加</a></li>
		
			<li><a href="employee_archive.jsp" target="mainFrame">职工档案的删除和修改</a></li>
			<li><a href="show_employee.jsp" target="mainFrame">职工档案查询</a></li>
			
			 
			</ul>
			</li>
			  <br/>
			<li><a href="check.jsp" target="mainFrame">信息的查询</a></li>
	  <br/>
			<li><a href="statistics_new.jsp" target="mainFrame">信息的统计</a></li>
			 <br/>
			 
			 	</ul>
			   
			   
	   
</body>
</html>