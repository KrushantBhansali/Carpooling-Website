package com.me.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.me.nodel.CreateTrip;
import com.me.nodel.Messages;
import com.me.nodel.User;

public class MessageDao extends DAO{
	
	
	public void sendMessage(String text, User sender, String recName, int recId, int tripId) throws Exception{
		
		Session session = getSession();
		
		session.beginTransaction();
		
		Messages m = new Messages();
		
		String senderName = sender.getFname();
		//String receiverName = receiver.getFname();
		
		//int receiverId = receiver.getUserId();
	   // m.setmId(2);
		m.setSender(senderName);
		m.setReceiver(recName);
		m.setMessage(text);
		m.setStatus("pending");
	   // m.getJoinTrip().setTripId(tripId);
		
		
		m.setDate(new Date().toString());
		
		
		try{
		Query q = session.createQuery("from User where userId= :receiverid ");
		
		 q.setInteger("receiverid", recId);
		  
		 User user = (User) q.uniqueResult();
		 
		
		 
		 //HashSet<Messages> messageList = new HashSet<Messages>();
		 
		// messageList.add(m);
		 
		// user.setMessageList(messageList);
		 
		 m.setUser(user);
		 
		 
		 Query q1 = session.createQuery("from CreateTrip where tripId=:id");
		 q1.setInteger("id",tripId);
		 
		 CreateTrip t = (CreateTrip) q1.uniqueResult();
		 
		 m.setJoinTrip(t);
		 
		 t.getMessageStatus().add(m);
		 
		user.getMessageList().add(m);
		 
		 System.out.println(user.getUsername());
		 System.out.println(m.getMessage());
		 //System.out.println(user.getId());
		 
		 session.save(user);
		 session.save(m);
		 session.getTransaction().commit();
		 
		
		}catch(HibernateException e){
			throw new Exception("Message cannot be saved and sent" + e);
		} 
		
	}
	
	
	public List retrieveMessages(User user){
		
		
	Session session = getSession();
		
		session.beginTransaction();
		
		System.out.println(user);
		String sender = user.getFname();
	

		//int id = user.getUserId();
		Query q = session.createQuery("from Messages where sender =:sender or receiver=:receiver");
		q.setString("sender",sender);
		q.setString("receiver", sender);
		
		List<Messages> messageList = q.list();
		
		
		return messageList;
		
	}

		public void changeStatus(String recName, int mId, User sender, String status) throws Exception{
			
			Session session = getSession();
			
			session.beginTransaction();
			
			
			try{
			Query q = session.createQuery("from Messages where mId=:msgId");
			q.setInteger("msgId",mId);
			
			Messages m = (Messages) q.uniqueResult();
			System.out.println(status);
			if(status.equals("Approved")){
				
				m.setStatus("approved");
				
			
				
				
			}
			
			else {
				m.setStatus("rejected");
			}
			
			//sender.getMessageList().add(m);
			
			
			//session.save(sender);
			 session.save(m);
			 session.getTransaction().commit();
			 
			}catch(HibernateException e){
				throw new Exception("Status cannot be updated "+e);
			}
			
			
		}
		
		
	}

