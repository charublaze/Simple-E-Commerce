package beans;

import java.util.*;
import java.text.*;
import java.io.*;

public class Product {
	private int id;
	private String name;
	private String type;
	private int quantity;
	private int price;
	private String img;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Product(int id, String name, String type, int quantity, int price) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.quantity = quantity;
		this.price = price;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}	
	
}