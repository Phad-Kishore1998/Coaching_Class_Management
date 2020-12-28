package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class AddSubjController extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String sub_id = request.getParameter("Subj_id");
  String sub_name = request.getParameter("Subj_name");
  String t_id = request.getParameter("t_id");

 
  // validate given input
  if (sub_name.isEmpty() || sub_id.isEmpty() || t_id.isEmpty()) {
   RequestDispatcher rd = request.getRequestDispatcher("AddTeach.jsp");
   out.println("<font color=red>Please fill all the fields</font>");
   rd.include(request, response);
  } else 
  		{
   
			   try {
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    // loads mysql driver
			
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore"); 
			
			    String query = "insert into subject values(?,?,?)";
			
			    PreparedStatement ps = con.prepareStatement(query); // generates sql query
			
			    ps.setString(1,sub_id);
			    ps.setString(2,sub_name);
			    ps.setString(3,t_id);
			   
			
			    ps.executeUpdate(); // execute it on test database
			    System.out.println("successfuly inserted");
			    ps.close();
			    con.close();
			   } catch (ClassNotFoundException | SQLException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
			   }
		   RequestDispatcher rd = request.getRequestDispatcher("welcome.html");
		   rd.forward(request, response);
  		}
 }
}