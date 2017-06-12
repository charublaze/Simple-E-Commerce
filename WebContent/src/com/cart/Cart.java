package com.cart;
import java.util.*;
import java.sql.*;

import com.connect.DBConnection;
public class Cart 
{
	private String name;
	private String productcode;
	private int price;
	private String description;
	private int quantity;

	private int[] action;
	
	private ArrayList<CartItem> al;
	
	

	//ArrayList<CartItem> cartlist=new ArrayList<CartItem>();
	//CartItem items=new CartItem();
	
	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public ArrayList<CartItem> addtocart(CartItem items, ArrayList<CartItem> al)
	{
		if(al.isEmpty())
		{
			al=new ArrayList<CartItem>();			
		}
		boolean b=al.add(items);
		System.out.println("cart is added :"+b);
		setCart(al);
		return al;				
	}
	
	
	public ArrayList removecart(int index,ArrayList al)
	{
		al.remove(index);
		return al;
		
	}

	public ArrayList<CartItem> update_cart(int quantity, int index,ArrayList<CartItem> al)
	{
		CartItem ci=al.get(index);
	
		al.set(index, ci);
		//removecart(index);
		//cartlist.add(items);
		return al;

	}
	
	
	public void setCart(ArrayList<CartItem> al)
	{
		if(al.isEmpty())
		{
			al=new ArrayList<CartItem>();			
		}
		this.al=al;		
	}
	
	public ArrayList<CartItem> getCart()
	{
		
		return al;
	}


	
	public boolean savecart(ArrayList<CartItem> al,String email)
	{
		try
		{
			
			Connection con=DBConnection.getConn();
			Statement st=con.createStatement();
			
			Iterator it=al.iterator();
			ResultSet rs=st.executeQuery("select * from collection where p_code='"+productcode+"'");
			
		
			
			String id=productcode;
			
			/*while(rs.next())
			{
				String username=rs.getString("name");
				id=rs.getString("email");
				String address=rs.getString("address");
			}
			*/
			
			//System.out.println(username);
			//System.out.println(id);
			//System.out.println(address);
			
			while(it.hasNext())
			{
				System.out.println("saving data");
				CartItem ci=(CartItem)it.next();
				
				int n=st.executeUpdate("insert into collection values('"+name+"','"+productcode+"','"+ci.getName()+"','"+ci.getProductcode()+"',"+ci.getPrice()+") ");
				
				
				System.out.println("n="+n);
				
				/*ps1.setString(1,username);
				ps1.setString(2,id);
				ps1.setString(3,address);
				ps1.setString(4,ci.getName());
				ps1.setString(5,ci.getCategory());
				ps1.setDouble(6,ci.getPrice());
				*/
				
				
			}
			
			return true;
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		
		
	}
public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	public String getProductcode() {
		return productcode;
	}


	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

    public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public ArrayList<CartItem> getAl() {
		return al;
	}


	public void setAl(ArrayList<CartItem> al) {
		this.al = al;
	}


	public void setAction(int[] action) {
		this.action = action;
	}


	public int[] getAction() {
		return action;
	}





		
	
	
}
