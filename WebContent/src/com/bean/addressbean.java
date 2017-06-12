package com.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.connect.DBConnection;
public class addressbean {

	private String fname ;
	private String lname;
	private String address;
	private String city;
	private String state;
	private String zip;
	private String country;
	private String mobileno;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	
	public int insertValue()
	{
		try
		{
			Connection con=DBConnection.getConn();
			PreparedStatement ps=con.prepareStatement("insert into address(fname,lname,address,city,state,zip,country,mobileno) values(?,?,?,?,?,?,?,?)");
	
		ps.setString(1,fname);
		ps.setString(2,lname);
		ps.setString(3,address);
		ps.setString(4,city);
		ps.setString(5,state);
		ps.setString(6,zip);
		ps.setString(7,country);
		ps.setString(8,mobileno);
		
		
		
		
		int x=ps.executeUpdate();
		return x;
		}catch(Exception e)
		{
			return -1;
		}
	}


}
