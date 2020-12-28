<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/coaching";%>
<%!String user = "kishore";%>
<%!String psw = "kishore";%>
<%
String t_id = request.getParameter("t_id");
String nme=request.getParameter("Name");
String sub=request.getParameter("subject");
String mob=request.getParameter("Mobile");
String sal=request.getParameter("Salary");

if(t_id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(t_id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update teacher set t_id=?,Name=?,subject=?,Mobile=?,Salary=? where t_id="+t_id;
ps = con.prepareStatement(sql);
ps.setString(1,t_id);
ps.setString(2, nme);
ps.setString(3, sub);
ps.setString(4, mob);
ps.setString(5, sal);



int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
String redirectURL = "ViewTeach.jsp";
response.sendRedirect(redirectURL);
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>