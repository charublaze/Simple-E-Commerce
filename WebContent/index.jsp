<!DOCTYPE html>
<%@page import="java.io.Console"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.UserList" %>

<html>
	<head>
		<title>Best Deal</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<header>
			<table width="100%">
                <tr>
                    <td width="75%">
                        <h1><a href="index.jsp">Internet Bazaar</a></h1>
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
							<!--  <li><a href="#" class="stylish">Weekly Deals</a></li>
							<li><a href="#" class="stylish">Contact</a></li>
							<li><a href="#" class="stylish">About us</a></li>-->
						</ul>
					</td>
					<td width="30%">
						<!-- <input type="text" name="search">
						<a href="#" class="stylish">Search it</a> -->
					</td>
					<td width="30%">
						<%
							String name = "User";
							String password = "";
							Integer ch = 3;
							User U = null;
							User u;
							if(request.getParameter("username") != null && request.getParameter("password") != null){
								name = request.getParameter("username");
								password = request.getParameter("password");
								//System.out.println(name);
								u = new User(name, password);
								session.setAttribute("user", u);
								ch = 1;
							}
							
							
							/*if(request.getParameter("logout") != null){
								System.out.println("fuck");
							}*/
							
							
							if(request.getParameter("logout") != null){
								System.out.println("F");
								session.removeAttribute("user");
								ch = 3;
							}

							if(session.getAttribute("user") != null) {
								u = (User)session.getAttribute("user");
								ch = 1;
						%>
						<a href="info.jsp" class="normal">Hi, <%= u.getUserID() %></a></br>
						<a href="index.jsp?logout=1" class="normal">Logout</a>
						<%
							} else {
						%>
						<%if(ch == 0) {%>
						Wrong username or password. Try Again.
						<%} %>
						<a href="signin.jsp" class="normal">Sign In</a>
						<span> or </span>
						<a href="signup.jsp" class="normal">Sign Up</a>
						<span> or </span>
						<a href="admin_signin.jsp" class="normal">Admin Sign In</a>
						<%
							}
						%>
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
			<h1 align="center">Deals</h1>
		</aside>
	</body>
<html>
