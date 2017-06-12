package beans;

import java.util.*;

public class UserList {
	
	private HashMap<String,User> UList;
	
	public UserList() {
	      UList = new HashMap<String, User>();
	  }

	  public HashMap<String,User> getUserList() {
	      return UList;
	  }

	  public int setUser(String user, User u) {
	      if(UList.containsKey(user))
	        return 1;
	      else
	      {
	        UList.put(user, u);
	        return 0;
	      }
	  }
	  
	  public User getUser(String user) {
		  User u = UList.get(user);
		  System.out.println(u.getUserID());
		  return u;
	  }

	  public void removeUser(String user) {
	      if(UList.containsKey(user))
	        UList.remove(user);
	  }

}
