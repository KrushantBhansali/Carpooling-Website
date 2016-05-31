package com.me.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.me.nodel.Place;

public class PlaceDao extends DAO{
	
	
	public void addPlace(String slat, String slong, String sadd,
			String dlat, String dlong, String dadd) throws Exception {
		Session session = getSession();
try{
		Query startadd = session
				.createQuery("FROM Place where lat = :slat and lng = :slong and address= :sadd ");

		startadd.setString("slat", slat);
		startadd.setString("slong", slong);
		startadd.setString("sadd", sadd);

		Place start = (Place) startadd.uniqueResult();

		if (start == null) {

			session.beginTransaction();
			Place p = new Place();
			p.setLat(slat);
			p.setLng(slong);
			p.setAddress(sadd);

			session.save(p);
			session.getTransaction().commit();

		}
} catch(HibernateException e ){
	throw new Exception("Could not add destination place "+e);
}

 try{
		Query endadd = session
				.createQuery("FROM Place where lat = :dlat and lng = :dlong and address= :dadd ");

		endadd.setString("dlat", dlat);
		endadd.setString("dlong", dlong);
		endadd.setString("dadd", dadd);

		Place end = (Place) endadd.uniqueResult();

		if (end == null) {

			session.beginTransaction();
			Place p = new Place();
			p.setLat(dlat);
			p.setLng(dlong);
			p.setAddress(dadd);

			session.save(p);
			session.getTransaction().commit();
		}
}
	
     catch(HibernateException e ){
	throw new Exception("Could not add destination "+e);
        }

		

	}

	
	public Place fetchPlace(String lat, String lng)
	{
		try{
		Session s= getSession();
		
		Query q= s.createQuery("FROM Place WHERE lat = :lat AND lng= :lng ");
		q.setString("lat", lat);
		q.setString("lng", lng);
		Place p= (Place) q.uniqueResult();
		return p;
		}
		catch(Exception e)
		{
			System.out.println("ERROR IN FINDING THE PLACE");
		}
		return null;
	}
}
