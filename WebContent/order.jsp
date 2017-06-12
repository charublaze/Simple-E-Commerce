<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.Order" %>
<%@ page import="beans.User" %>
<%
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    int price = 0;
    if(request.getParameter("total_price") != null) {
    	price = Integer.parseInt(request.getParameter("total_price"));
    }
    Order o = new Order();
    o.setFirst(request.getParameter("firstname"));
    o.setLast(request.getParameter("lastname"));
    o.setAddress(request.getParameter("address1") + " - " +request.getParameter("address2") + ", " + request.getParameter("city") + " - " + request.getParameter("state") + ", " + request.getParameter("country") + ", " + request.getParameter("zipcode"));
    o.setCard(request.getParameter("creditcard"));
    o.setName(request.getParameter("nameprinted"));
    o.setDate(request.getParameter("expiration"));
    o.setCvc(request.getParameter("cvc"));
    o.setTotal_price(price);
    o.setProducts(c.getProducts());
    User u = new User("Guest","pass");
    if(session.getAttribute("user") != null) u = (User)session.getAttribute("user");
    u.setOrder(o);
    session.setAttribute("user", u);
    

%>

<html>
    <head>
        <title>Confirmation Page</title>
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
                            <li><a href="#" class="stylish">Weekly Deals</a></li>
                            <li><a href="#" class="stylish">Contact</a></li>
                            <li><a href="#" class="stylish">About us</a></li>
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
            <% Date date = new Date(); %>
            <h1 align="center">Confirmation Page</h1>
            <h3><%= u.getUserID() %>, thank you for you purchase on <%= date %>!</h3>
            <%
                String orderstring = o.toString();
            %>
            <p><%= orderstring %>
            <%
                Set set = c.getProducts().entrySet();
                Iterator i = set.iterator();
                String prod;
                Integer count;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   prod = (String)me.getKey();
                   count = (Integer)me.getValue();
            %>
                    <br>* <%= prod %> - <%= count %>
            <%
                    }

                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DAY_OF_MONTH, 14);
                date = calendar.getTime();

                SimpleDateFormat s = new SimpleDateFormat("MM/dd/yy");
            %>
                    <br><br>Delivery Date: <%= s.format(date) %>
            </p>
            <form action="index.jsp">
                <input type="submit" value="OK">
            </form>
            <% 
                c = new Cart();
                session.setAttribute("cart", c); 
            %>
        </aside>
    </body>
<html>
