<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Data</title>
</head>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<body>
	<div class="container">
	<h1>Add Student Details</h1>
	<div class="ex">
		<form action="AddStudController" method="post">
		<fieldset>
    	<legend>Student Form:</legend>
					<table style="with: 50%">
						<tr>
							<td>Studid</td>
							<td><input type="text" name="Studid" /></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type="text" name="FirstName" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" name="LastName" /></td>
						</tr>
						<tr>
							<td>Mobile</td>
							<td><input type="text" name="Mobile" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" name="Address" /></td>
						</tr>
						<tr>
							<td>Classid</td>
							<td><input type="text" name="Classid" /></td>
						</tr>
						<tr>
							<td>Results</td>
							<td><input type="text" name="Results" /></td>
						</tr>
					</table>
					<a href="welcome.html">
				<input type="submit" value="Register" />
				</a>
			</fieldset>
		</form>
		<br>
				
	</div>
	
</div>
</body>
</html>