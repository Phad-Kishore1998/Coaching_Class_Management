<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/coaching";%>
<%!String user = "kishore";%>
<%!String psw = "kishore";%>
<%
String Exam_id = request.getParameter("Exam_id");
String mrks=request.getParameter("Marks");
String year=request.getParameter("Year");
String res=request.getParameter("Results");
if(Exam_id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Exam_id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update exam set Exam_id=?,Marks=?,Year=?,Results=? where Exam_id="+Exam_id;
ps = con.prepareStatement(sql);
ps.setString(1,Exam_id);
ps.setString(2, mrks);
ps.setString(3, year);
ps.setString(4, res);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
String redirectURL = "ViewExam.jsp";
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