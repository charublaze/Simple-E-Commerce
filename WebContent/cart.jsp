<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.User" %>
<%@page import="beans.Product"%>

<%
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    String product;
    if(request.getParameter("product") != null) {
        product = request.getParameter("product");
        c.setProduct(product);
        session.setAttribute("cart", c);
    }
    if(request.getParameter("remove") != null) {
        product = request.getParameter("remove");
        c.removeProduct(product);
        session.setAttribute("cart", c);
    }
    Map<String, Product> cL = null;
    if(session.getAttribute("catalogList") != null) {
    	cL = (Map<String, Product>)session.getAttribute("catalogList");
    	//out.println(session.getAttribute("catalogList"));
    	//Product P = (Product) cL.get("Sony");
    }
%>

<html>
    <head>
        <title>Cart</title>
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
            <h1 align="center">Cart</h1>
            <form action="cart.jsp">
            <%
                if(c.getProducts().isEmpty()){
            %>
                <p> Your Cart is Empty! </p>
                </form>
            <%
                } else {

                Set set = c.getProducts().entrySet();
                Iterator i = set.iterator();
                String prod;
                Integer count, sl = 0, total_price = 0, price, row_price;
                %>
                <div align="center">
                <table border="1" style="width: 70%; text-align: left; border-collapse: collapse;">
                <tr>
            	<th width="100px">
            		Sl. No.
            	</th>
            	<th>
            		Product
            	</th>
            	<th>
            		Quantity
            	</th>
            	<th>
            		Rate
            	</th>
            	<th>
            		Price
            	</th>
            	<th>
            		Action
            	</th>
            
            </tr>
                <%
                while(i.hasNext()) {
                	sl++;
                   Map.Entry me = (Map.Entry)i.next();
                   prod = (String)me.getKey();
                   Product P = (Product) cL.get(prod);
                   count = (Integer)me.getValue();
                   price = P.getPrice();
                   row_price = count * price;
                   total_price = total_price + row_price;
            %><tr>
            	<td>
            		<%= sl %>
            	</td>
            	<td>
            		<%= prod + " " + P.getType()%>
            	</td>
            	<td>
            		<%= count %>
            	</td>
            	<td>
            		<%= price %>
            	</td>
            	<td>
            		<%= row_price%>
            	</td>
            	<td>
            		<button type="submit" name="remove" value="<%= prod %>">Remove</button>
            	</td>
            
            </tr>
            <%
                    }
            %>
            </table>
            </br>
            <div style="padding-left: 60%;"> Total : Rs. <%= total_price %> </div>
            </div>
            </br>
            </br>
            
            <%if(session.getAttribute("user") == null){%>
            	Sign In to checkout  : 
            	<a href="signin.jsp" class="normal">Sign In</a>
            <%} else { %>
            </form>
            	<button onclick="location.href='checkout.jsp?total_price=<%= total_price %>'">Checkout</button>
            <%
            }
                }
            %>
        </aside>
    </body>
<html>
