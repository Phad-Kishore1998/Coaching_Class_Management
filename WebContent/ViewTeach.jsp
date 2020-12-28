<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/coaching";
String database = "coaching";
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
<!DOCTYPE html>
<html>
<style>
table {
  width:100%;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
table#t01 tr:nth-child(even) {
  background-color: #eee;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: black;
  color: white;
}
</style>
<body>
<div align="center">
<h1>Teacher DATABASE</h1>
<table border="1">
<tr>
<td>Teacher ID</td>
<td> Name</td>
<td>Subject</td>
<td>Mobile</td>
<td>Salary</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from teacher";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("t_id") %></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("subject") %></td>
<td><%=resultSet.getString("Mobile") %></td>
<td><%=resultSet.getString("Salary") %></td>
<td><a href="Update4.jsp?t_id=<%=resultSet.getString("t_id")%>"><button type="button" class="Update">Update</a>
<a href="Delete4.jsp?t_id=<%=resultSet.getString("t_id") %>"><button type="button" class="delete">Delete</button></a></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>