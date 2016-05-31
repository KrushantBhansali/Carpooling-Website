package com.me.nodel;

import java.util.Set;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class User {
	
	private String username;
	private String password;
	
	private int userId;
	private String fname;
	private String lname;
	private String gender;
	private String email;
	private String phone;
	private String imageFile;
	
	
	
	private CommonsMultipartFile image;
	
	
	private int age;
	private String smoking;
	private String music;
	
	private Set<CreateTrip> createTrip;
	
    private Set<Companion> copass;
    
    
    
    private Set<Messages>  messageList;
    
    private Address address;
    
    private Car car;
    
    private Driving driver;
    
    private Payment payment;

	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Driving getDriver() {
		return driver;
	}
	public void setDriver(Driving driver) {
		this.driver = driver;
	}
	public Set<Messages> getMessageList() {
		return messageList;
	}
	public void setMessageList(Set<Messages> messageList) {
		this.messageList = messageList;
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSmoking() {
		return smoking;
	}
	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	
	public Set<CreateTrip> getCreateTrip() {
		return createTrip;
	}
	public void setCreateTrip(Set<CreateTrip> createTrip) {
		this.createTrip = createTrip;
	}
	

	public Set<Companion> getCopass() {
		return copass;
	}
	public void setCopass(Set<Companion> copass) {
		this.copass = copass;
	}

	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	
	public CommonsMultipartFile getImage() {
		return image;
	}
	public void setImage(CommonsMultipartFile image) {
		this.image = image;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	
	
	
	

}
