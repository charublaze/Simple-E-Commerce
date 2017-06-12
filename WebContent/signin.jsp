<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.UserList" %>

<%
	int valid = 2;
	if(request.getParameter("invalid") != null){
		valid = 0;
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
							<!-- <li><a href="#" class="stylish">Weekly Deals</a></li>
							<li><a href="#" class="stylish">Contact</a></li>
							<li><a href="#" class="stylish">About us</a></li>-->
						</ul>
					</td>
					<td width="30%">
						<!-- <input type="text" name="search">
						<a href="#" class="stylish">Search it</a> -->
					</td>
					<td width="30%">
						<a href="signin.jsp" class="normal">Sign In</a>
						<!-- <span> or </span>
						<a href="signin.jsp" class="normal">Create an Account</a> -->
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
			<h1 align="center">Sign in</h1>
			<%if(valid == 0) { %>
				Incorrect Username or Password. Try Again!!!
			<% } %>
			<form action="validate.jsp" method="post">
    		Username: <input type="text" name="username"><br>
    		Password: <input type="password" name="password"><br>
    		<input id="buybutton" type="submit" VALUE="OK">
   			</form>
		</aside>
	</body>
<html>
