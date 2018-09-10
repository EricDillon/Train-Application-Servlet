<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Complete</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>

<body>
<script type="text/javascript">
	function writeTicket(ticket)
	{
		
		Ticket.writeTicket(ticket);
	}

</script>
	<div>
		<h1>Ticket has been created</h1>
		 <pre>${tickObj.getTicket()}</pre> 

		 <form action="downloadTicket" method=post>
			<input type=hidden name="txtTicket" value="${ticketobj }" />
			<input type=submit value="Download Ticket to Desktop" style="width: 200px;">
		</form> 
	</div>
</body>
</html>