<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Subj_id=request.getParameter("Subj_id");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM subject WHERE Subj_id="+Subj_id);
out.println("Data Deleted Successfully!");
String redirectURL = "ViewSubj.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>