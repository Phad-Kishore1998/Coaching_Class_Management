<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String t_id = request.getParameter("t_id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/coaching";

String userid = "kishore";
String password = "kishore";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from teacher where t_id="+t_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<body>
<h1>Update Data In Teacher Table</h1>
<div class="ex">
<form method="post" action="Update-process4.jsp">
<input type="hidden" name="t_id" value="<%=resultSet.getString("t_id") %>">
Teacher_id:<br>
<input type="text" name="t_id" value="<%=resultSet.getString("t_id") %>">
<br>
SubjectName:<br>
<input type="text" name="Name" value="<%=resultSet.getString("Name")%>">
<br>
<input type="text" name="subject" value="<%=resultSet.getString("subject")%>">
<br>
Teacher ID:<br>
<input type="text" name="Mobile" value="<%=resultSet.getString("Mobile") %>">
<br>
<input type="text" name="Salary" value="<%=resultSet.getString("Salary")%>">
<br>

<input type="submit" value="submit">

</form>
</div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>