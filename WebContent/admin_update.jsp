<!DOCTYPE html>
<%@page import="beans.Product"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>
<%@ page import ="java.sql.*" %>

<%
    Map<String, Product> catalogList = new HashMap<String, Product>();
	//Product P = new Product("name","type",0,0);
	int remove_success = 2;
	try{
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?" + "user=root&password=");
		
		//remove product
		if(request.getParameter("action") != null && request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			PreparedStatement pst = conn.prepareStatement("DELETE FROM products WHERE id = ?");
			pst.setInt(1, id);
			if(pst.executeUpdate() > 0) {
				remove_success = 1;
			} else {
				remove_success = 0;
			}
	    }	
		
		
		//fetch products
		int id = 0;
		String name = "";
       	String type = "";
       	int quantity = 0;
       	int price = 0;
	        
	    PreparedStatement pst = conn.prepareStatement("SELECT id, name, type, quantity, price FROM products");
	    //pst.setString(1, username);
	    //pst.setString(2, password);
	    ResultSet rs = pst.executeQuery();                        
	    while(rs.next()){           
	       	//out.println("Valid login credentials");
	       	id = rs.getInt(1);
	       	name = rs.getString(2);
	       	type = rs.getString(3);
	       	quantity = rs.getInt(4);
	       	price = rs.getInt(5);
	       	Product P = new Product(id, name, type, quantity, price);
	       	//out.println("name "+name);
	       	//out.println("pass "+pass);
	       	//P.setName(name);
	       	//P.setType(type);
	       	//P.setQuantity(quantity);
	       	//P.setPrice(price);
	       	catalogList.put(name, P);
	       	//out.println(name + " " + type);
	    }
	    
	    
	    
	}
	catch(Exception e){       
	   out.println("Something went wrong !! Please try again" +  e);       
	}

    request.setAttribute("catalogList", catalogList);
	session.setAttribute("catalogList", catalogList);

    String title = request.getParameter("product");

%>

<jsp:useBean id="entry" class="beans.StringBean" />
<jsp:setProperty
    name="entry"
    property="product"
    value='<%= request.getParameter("product") %>'/>

<html>
    <head>
        <title><jsp:getProperty name="entry" property="product" /></title>
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
				<li><button onclick="location.href='admin_add.jsp'">Add</button></li>
				<li><button onclick="location.href='admin_update.jsp'">Update</button></li>
				<!-- <li><button onclick="location.href='admin_order.jsp'">Orders</button></li>-->
			</ul>
        </nav>

        <aside>
            <h1 align="center">Deals</h1>
           
            <%
                Set set = catalogList.entrySet();
                Iterator i = set.iterator();
                String prod;
                int count = 0;
                if(remove_success == 1) {
                %>Product Removed Successfully
                <% } %>
                </br>
                <div align="center">
                	<table border="1" style="width: 70%; border-collapse: collapse;">
			            <tr>
			                <th>Sl No.</th>
			                <th>Product ID</th>
			                <th>Product Name</th>
			                <th>Quantity</th>
			                <th>Price</th>
			                <th>Action</th>
			            </tr>
                <%
                
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   Product PDT = (Product)me.getValue();
                   String comp = (String)PDT.getType();
                   //out.println(comp);
                	   count++;
                       prod = (String)me.getKey();
			%>		
			            <tr>
			                <td><%= count %></td>
			                <td><%= PDT.getId() %></td>
			                <td><%= PDT.getName() %></td>
			                <td><%= PDT.getQuantity() %></td>
			                <td><%= PDT.getPrice() %></td>
			                <td>
			                	<button onclick="location.href='admin_update.jsp?action=remove&id=<%= PDT.getId()%>'">Remove</button>
			                	<button onclick="location.href='admin_edit.jsp?id=<%= PDT.getId() %>&name=<%= PDT.getName() %>&type=<%= PDT.getType() %>&qty=<%= PDT.getQuantity() %>&price=<%= PDT.getPrice() %>'">Edit</button>
			                </td>
			            </tr>           		
			<%
                }
            %>
            </table>
            </div>
        </aside>
    </body>
<html>
