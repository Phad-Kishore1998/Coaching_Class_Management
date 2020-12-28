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
	<h1>Add Teacher Details</h1>
	<div class="ex">
		<form action="AddTeachController" method="post">
			<table style="with: 50%">
				<tr>
					<td>Teachid</td>
					<td><input type="text" name="t_id" /></td>
				</tr>
				<tr>
					<td>Full Name</td>
					<td><input type="text" name="Name" /></td>
				</tr>
				<tr>
					<td>Subject</td>
					<td><input type="text" name="Subject" /></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="Mobile" /></td>
				</tr>
				
				<tr>
					<td>Salary</td>
					<td><input type="text" name="Salary" /></td>
				</tr>
			</table>
			<a href="welcome.html">
			<input type="submit" value="Register" />
			</a>
		</form>
		<br>
					
	</div>
</body>
</html>