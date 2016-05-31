package com.me.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.me.nodel.Companion;
import com.me.nodel.CreateTrip;
import com.me.nodel.Payment;
import com.me.nodel.User;

public class PaymentDao extends DAO{

	public Payment fetchCardDetails(User user) throws Exception{
		
		try{
			
			int id = user.getUserId();
			Query q = getSession().createQuery("from Payment where paymentId =:id");
			
					q.setInteger("id", id);
					Payment p = (Payment) q.uniqueResult();
					
					return p;
					
			
		}catch(HibernateException e){
			throw new Exception("payment details cannot be fetched "+e);
		}
				
	}
	
	public void confirmSeat(User user , int tripId) throws Exception{
		
		try{
			
			Session session = getSession();
			session.beginTransaction();
			
			Query q = session.createQuery("from CreateTrip where tripId=:id");
			q.setInteger("id", tripId);
			
			CreateTrip t = (CreateTrip) q.uniqueResult();
			
			 int seats =  t.getSeats();
			 t.setSeats(seats-1);
			 
			 Companion c = new Companion();
			 c.setTrip(t);
			 c.setUser(user);
			 
			 t.getCompDetails().add(c);
			 
			 session.save(c);
			 session.save(t);
			 session.getTransaction().commit();
			
			
		}catch(HibernateException e){
			throw new Exception("Cannot update seats "+e);
		}
		
	}
	
	public void addPaymentDetails(User user,Payment p, String name, String type, int expiry, int no) throws Exception{
		

		try{
			
			Session session = getSession();
			session.beginTransaction();
			
			p.setCardExpiry(expiry);
			p.setCardholderName(name);
			p.setCardNo(no);
			p.setCardType(type);
			
			p.setUser(user);
			
			user.setPayment(p);
			session.save(p);
			session.save(user);
			session.getTransaction().commit();
			
			
			
		}catch(HibernateException e){
			throw new Exception("Cannot add payment details "+e);
		}
		
	}
	
	
}
