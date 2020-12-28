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
public class AddExamController extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String ex_id = request.getParameter("Exam_id");
  String mrks = request.getParameter("Marks");
  String yr = request.getParameter("Year");
  String rs = request.getParameter("Results");
 
  // validate given input
  if (mrks.isEmpty() || yr.isEmpty() || rs.isEmpty() || ex_id.isEmpty() ) {
   RequestDispatcher rd = request.getRequestDispatcher("AddTeach.jsp");
   out.println("<font color=red>Please fill all the fields</font>");
   rd.include(request, response);
  } else 
  		{
   
			   try {
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    // loads mysql driver
			
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching", "kishore", "kishore"); 
			
			    String query = "insert into exam values(?,?,?,?)";
			
			    PreparedStatement ps = con.prepareStatement(query); // generates sql query
			
			    ps.setString(1,ex_id);
			    ps.setString(2,mrks);
			    ps.setString(3,yr);
			    ps.setString(4,rs);
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