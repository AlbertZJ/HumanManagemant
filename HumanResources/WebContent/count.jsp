<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.sql.*" %> 
 
<%//变量声明 
	java.sql.Connection sqlCon; //数据库连接对象 
	java.sql.Statement sqlStmt; //SQL语句对象 
	java.sql.ResultSet sqlRst; //结果集对象 
	java.lang.String strCon; //数据库连接字符串 
	java.lang.String strSQL; //SQL语句 
	int intPageSize; //一页显示的记录数 
	int intRowCount; //记录总数 
	int intPageCount; //总页数 
	int intPage; //待显示页码 
	java.lang.String strPage; 
	int i; 
	//设置一页显示的记录数 
	intPageSize = 2; 
	//取得待显示页码 
	strPage = request.getParameter("page"); 
	
	if(strPage==null)
	{//表明在QueryString中没有page这一个参数，此时显示第一页数据 
		intPage = 1; 
	} 
	else{//将字符串转换成整型 
		intPage = java.lang.Integer.parseInt(strPage); 
		if(intPage<1) intPage = 1; 
	} 
	//装载JDBC驱动程序 
	Class.forName("com.mysql.jdbc.Driver"); 
	//设置数据库连接字符串 
	strCon = "jdbc:mysql://localhost:3306/humanresources"; 
	//连接数据库 
	sqlCon = java.sql.DriverManager.getConnection(strCon,"root","123456"); 
	//创建一个可以滚动的只读的SQL语句对象 
	sqlStmt = sqlCon.createStatement();//准备SQL语句 
	strSQL = "select e_id,e_name,sex,age,edu_background,speciality,foreign_language,grad_time,marriage,post,department,technical_title,state from employee"; 
	//执行SQL语句并获取结果集 
	sqlRst = sqlStmt.executeQuery(strSQL); 
	//获取记录总数 
	sqlRst.last();//光标在最后一行 
	intRowCount = sqlRst.getRow();//获得当前行号 
	//记算总页数 
	intPageCount = (intRowCount+intPageSize-1) / intPageSize; 
	//调整待显示的页码,超过总页数则显示最后一页
	if(intPage>intPageCount) intPage = intPageCount; 
%> 

 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="lightblue">
<form method="POST" action="show_employee.jsp"> 
		第<%=intPage%>页 共<%=intPageCount%>页 
		
		<% if(intPage<intPageCount)//总页数大于当前页说明还有下一页
			{
		%>
		
		<a href="show_employee.jsp?page=<%=intPage+1%>">下一页 </a>
		
		<%
			}
		%> 
		<% if(intPage>1)//当前在第一页之后需要有上一页
			{
		%>
		
		<a href="show_employee.jsp?page=<%=intPage-1%>">上一页</a>
		<%
			}
		%> 
		
		转到第:<input type="text" name="page" size="8"> 页 
		<span>
			<input class=buttonface type="submit" value="GO"></span> 
	</form> 
	
	
	<table border="1" cellspacing="0" cellpadding="0"> 
		<tr> 
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
			 
		%> 
			<tr> 
			<td><%=e_id%></td> 
			<td><%=e_name%></td> 
			<td><%=sex%></td> 
			<td><%=age%></td> 
			<td><%=edu_background%></td> 
			<td><%=speciality%></td> 
			<td><%=foreign_language%></td> 
			<td><%=grad_time%></td> 
			<td><%=marriage%></td> 
			<td><%=post%></td> 
			<td><%=department%></td> 
			<td><%=technical_title%></td> 
			<td><%=state%></td> 
			</tr> 
		<% 
				sqlRst.next(); 
				i++; 
				} 
			} 
		%> 
	</table> 
	
	<% 
		//关闭结果集 
		sqlRst.close(); 
		//关闭SQL语句对象 
		sqlStmt.close(); 
		//关闭数据库 
		sqlCon.close(); 
	%>
 </body>
</html>