package DTO;

public class BasketDTO {
	private int basket_no;
	private String user_id;
	private int product_no;
	private String product_name;
	private int qty;
	private int price;
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "BasketDTO [basket_no=" + basket_no + ", user_id=" + user_id + ", product_no=" + product_no
				+ ", product_name=" + product_name + ", qty=" + qty + ", price=" + price + "]";
	}
		
	
	
}