package com.me.nodel;

public class Payment {

	private int paymentId;
	private String cardholderName;
	
	private String cardType;
	
	private int cardNo;
	
    private int cardExpiry;
    
  
    
    private User user;

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	
	


	public String getCardholderName() {
		return cardholderName;
	}

	public void setCardholderName(String cardholderName) {
		this.cardholderName = cardholderName;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public int getCardExpiry() {
		return cardExpiry;
	}

	public void setCardExpiry(int cardExpiry) {
		this.cardExpiry = cardExpiry;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    
	
}
