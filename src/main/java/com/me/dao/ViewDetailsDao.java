package com.me.dao;



import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.me.nodel.Companion;
import com.me.nodel.CreateTrip;
import com.me.nodel.Place;
import com.me.nodel.User;

public class ViewDetailsDao extends DAO{

	public CreateTrip fetchDetails(int tripId) throws Exception{
		
		try{
		Query q = getSession().createQuery("from CreateTrip where tripId =:id");
		
		   q.setInteger("id", tripId);
		   
		   CreateTrip trips = (CreateTrip) q.uniqueResult();
		   
		   
		return trips;
		}catch(HibernateException e){
			throw new Exception("Could not fetch trips "+e);
			
		}
		   
		   
		
	}
	
	public List fetchCreatedTrip(User user) throws Exception{
		
		try{
			
			Query q = getSession().createQuery("from CreateTrip where userId=:id");
			
			int id  = user.getUserId();
			System.out.println(user);
			System.out.println(id);
			q.setInteger("id",id);
			
		List<CreateTrip> trips = q.list();
			
		//	Query q1 = getSession().createQuery("from Companion where userId=:id");
			
		return trips;
		}catch(HibernateException e){
			throw new Exception("Cannot fetch create trips "+e);
			
		}
		
	}
	
	public List fetchJoinedTrip(User user) throws Exception{
		
		try{
			Query q = getSession().createQuery("from Companion where userId=:id");
			int id  = user.getUserId();
			q.setInteger("id",id);
			
			List<Companion> cList = q.list();
			return cList;
			
		}catch(HibernateException e){
			throw new Exception("Cannot fetch companion list "+e);
		}
		 
	 }
	
	
	
	public void postTrip(Place source, Place destination,java.sql.Date sdate,java.sql.Date edate, String time, int cost, float distance, int availableseats, String comments, User user )
	{	
		try{
	Session session= getSession();
	
	session.beginTransaction();
	
	CreateTrip t= new CreateTrip();
	
	
	t.setSource(source);
	t.setDest(destination);
	t.setS_date(sdate);
	t.setE_date(edate);
	t.setTime(time);
	t.setSeats(availableseats);
	t.setCost(cost);
	t.setMessage(comments);
	t.setDistance(distance);
	t.setUser(user);
	
	System.out.println(source);
	System.out.println(destination);
	session.save(t);
	
	session.getTransaction().commit();
		}
		
		catch(Exception e)
		{
			System.out.print("Error in adding a trip"+e);
			
		}
	

	
	}
}
