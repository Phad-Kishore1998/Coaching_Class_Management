<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String t_id=request.getParameter("t_id");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM teacher WHERE t_id="+t_id);
out.println("Data Deleted Successfully!");
String redirectURL = "ViewTeach.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>