package DTO;

public class DeliveryDTO {
	private int delivery_No;
	private String user_id;
	private String dName;
	private String dTel;
	private String dAddress;
	public int getDelivery_No() {
		return delivery_No;
	}
	public void setDelivery_No(int delivery_No) {
		this.delivery_No = delivery_No;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdTel() {
		return dTel;
	}
	public void setdTel(String dTel) {
		this.dTel = dTel;
	}
	public String getdAddress() {
		return dAddress;
	}
	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}

}
