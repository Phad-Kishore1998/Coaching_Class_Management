<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Exam_id=request.getParameter("Exam_id");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM exam WHERE Exam_id="+Exam_id);
out.println("Data Deleted Successfully!");
String redirectURL = "ViewExam.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>