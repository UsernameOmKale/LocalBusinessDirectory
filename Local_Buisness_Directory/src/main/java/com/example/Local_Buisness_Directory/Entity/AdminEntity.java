package com.example.Local_Buisness_Directory.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class AdminEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int aid;
	
	private String name;
	
	private String email;
	
	private String mobile;
	
	private String city;
	
	private String address;
	
	private String businessName;
	
	private String otherBusiness;
	
	private String gender;
	
	private String username;
	
	private String password;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	
	
	public String getOtherBusiness() {
		return otherBusiness;
	}

	public void setOtherBusiness(String otherBusiness) {
		this.otherBusiness = otherBusiness;
	}

	@Override
	public String toString() {
		return "AdminEntity [aid=" + aid + ", name=" + name + ", email=" + email + ", mobile=" + mobile + ", city="
				+ city + ", address=" + address + ", businessName=" + businessName + ", otherBusiness=" + otherBusiness
				+ ", gender=" + gender + ", username=" + username + ", password=" + password + "]";
	}

	public AdminEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
