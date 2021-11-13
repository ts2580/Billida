package com.kh.billida.member.validator;

public class JoinForm {
	
	private String Id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String nick;
	private String postCode;
	private String address;
	private String addressDetail;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	@Override
	public String toString() {
		return "JoinForm [Id=" + Id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", nick=" + nick + ", postCode=" + postCode + ", address=" + address + ", addressDetail="
				+ addressDetail + "]";
	}
	
	
}