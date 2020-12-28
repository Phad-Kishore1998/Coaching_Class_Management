<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/coaching";%>
<%!String user = "kishore";%>
<%!String psw = "kishore";%>
<%
String Subj_id = request.getParameter("Subj_id");
String Sname=request.getParameter("Subj_name");
String TID=request.getParameter("t_id");

if(Subj_id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Subj_id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update subject set Subj_id=?,Subj_name=?,t_id=? where Subj_id="+Subj_id;
ps = con.prepareStatement(sql);
ps.setString(1,Subj_id);
ps.setString(2, Sname);
ps.setString(3, TID);


int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
String redirectURL = "ViewSubj.jsp";
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