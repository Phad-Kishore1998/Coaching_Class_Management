<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/coaching";%>
<%!String user = "kishore";%>
<%!String psw = "kishore";%>
<%
String studid = request.getParameter("studid");
String Fname=request.getParameter("FirstName");
String Lname=request.getParameter("LastName");
String Mobile=request.getParameter("Mobile");
String Addrss=request.getParameter("Address");
String Cls=request.getParameter("Classid");
String Rsl=request.getParameter("Results");
if(studid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(studid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update student set studid=?,FirstName=?,LastName=?,Mobile=?,Address=?,Classid=?,Results=? where studid="+studid;
ps = con.prepareStatement(sql);
ps.setString(1,studid);
ps.setString(2, Fname);
ps.setString(3, Lname);
ps.setString(4, Mobile);
ps.setString(5, Addrss);
ps.setString(6, Cls);
ps.setString(7, Rsl);


int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
String redirectURL = "ViewStud.jsp";
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