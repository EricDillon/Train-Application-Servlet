<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to the Train Reservation System</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		<h1>Welcome to the Train Application</h1>
	
		<h2>Please Log Ln</h2>
		<form action="LoginServlet" method=post>
			<table>
				<tr>
					<td>Username:</td> <td><input type=text name="txtName"></td>
				</tr>
				<tr>
					<td>Password: </td> <td> <input type=password name="txtPass"></td>
				</tr>
				
				<tr>
					<td><input type=submit id="login" value="Login"></td>
				</tr>
			</table>
		</form>
		<hr>
		New User? <br>
		<form action="Register.jsp">
			<input type=submit value="Register">
		</form>
	</div>
</body>
</html>