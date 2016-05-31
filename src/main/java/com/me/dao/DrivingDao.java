package com.me.dao;

import java.sql.Date;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.me.nodel.Driving;
import com.me.nodel.User;

public class DrivingDao extends DAO{
	
	public void addDrivingDetails(User user, String license, String validity) throws Exception{
		
		Session session = getSession();
		session.getTransaction();
		
		try{
			
			Driving d = new Driving();
			d.setLicense(license);
			d.setValidity(validity);
			
			d.setUser(user);
			user.setDriver(d);
			
			session.save(d);
			session.save(user);
			
		
		}catch(HibernateException e){
			throw new Exception("Cannot add driving "+e);
			
		}
	}

}
