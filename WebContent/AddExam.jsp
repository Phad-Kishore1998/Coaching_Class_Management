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
	<h1>Add Exam Details</h1>
	<div class="ex">
		<form action="AddExamController" method="post">
			<table style="with: 50%">
				<tr>
					<td>Examid</td>
					<td><input type="text" name="Exam_id" /></td>
				</tr>
				<tr>
					<td>Marks</td>
					<td><input type="text" name="Marks" /></td>
				</tr>
				<tr>
					<td>Year</td>
					<td><input type="text" name="Year" /></td>
				</tr>
				<tr>
					<td>Results</td>
					<td><input type="text" name="Results" /></td>
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