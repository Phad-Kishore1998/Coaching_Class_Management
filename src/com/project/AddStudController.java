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
public class AddStudController extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String s_id = request.getParameter("Studid");
  String fname = request.getParameter("FirstName");
  String lname = request.getParameter("LastName");
  String mob = request.getParameter("Mobile");
  String addr = request.getParameter("Address");
  String c_id = request.getParameter("Classid");
  String resul= request.getParameter("Results");
 


  // validate given input
  if (fname.isEmpty() || addr.isEmpty() || c_id.isEmpty() || mob.isEmpty() || s_id.isEmpty() || resul.isEmpty()) {
   RequestDispatcher rd = request.getRequestDispatcher("AddStud.jsp");
   out.println("<font color=red>Please fill all the fields</font>");
   rd.include(request, response);
  } else 
  		{
   
			   try {
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    // loads mysql driver
			
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore"); 
			
			    String query = "insert into student values(?,?,?,?,?,?,?)";
			
			    PreparedStatement ps = con.prepareStatement(query); // generates sql query
			
			    ps.setInt(1, Integer.parseInt(s_id));
			    ps.setString(2, fname);
			    ps.setString(3, lname);
			    ps.setString(4,mob);
			    ps.setString(5, addr);
			    ps.setString(6, c_id);
			    ps.setString(7, resul);
			    
			   
			
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