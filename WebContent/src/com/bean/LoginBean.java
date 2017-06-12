package com.bean;
import com.connect.DBConnection;
import java.sql.*;

public class LoginBean {
private String email;
private String pass;



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

public String validate()
{
	try{
		
		Connection con=DBConnection.getConn();
			
		 ResultSet rs =  con.createStatement().executeQuery("select * from register where email='"+email+"'and password='"+pass+"'"); 

				if(rs.next())
					return "success";
				     else
				
					return "error";
				}catch (Exception e) {System.out.print(e);
		                        	return "error";
			                    
			}
				}
		}


