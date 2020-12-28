<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Exam_id = request.getParameter("Exam_id");
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
String sql ="select * from Exam where Exam_id="+Exam_id;
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
<h1>Update Data In Exam Table</h1>
<div class="ex">
<form method="post" action="Update-process.jsp">
<input type="hidden" name="Exam_id" value="<%=resultSet.getString("Exam_id") %>">
Exam_id:<br>
<input type="text" name="Exam_id" value="<%=resultSet.getString("Exam_id") %>">
<br>
Marks:<br>
<input type="text" name="Marks" value="<%=resultSet.getString("Marks")%>">
<br>
Year:<br>
<input type="text" name="Year" value="<%=resultSet.getString("Year") %>">
<br>
Result:<br>
<input type="text" name="Results" value="<%=resultSet.getString("Results") %>">
<br><br>
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