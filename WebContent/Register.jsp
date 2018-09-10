<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register New User</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		<% Random r = new Random();
	   	String randomNumber = String.format("%04d", r.nextInt(1001)); %>
	
		<form action="RegisterServlet" method=post>
			Username: <input type=text name="txtName"><br>
			Password: <input type=password name="txtPass"><br>
			Email: <input type=text name="txtEmail"><br> 
			Captcha: <input type=text name="generatedCaptcha" value="<%=randomNumber %>" readonly> 
			<br>
			Enter Captcha: <input type=text name="txtCaptcha"> <br>
	
			<input type=submit value="Register">
		</form>
	
	</div>
</body>
</html>