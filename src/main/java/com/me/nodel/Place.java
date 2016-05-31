package com.me.nodel;

import java.util.Set;

public class Place {
	
	private int placeId;
	private String address;
	
	
	
	private String lat;
	private String lng;
	
	
	//private CreateTrip trips;
	
	//one to many
	private Set<CreateTrip> source;
	
	private Set<CreateTrip> dest;
	
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
	public Set<CreateTrip> getSource() {
		return source;
	}
	public void setSource(Set<CreateTrip> source) {
		this.source = source;
	}
	public Set<CreateTrip> getDest() {
		return dest;
	}
	public void setDest(Set<CreateTrip> dest) {
		this.dest = dest;
	}
	
	
	
	

}
