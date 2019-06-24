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
<body bgcolor="lightblue">
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
			 	String sex = (String) request.getParameter("sex");//取出login.jsp的值
				 String edu_background = (String) request.getParameter("edu_background");
				String speciality = (String) request.getParameter("speciality");//取出login.jsp的值
				String foreign_language = (String) request.getParameter("foreign_language");
			 	String marriage = (String) request.getParameter("marriage");//取出login.jsp的值
				String post = (String) request.getParameter("post");
				String department = (String) request.getParameter("department");
				String technical_title = (String) request.getParameter("technical_title");//取出login.jsp的值
				String state; 
				state = (String) request.getParameter("state");				 
				Boolean pwd;
				 int rowCount = 0,rowCount1 = 0,rowCount2 = 0,rowCount3 = 0,rowCount4 = 0,rowCount5 = 0,rowCount6 = 0,rowCount7 = 0,rowCount8 = 0;  
				ResultSet rs = stmt.executeQuery("select count(sex) a from employee where sex='"+sex+"' "); 
				if(rs.next()) { 
					 rowCount=rs .getInt("a"); 
						}
				 rs  = stmt.executeQuery("select count(edu_background) a from employee  where edu_background='"+edu_background+"' "); 
				if(rs.next()) { 
					 rowCount1=rs .getInt("a"); 
						}
				 rs = stmt.executeQuery("select count(speciality) a from employee where speciality='"+speciality+"' "); 
 			 if(rs.next()) { 
				 rowCount2=rs .getInt("a"); 
					}
 			 rs  = stmt.executeQuery("select count(foreign_language) a from employee where foreign_language='"+foreign_language+"'"); 			
 			if(rs.next()) { 
				 rowCount3=rs .getInt("a"); 
					}
			 rs  = stmt.executeQuery("select count(marriage) a from employee where marriage='"+marriage+"'"); 
			if(rs.next()) { 
				 rowCount4=rs .getInt("a"); 
					}
			 rs = stmt.executeQuery("select count(post) a from employee where post='"+post+"' "); 
		 if(rs.next()) { 
			 rowCount5=rs .getInt("a"); 
				}
		 rs = stmt.executeQuery("select count(department) a from employee where department='"+department+"' "); 
		 if(rs.next()) { 
			 rowCount6=rs .getInt("a"); 
				}		 
		 rs  = stmt.executeQuery("select count(technical_title) a from employee   where technical_title='"+technical_title+"'"); 
			if(rs.next()) { 
				 rowCount7=rs .getInt("a"); 
					}
			 rs = stmt.executeQuery("select count(state) a from employee where state='"+state+"' "); 
		 if(rs.next()) { 
			 rowCount8=rs .getInt("a"); 
				}
		%>
		  <p><%=sex %>性人数： <%=rowCount %> </p><br/>
		 <p><%=edu_background %>学历人数：  <%=rowCount1 %> </p>
		  <p><%=speciality %>专业人数：  <%=rowCount2 %> </p><br/>
		  <p>外语为<%=foreign_language %>的人数：  <%=rowCount3 %> </p>
		   <p><%=marriage %>人数：  <%=rowCount4 %> </p>
		    <p>工作岗位为<%=post %>的人数：  <%=rowCount5 %> </p>
		     <p><%=department %>的人数：  <%=rowCount6 %> </p>
		   
		   <p><%=technical_title %>职称的人数：  <%=rowCount7 %> </p>
		    <p><%=state %>状态的人数：  <%=rowCount8 %> </p>
		     
		    <%--
		     <p>初级程序员人数： <%=rowCount7 %> </p><br/>
		 <p>中级程序员人数：  <%=rowCount8 %> </p>
		  <p>高级程序员人数：  <%=rowCount9 %> </p><br/>
		  <p>本科学历人数：  <%=rowCount3 %> </p>
		   <p>专科学历人数：  <%=rowCount4 %> </p>
		    <p>研究生学历人数：  <%=rowCount5 %> </p>
		     <p>博士学历人数：  <%=rowCount6 %> </p> 
		          
		已婚人数：<h3> <%=rowCount %> </h3>
		未婚人数：<h3> <%=rowCount %> </h3>
		 中级程序员人数：<h3> <%=rowCount %> </h3>
		 在职人数：<h3> <%=rowCount %> </h3>
		  转出人数：<h3> <%=rowCount %> </h3>
		退休人数：<h3> <%=rowCount %> </h3> --%>
		  
		<% 
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
	 
		 
		<%-- <th>员工的姓名</th>
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
			if(intPageCount>0){ 
			//将记录指针定位到待显示页的第一条记录上 
			sqlRst.absolute((intPage-1) * intPageSize + 1); 
			//显示数据 
			i = 0; 
			String e_id,e_name,sex,age,edu_background,speciality,
			foreign_language,grad_time,marriage,post,department,technical_title,state; 
			while(i<intPageSize && !sqlRst.isAfterLast()){ 
			e_id=sqlRst.getString(1); 
			e_name=sqlRst.getString(2); 
			sex=sqlRst.getString(3); 
			age=sqlRst.getString(4); 
			edu_background=sqlRst.getString(5); 
			speciality=sqlRst.getString(6); 
			foreign_language=sqlRst.getString(7); 
			grad_time=sqlRst.getString(8); 
			marriage=sqlRst.getString(9); 
			post=sqlRst.getString(10); 
			department=sqlRst.getString(11); 
			technical_title=sqlRst.getString(12); 
			state=sqlRst.getString(13); 
			 
		 
		 
	   --%>
	
</body>
</html>