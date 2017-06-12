package com.bean;

import java.sql.*;

import com.connect.DBConnection;

public class registerbean {



	private String name;
	
	private String email;
	private String pass;


	
	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}


	

	public int insertValue()
	{
		try
		{
			Connection con=DBConnection.getConn();
			PreparedStatement ps=con.prepareStatement("insert into register(name,password,email) values(?,?,?)");
	
		ps.setString(1,name);
		ps.setString(2,pass);
		ps.setString(3,email);
	
		
		int x=ps.executeUpdate();
		return x;
		}catch(Exception e)
		{
			return -1;
		}
	}
}
	

		
	

