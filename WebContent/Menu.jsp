<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train App Menu</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<h1>Welcome, ${Username }</h1>

	<h2>Select a train by searching either the train id number OR via source and Destination </h2>
	<form action="FindTrainServlet" method=post>
		Train Id: <input type="text" name="txtTrainID">
		
		<hr>
		<%TrainDAO tdao = new TrainDAO();
			ArrayList<String> sources = tdao.getStations("source");
			ArrayList<String> destinations = tdao.getStations("destination");
			%>
		Source : <select name="trainSource">
				<% for (String s : sources)
					{
						%>
						<option value =<%=s %>><%=s %></option>
						<%
					}
					%>
				<!-- <option value =""></option>
				<option value ="Bangalore">Bangalore</option> -->
				</select>
		Destination : <select name="trainDestination">
				<% for (String s : destinations)
					{
						%>
						<option value =<%=s %>><%=s %></option>
						<%
					}
					%>
				</select>
				<hr>
				<input type=submit value="submit">
	</form>	
	<!-- <a href="findTrain.jsp">Search for a Train</a> -->
</div>


</body>
</html>