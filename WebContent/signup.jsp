<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.UserList" %>

<%@ page import ="java.sql.*" %>

<%
	Integer check=3;
	try{
		if(request.getParameter("username") != null && request.getParameter("password") != null){
		    String username = request.getParameter("username");   
		    String password = request.getParameter("password");
		    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?" + "user=root&password=");    
		    PreparedStatement pst = conn.prepareStatement("INSERT INTO customers (username, password) VALUES (? , ? )");
		    pst.setString(1, username);
		    pst.setString(2, password);
		    if(pst.executeUpdate() > 0){
		    	check = 0;
		    } else {
		    	check = 1;
		    }
		}
		
	} catch(Exception e){
		if (e instanceof SQLIntegrityConstraintViolationException) {
	        // Duplicate entry
	        check = 1;
	    }
    //out.println("Something went wrong !! Please try again " +  e);  
		check = 1;
}
%>

<html>

	<head>
		<title>Sign in</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<header>
			<table width="100%">
                <tr>
                    <td width="75%">
                        <h1><a href="index.jsp">Best Deal</a></h1>
                    </td>
                    <td width="25%">
                        <a href="cart.jsp"><img src="img/cart.jpg" alt="cart" width="80" height="80"/></a>
                    </td>
                </tr>
            </table>
		</header>
		<section>
			<table width="100%">
				<tr height="40px">
					<td width="40%">
						<ul>
							<li><a href="index.jsp" class="stylish">Home</a></li>
							<li><a href="#" class="stylish">Weekly Deals</a></li>
							<li><a href="#" class="stylish">Contact</a></li>
							<li><a href="#" class="stylish">About us</a></li>
						</ul>
					</td>
					<td width="30%">
						<input type="text" name="search">
						<a href="#" class="stylish">Search it</a>
					</td>
					<td width="30%">
						<a href="signin.jsp" class="normal">Sign In</a>
						<span> or </span>
						<a href="signup.jsp" class="normal">Create an Account</a>
					</td>
				</tr>
			</table>
		</section>
		<nav>
			<ul>
				<form action="catalog.jsp">
				<li><input type="submit" name="product" value="Phones"></li>
				<li><input type="submit" name="product" value="Tablets"></li>
				<li><input type="submit" name="product" value="Laptop"></li>
				<li><input type="submit" name="product" value="TV"></li>
				</form>
			</ul>
		</nav>

		<aside>
			<h1 align="center">Sign In or Sign Up</h1>
			<form action="signup.jsp" method="post">
			<%if(check == 1){ %>
			Username already exist
			<%} else if(check == 0){ %>
			Signup Successful &nbsp&nbsp			
			<a href="index.jsp" class="stylish">Go to Sign In</a></br></br>
			<%} %>
			</br>
    		Username: <input type="text" name="username"><br>
    		Enter Password: <input type="password" name="password"><br>
    		<input id="buybutton" type="submit" VALUE="OK">
   			</form>
		</aside>
	</body>
<html>
