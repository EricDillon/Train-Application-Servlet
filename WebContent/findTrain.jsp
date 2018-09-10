<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train List</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div>
<h1>Reserve Train</h1>

<h2>Click on the "Reserve" button on the train you wish to reserve. You will be taken to a screen to
input passengers.</h2>
	<table border="2px solid black">
		<tr>
			<th>Train Number </th>
			<th>Train Name </th>
			<th>Train Source </th>
			<th>Train Destination </th>
			<th>Price </th>
			<th>Reserve</th>
		</tr>
		
		<%
			//TrainDAO td = new TrainDAO();
			//ArrayList<Train> ts = td.getTrains();
			ArrayList<Train> ts = (ArrayList<Train>)session.getAttribute("trainList");
			int num = 0;
			for (Train t : ts)
			{
				%>
					<tr>
						<td><%=t.getTrainNo() %></td>
						<td><%=t.getTrainName() %></td>
						<td><%=t.getSource() %></td>
						<td><%=t.getDestination() %></td>
						<td><%=t.getTicketPrice() %></td>
						<td><a href="ReserveTrain.jsp?trainNo=<%=t.getTrainNo() %>&n=<%=t.getTrainName() %>&s=<%=t.getSource() %>&d=<%=t.getDestination() %>&pr=<%=t.getTicketPrice() %>">Reserve</a></td>
					</tr>
				<%
			}
		%>
	</table>
</div>
</body>
</html>