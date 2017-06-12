<!DOCTYPE html>
<%@page import="beans.Product"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>
<%@ page import ="java.sql.*" %>

<%
	int edit_success = 2;
	String name = "";
	String type= "";
	int quantity=0;
	int price=0;
	int id = 0;
	
	try{			
	       	if(request.getParameter("id") != null && request.getParameter("name") != null && request.getParameter("type") != null && request.getParameter("qty") != null && request.getParameter("price") != null) {
	       		id = Integer.parseInt(request.getParameter("id"));
	       		name = request.getParameter("name");
	       		type = request.getParameter("type");
	       		quantity = Integer.parseInt(request.getParameter("qty"));
	       		price = Integer.parseInt(request.getParameter("price"));	       	
	       	
		   		if(request.getParameter("action") != null) {
				    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
				    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?" + "user=root&password=");    
				    PreparedStatement pst = conn.prepareStatement("UPDATE products SET name=?, type =?, quantity=?, price=? WHERE id = ?");
				    pst.setString(1, name);
				    pst.setString(2, type);
				    pst.setInt(3, quantity);
				    pst.setInt(4, price);
				    pst.setInt(5, id);
				    if(pst.executeUpdate() > 0) {           
				       	//out.println("Valid login credentials");
				       	edit_success = 1;
				    } else {
				    	edit_success = 0;
			    	}       
				}
			}
	}	catch(Exception e){       
		   out.println("Something went wrong !! Please try again" +  e); 
	}

%>

<html>
    <head>
        <title>Add Product</title>
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
                            } else {
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
                <li><button onclick="location.href='admin_add.jsp'">Add</button></li>
				<li><button onclick="location.href='admin_update.jsp'">Update</button></li>
				<!-- <li><button onclick="location.href='admin_order.jsp'">Orders</button></li>-->
            </ul>
        </nav>

        <aside>
            <h1 align="center">Add Product</h1>
            <aside>
            <%if(edit_success == 1) { %>
            	Product edited Successfully
            <% } %>
            <%if(edit_success == 0) { %>
            	Product not edited
            <% } %>
            <form action="admin_edit.jsp">
            <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="<%= name%>"><br></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><select name="type">
					  <option value="Phones">Phones</option>
					  <option value="Tablets">Tablets</option>
					  <option value="Laptop">Laptop</option>
					  <option value="TV">TV</option><br>
				</td>
            </tr>
            <tr>
                <td>Quantity: </td>
                <td><input type="text" name="qty" value="<%= quantity%>"><br></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" value="<%= price%>"><br></td>
            </tr>
            	<input type="hidden" name="action" value="edit">
            	<input type="hidden" name="id" value=<%= id %>>
                <br>
             </table>
                <input type="submit" value="Edit">
              </form>
        </aside>
            </form>
        </aside>
    </body>
<html>
