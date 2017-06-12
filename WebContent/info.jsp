<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.Order" %>

<%
    User u = new User("Teste","Test");
    if(session.getAttribute("user") != null) u = (User)session.getAttribute("user");

    String order;
    if(request.getParameter("remove") != null) {
        order = request.getParameter("remove");
        u.removeOrder(order);
        session.setAttribute("user", u);
    }
%>

<html>
    <head>
        <title>Info Page</title>
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
                        if(session.getAttribute("user") != null) {
                        %>
                        <a href="info.jsp" class="normal">Hi, <%= u.getUserID() %></a></br>
                        <a href="index.jsp?logout=1" class="normal">Logout</a>
                        <%
                            }else {
                        %>

                        <a href="signin.jsp" class="normal">Sign In</a>
                        <span> or </span>
                        <a href="signin.jsp" class="normal">Create an Account</a>
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
            <h1 align="center">Your Orders</h1>
            <%
                ArrayList<Order> orders = u.getOrders();
                if(orders.isEmpty()){
            %>
            <p> No orders made yet! </p>
            <%
                } else {
            %>
            <form action="info.jsp">
            <%
                for(Order o : orders){
            %>
                <p><%= o.showOrder() %><br>Remove: <input type="submit" name="remove" value="<%= o.getConf() %>"></p>
                <br>
                <br>
            <%
                }
            %>
            </form>
            <%
              }
            %>
        </aside>
    </body>
<html>
