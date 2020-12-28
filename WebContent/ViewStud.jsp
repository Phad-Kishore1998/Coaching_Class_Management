<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("studid");
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
<h1>Student DATABASE</h1>
<table border="1">
<tr>
<td>Student ID</td>
<td>First Name</td>
<td>Last Name</td>
<td>Mobile</td>
<td>Address</td>
<td>Classid</td>
<td>Results</td>
<td>Action</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from student";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("studid") %></td>
<td><%=resultSet.getString("FirstName") %></td>
<td><%=resultSet.getString("LastName") %></td>
<td><%=resultSet.getString("Mobile") %></td>
<td><%=resultSet.getString("Address") %></td>
<td><%=resultSet.getString("Classid") %></td>
<td><%=resultSet.getString("Results") %></td>
<td><a href="Update2.jsp?studid=<%=resultSet.getString("studid")%>"><button type="button" class="Update">Update</a>
<a href="Delete2.jsp?studid=<%=resultSet.getString("studid") %>"><button type="button" class="delete">Delete</button></a></td>
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