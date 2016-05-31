package com.me.dao;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.me.nodel.Address;
import com.me.nodel.Car;
import com.me.nodel.Driving;
import com.me.nodel.Payment;
import com.me.nodel.User;

public class UserDao extends DAO {

	
	public User validateUser(String username, String password)throws Exception{
		
		try{
		Query q = getSession().createQuery("from User where username=:name and password=:pwd");
		
		System.out.println("inside validate user");
		
		System.out.println(username);
		System.out.println(password);
		q.setString("name", username);
		q.setString("pwd",password);
		
		User u = (User) q.uniqueResult();
		
		return u;
		}catch(HibernateException e){
			throw new Exception("Cannot find User "+e);
			
		}
		
	}
	
	public void saveImage(User u) throws Exception{
		Session session = getSession();
		session.beginTransaction();
		try{
		CommonsMultipartFile commonsFile = u.getImage();
		System.out.println(u);
		System.out.println(commonsFile);
        File destFile = new File("F:\\uploads\\", commonsFile.getOriginalFilename());
        u.getImage().transferTo(destFile);
        
        System.out.println(destFile);
       
        u.setImageFile(destFile.getPath());
       // session.save(u);
        session.getTransaction().commit();
        
       
		}catch(Exception e){
			throw new Exception("Image cannot be uploaded "+e);
		}
		
        
          
	}
	
	public User changeProfile(User user, String username, String password, String email, String fname, String lname, String phone, String gender,int age) throws Exception{
		
		Session session = getSession();
		session.beginTransaction();
		
	try{
		
		Query q = session.createQuery("from User where username=:name ");
        q.setString("name",username);
		
		User u = (User) q.uniqueResult();
		
		u.setUsername(username);
		u.setPassword(password);
		u.setEmail(email);
		u.setFname(fname);
		u.setLname(lname);
		u.setPhone(phone);
		u.setGender(gender);
		u.setAge(age);
		

		 session.save(u);
		 
	    session.getTransaction().commit();
	    
	    return u;
		
		}catch(HibernateException e){
			throw new Exception("User cannot be saved "+e);
		}
	
		
		
	}
	
	public void addAddress(Address a, User u) throws Exception{
		
		
		Session session = getSession();
        session.beginTransaction();
        
       try{
    	   
   
       
      /*  a.setState(state);
        a.setCity(city);
        a.setState(state);
        a.setCountry(country);
        a.setZip(zip);
   System.out.println(a.getCity());*/
	   a.setUser(u);
	   
	   u.setAddress(a);
	   
	   session.save(a);
	   session.save(u);
	   session.getTransaction().commit();
	   
       }
       
       catch(HibernateException e){
    	   throw new Exception("Cannot save Address "+e);
       }
        
        
	}
	
	
	public void cancelUser(User user){
		
		
		Session session = getSession();
		session.beginTransaction();
		
		int id = user.getUserId();
		
		Query q = session.createQuery("from User where userId=:id");
		
		q.setInteger("id", id);
		
		User u = (User) q.uniqueResult();
		
		
		
	}
	
	public void registerUser(User u, Address a, Car c, Driving d, Payment p){
		
		Session session = getSession();
		session.beginTransaction();
		
	try{
		
	
		u.setAddress(a);
		u.setCar(c);
		u.setDriver(d);
		u.setPayment(p);
		
		a.setUser(u);
		c.setUser(u);
		d.setUser(u);
		p.setUser(u);
		
		session.save(u);
		session.save(a);
		session.save(c);
		session.save(d);
		session.save(p);
		
		
		 session.getTransaction().commit();
	}catch(Exception e){
		System.out.println("Cannot register user "+e);
	}
		
	}
	
	public User fetchUserByUsername(String username){
		Session session = getSession();
		session.beginTransaction();
		
		try{
			Query q = session.createQuery("from User where username=:name ");
		
			q.setString("name",username);
			
			User u = (User) q.uniqueResult();
			
			return u;
		}catch(HibernateException e){
			
		}
		return null;
		
		
	}
	
	public User fetchProfile(int id) throws Exception{
		
		Session session = getSession();
		session.beginTransaction();
		
		try{
			Query q = session.createQuery("from User where userId=:id ");
             q.setInteger("id",id);
			
			User u = (User) q.uniqueResult();
			
			return u;
			
		}catch(HibernateException ex){
			throw new Exception("Cannot fetch user profile "+ex);
		}
		
		
		
		
	}
	
	public List fetchAllUsers() throws Exception{
		
		Session session = getSession();
		session.beginTransaction();
		
		try{
			Query q = session.createQuery("from User ");
			
			     List userList = q.list();
			     
			
			return userList;
		}catch(HibernateException e){
			throw new Exception("Cannot fetch all users " +e);
		}
		
		
	}
}

