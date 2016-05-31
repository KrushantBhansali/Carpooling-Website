package com.me.nodel;

import java.sql.Time;
import java.util.Date;
import java.util.Set;

public class CreateTrip {

	private int tripId;
	private Date s_date;
	private Date e_date;
	private int cost;
	private String message;
	private int seats;
	private String status;
	private float distance;
	private String time;

	
	

	//many-to-one
	private User user;
	
	//many-to-one
	private Place source;
	
	//many-to-one
	private Place dest;
	
	//one-to-many
	private Set<Companion> compDetails;
	
	//one-to-many
	//private Set<JoinStatus> tripStatus;
	  private Set<Messages> messageStatus;
	//many-to-many
	//private Set<User> copass;
/*
	public Set<User> getCopass() {
		return copass;
	}

	public void setCopass(Set<User> copass) {
		this.copass = copass;
	}
*/
	public Set<Companion> getCompDetails() {
		return compDetails;
	}

	public void setCompDetails(Set<Companion> compDetails) {
		this.compDetails = compDetails;
	}

	public Place getSource() {
		return source;
	}

	public void setSource(Place source) {
		this.source = source;
	}

	public Place getDest() {
		return dest;
	}

	public void setDest(Place dest) {
		this.dest = dest;
	}

	public int getTripId() {
		return tripId;
	}

	public void setTripId(int tripId) {
		this.tripId = tripId;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
     
	

	

	public Set<Messages> getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(Set<Messages> messageStatus) {
		this.messageStatus = messageStatus;
	}

	public float getDistance() {
		return distance;
	}

	public void setDistance(float distance) {
		this.distance = distance;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}
