<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String studid = request.getParameter("studid");
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
String sql ="select * from student where studid="+studid;
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
<h1>Update Data In Student Table</h1>
<div class="ex">
<form method="post" action="Update-process2.jsp">
<input type="hidden" name="studid" value="<%=resultSet.getString("studid") %>">
Stud_id:<br>
<input type="text" name="studid" value="<%=resultSet.getString("studid") %>">
<br>
FirstName:<br>
<input type="text" name="FirstName" value="<%=resultSet.getString("FirstName")%>">
<br>
LastName:<br>
<input type="text" name="LastName" value="<%=resultSet.getString("LastName") %>">
<br>
Mobile:<br>
<input type="text" name="Mobile" value="<%=resultSet.getString("Mobile") %>">
<br>
Address:<br>
<input type="text" name="Address" value="<%=resultSet.getString("Address") %>">
<br>
Classid:<br>
<input type="text" name="Classid" value="<%=resultSet.getString("Classid") %>">
<br>
Results:<br>
<input type="text" name="Results" value="<%=resultSet.getString("Results") %>">
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