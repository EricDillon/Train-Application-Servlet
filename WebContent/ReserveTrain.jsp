<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fill out all information</title>
<link href="Style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
		
	 var addedPassengers = 0;
	
		function addRow()
		{
			addedPassengers++;
			if (addedPassengers > 5)
				{
				return;
				}
			document.getElementsByName("passengerCount")[0].value = addedPassengers.toString();
			

			var nameText = document.createTextNode("Name: ");
			var nameInput = document.createElement("input");
			nameInput.setAttribute("type", "text");
			nameInput.setAttribute("name", "txtName"+ addedPassengers);
			nameInput.setAttribute("class", "passengerInfo");
			
			var ageText = document.createTextNode("Age: ");
			var ageInput = document.createElement("input");
			ageInput.setAttribute("type", "text");
			ageInput.setAttribute("name", "txtAge" + addedPassengers);
			ageInput.setAttribute("class", "passengerInfo");
			
			var genderText = document.createTextNode("Gender: ");
			var genderInput = document.createElement("input");
			genderInput.setAttribute("type", "text");
			genderInput.setAttribute("name", "txtGender"+ addedPassengers);
			genderInput.setAttribute("class", "passengerInfo");
			
			var spanvar = document.createElement("span");
			spanvar.appendChild(nameText);
			spanvar.appendChild(nameInput);
			spanvar.appendChild(ageText);
			spanvar.appendChild(ageInput);
			spanvar.appendChild(genderText);
			spanvar.appendChild(genderInput);
			
			var linebreak = document.createElement("br");
			var linebreak2 = document.createElement("br");
			
			var currentSpan = document.getElementById("passengerForm");
			currentSpan.insertBefore(spanvar, document.getElementById("insertionPoint"));
			currentSpan.insertBefore(linebreak, document.getElementById("insertionPoint"));
			currentSpan.insertBefore(linebreak2, document.getElementById("insertionPoint"));
			//currentSpan.appendChild(linebreak);
			//currentSpan.appendChild(linebreak2);
			return addedPassengers;
		}
		function getAddedPassengers()
		{
			
		}
		
		function createTicket()
		{	
			
			for (var i = 0; i <= addedPassengers; i++)
				{	
					console.log(i)
			
					<% String name = request.getParameter("txtName0"); %> 
					var age = document.getElementById("txtAge" + i)
					var gndr = document.getElementById("txtGender" + i)
					console.log("${name}" + " " + age + "  " + gndr)
					
					
				}
		}
	</script>
</head>
<body>
		
<div>	
		<h1>Add Passengers for <%=request.getParameter("n") %> </h1>
		
		<h2 id="header">Please fill out the form below. </h2>
		<h2>Note: Date and first passenger must be filled out before clicking "Create Ticket." Incomplete data for subsequent passengers will
		not be added to the ticket. </h2>
		<%-- <button type="button" onclick="addRow('<%=addedPassengers %>');" value="New Passenger">New Passenger</button> --%>
		
		  <!-- <button type="button" onclick="createTicket();"  value="New Passenger">Create Ticket *CURRENTLY UNAVAILABLE*</button> -->
		
		 
		<hr><br>
		<form action="AddPassengerServlet" method=post id= "passengerForm">
			<button type="button" onclick="addRow()" value="New Passenger">Add New Passenger</button> <input type=submit value="Create Ticket"> <br>
			<br>
			<hr><br>
			Train: <br>
			<input type=text name="trainName" value= "<%=request.getParameter("n") %>" readonly><br>
			<input type=text name="trainNo" value= "<%=request.getParameter("trainNo") %>" readonly><br>
			<input type=text name="trainSource" value= "<%=request.getParameter("s") %>" readonly><br>
			<input type=text name="trainDestination" value= "<%=request.getParameter("d") %>" readonly><br>
			<input type=text name="trainPrice" value= "<%=request.getParameter("pr") %>" readonly><br> <hr>
			
			
			
			Enter Travel Date (MM/dd/yyyy): <input type="text" name="travelDate" required /><span style="color:red;">*</span>
			
			
			<hr><br>
			<!--  -->
			<input type=hidden name="passengerCount" value="0" readonly>
			<!--  -->
			Name: <input type="text" class="passengerInfo" name="txtName0" required> <span style="color:red;">*</span>
			Age: <input type="text" class="passengerInfo" name="txtAge0" required> <span style="color:red;">*</span>
			Gender:  <input type="text" class="passengerInfo" name="txtGender0" required>  <span style="color:red;">*</span> <br><br>

			<span id="insertionPoint"></span>
			
			
		<br><br>
		Enter Credit Card Information: <br>
			Card #: <input type="text" name="cardNum" maxlength="16" required/><span style="color:red;">*</span><br>
			 Expire date (mm/yyyy):  <select name="cardExpMonth" required>
				<% for (int i = 1; i < 13; i++)
					{
						%>
						<option value =<%=i %>><%=i %></option>
						<%
					}
					%>
				</select><span style="color:red;">*</span>
				<select name="cardExpYear" required>
				<% for (int i = 2018; i < 2038; i++)
					{
						%>
						<option value =<%=i %>><%=i %></option>
						<%
					}
					%>
				</select><span style="color:red;">*</span>
				 <br>
		</form>

	</div>
</body>
</html>