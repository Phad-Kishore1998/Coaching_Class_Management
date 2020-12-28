<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String studid=request.getParameter("studid");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM student WHERE studid="+studid);
out.println("Data Deleted Successfully!");
String redirectURL = "ViewStud.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>