<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.UserList" %>

<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from admin where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){           
           	//out.println("Valid login credentials");
           	String name=rs.getString(1);
           	String pass=rs.getString(2);
           	//out.println("name "+name);
           	//out.println("pass "+pass);
			request.setAttribute("name", username);
			request.setAttribute("password", name);
			request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
        else
           //out.println("Invalid login credentials");
			request.getRequestDispatcher("/admin_signin.jsp?valid=1").forward(request, response);
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again" +  e);       
   }      
%>
