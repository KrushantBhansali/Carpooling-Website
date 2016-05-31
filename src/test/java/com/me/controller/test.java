package com.me.controller;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.me.dao.HibernateUtil;
import com.me.nodel.User;



public class test {

	public static void main(String args[])
	{
		try{
			Session session = HibernateUtil.getSessionFactory().openSession();

			session.beginTransaction();
        User user = new User();
		
		//user.setUserId(1);
		//user.setFname("hj");
		user.setUsername("admin");
		user.setPassword("abc");
		user.setFname("krushant");
		user.setLname("bhansali");
		user.setAge(28);
	
		user.setEmail("abc");
		user.setGender("male");
		//user.setImage("abc");
		user.setPhone("999");
		
		//user.setStatus(true);
		
		session.save(user);
		
		
		session.getTransaction().commit();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			System.out.println("end");
		
		}
		
	}
}