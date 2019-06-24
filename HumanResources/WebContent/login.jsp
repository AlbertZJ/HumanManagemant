<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
</head>
<body bgcolor="lightblue">
	<center>
		<h1 style="color: red">登录</h1>
		<form action="check_login.jsp" method="post">
			<!--
			  required:必须向输入框中输入内容
			  placeholder:输入框中默认文字
			  &nbsp:一个空格
			  -->
			<table border="0">
				<tr>
					<td>账号：</td>
					<td><input name="p_accounts" type="text" maxlength = "10" required="required"
						 /><br /></td>
				</tr>
				<tr>
					<td>密 码：</td>
					<td><input name="password" type="password" maxlength = "20" required="required"
						  /><br /></td>
				</tr>
				 
			</table>
			<br />
			<table width="200" border="1" bordercolor="#00f">
				<tr>
					<td><input type="submit" value="登录" /></td>
					<td> <input type="reset"
							value="重置" /> </td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>