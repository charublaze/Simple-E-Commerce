package com.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.connect.DBConnection;

public class contactbean {
	private String name;
	private String email;
	private String subject;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int insertValue()
	{
		try
		{
			Connection con=DBConnection.getConn();
			PreparedStatement ps=con.prepareStatement("insert into contact(name,email,subject,message) values(?,?,?,?)");
	
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,subject);
		ps.setString(4,message);
		
		
		int x=ps.executeUpdate();
		return x;
		}catch(Exception e)
		{
			return -1;
		}
	}
}


