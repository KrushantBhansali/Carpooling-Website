package com.me.dao;

import java.io.File;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.me.nodel.Car;
import com.me.nodel.User;

public class CarDao extends DAO {
	
	
	public void addCar(Car c,User u,String model, String type,int seats, int carno, String color) throws Exception{
		
		
		Session session = getSession();
		session.beginTransaction();
		
		try{
			
			
			
			c.setModel(model);
			c.setType(type);
			c.setSeats(seats);
            c.setColor(color);
            c.setCarno(carno);
            
            c.setUser(u);
            
            System.out.println(c);
            
            u.setCar(c);
            
            session.save(c);
            session.save(u);
            session.getTransaction().commit();
            
		} catch(HibernateException e){
			throw new Exception("Cannot add car " +e);
		}
	}
	
	
	public void saveImage(Car c) throws Exception{
		Session session = getSession();
		session.beginTransaction();
		try{
		CommonsMultipartFile commonsFile = c.getImage();
	System.out.println(c.getImage());
		System.out.println(commonsFile);
        File destFile = new File("F:\\uploads1\\", commonsFile.getOriginalFilename());
        c.getImage().transferTo(destFile);
        
        System.out.println(destFile);
       
        c.setImageFile(destFile.getPath());
       // session.save(u);
        
        session.getTransaction().commit();
        
       
		}catch(HibernateException e){
			throw new Exception("Image cannot be uploaded "+e);
		}

}
}
