<!DOCTYPE html>
<%@page import="beans.Product"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>
<%@ page import ="java.sql.*" %>

<%
    Map<String, Product> catalogList = new HashMap<String, Product>();
	//Product P = new Product("name","type",0,0);
	try{
		int id = 0;
		String name = "";
       	String type= "";
       	int quantity=0;
       	int price=0;
       	String img = "";
	    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?" + "user=root&password=");    
	    PreparedStatement pst = conn.prepareStatement("SELECT id, name, type, quantity, price, img FROM products");
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
	       	img = rs.getString(6);
	       	Product P = new Product(0, "name","type",0,0);
	       	//out.println("name "+name);
	       	//out.println("pass "+pass);
	       	P.setId(id);
	       	P.setName(name);
	       	P.setType(type);
	       	P.setQuantity(quantity);
	       	P.setPrice(price);
	       	P.setImg(img);
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
            <form action="cart.jsp">
            <%
                Set set = catalogList.entrySet();
                Iterator i = set.iterator();
                String prod;
                int count = 0;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   Product PDT = (Product)me.getValue();
                   String comp = (String)PDT.getType();
                   //out.println(comp);
                   if(title.compareTo(comp) == 0){
                	   count++;
                       prod = (String)me.getKey();
			%>		<div style="float:left; width: 250px; padding: 10px">
						<h4><%= prod %></h4>
						<img src="<%= PDT.getImg() %>" width="200" height="100" alt="product image"/>
						<p> Description of <%= prod %></p>
						<p>Price : Rs. <%= PDT.getPrice() %> </p>
	                    <p>Buy: <input type="submit" name="product" value="<%= prod %>"></p>
                    </div>
			<%
                    }
                }
            %>
            </form>
        </aside>
    </body>
<html>
