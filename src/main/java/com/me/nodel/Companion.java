package com.me.nodel;

public class Companion {
	
	private int compId;
	private String feedback;
	private String soucreId;
	private String destId;
	
	
	//many-to-one
	private CreateTrip trip;

	//many-to-one
	private User user;

	public int getCompId() {
		return compId;
	}


	public void setCompId(int compId) {
		this.compId = compId;
	}


	public String getFeedback() {
		return feedback;
	}


	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	public String getSoucreId() {
		return soucreId;
	}


	public void setSoucreId(String soucreId) {
		this.soucreId = soucreId;
	}


	public String getDestId() {
		return destId;
	}


	public void setDestId(String destId) {
		this.destId = destId;
	}


	public CreateTrip getTrip() {
		return trip;
	}


	public void setTrip(CreateTrip trip) {
		this.trip = trip;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	

}
