<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.User" %>

<%
    Cart c = new Cart();
	int price = 0;
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    if(request.getParameter("total_price") != null) {
    	price = Integer.parseInt(request.getParameter("total_price"));
    }
    
%>

<html>
    <head>
        <title>Checkout</title>
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
                            <li><a href="#" class="stylish">About us</a></li> -->
                        </ul>
                    </td>
                    <td width="30%">
                        <!-- <input type="text" name="search">
						<a href="#" class="stylish">Search it</a> -->
                    </td>
                    <td width="30%">
                        <%
                        User u;
                        if(session.getAttribute("user") != null) {
                            u = (User)session.getAttribute("user");
                        %>
                        <a href="info.jsp" class="normal">Hi, <%= u.getUserID() %></a></br>
                        <a href="index.jsp?logout=1" class="normal">Logout</a>
                        <%
                            }else {
                        %>

                        <a href="signin.jsp" class="normal">Sign In</a>
                        <!-- <span> or </span>
                        <a href="signin.jsp" class="normal">Create an Account</a> -->
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
            <form action="order.jsp">
                <h1 align="center">Checkout</h1>
                Enter details for payment of Rs. <%= price %> : </br></br>
                First name: <input type="text" name="firstname"><br>
                Last name: <input type="text" name="lastname"><br>

                Address Line 1: <input type="text" name="address1"><br>
                Address Line 2: <input type="text" name="address2"><br>
                City: <input type="text" name="city"><br>
                State: <input type="text" name="state"><br>
                Zip Code: <input type="text" name="zipcode"><br>
                Country: <input type="text" name="country"><br>

                Credit Card: <input type="text" name="creditcard"><br>
                Name Printed: <input type="text" name="nameprinted"><br>
                Expiration Date: <input type="text" name="expiration"><br>
                CVC: <input type="text" name="cvc"><br>
                <br>
                <input type="hidden" name="total_price" value=<%= price %>>
                <input type="submit" value="Confirm">
            </form>
        </aside>
    </body>
<html>
