package com.me.nodel;

public class Messages {
		
		private Integer mId;
		private String receiver;
		private String sender;
		private String message;
		private String date;
		
		private String status;
		
		
		//many to one
		private User user;
		
		//many-to-one
		private CreateTrip joinTrip;
	
		
		public CreateTrip getJoinTrip() {
			return joinTrip;
		}
		public void setJoinTrip(CreateTrip joinTrip) {
			this.joinTrip = joinTrip;
		}
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public Integer getmId() {
			return mId;
		}
		public void setmId(Integer mId) {
			this.mId = mId;
		}
		public String getReceiver() {
			return receiver;
		}
		public void setReceiver(String receiver) {
			this.receiver = receiver;
		}
		public String getSender() {
			return sender;
		}
		public void setSender(String sender) {
			this.sender = sender;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}

		
	}


