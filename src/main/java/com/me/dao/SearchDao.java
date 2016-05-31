package com.me.dao;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaQuery;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.me.nodel.*;

public class SearchDao extends DAO{

	float distance;
	
		public  List<CreateTrip> populateTrips(String slat, String slon,int radius) 
		{
			//Float slat = Float.parseFloat(s);
			StringBuffer source = new StringBuffer();
			source.append(slat);
			source.append(",");
			source.append(slon);
			
		     
			
			//String v = "40.7878";
			Session session = getSession();
			//Query q = session.createQuery("from Places where latitude=:slat");
			Query q = session.createQuery("from CreateTrip");
			
			//q.setString("slat",v);
			List<CreateTrip> sourceIdList = q.list();
			System.out.println(sourceIdList);
			List<CreateTrip> tripList = new ArrayList();
			
			for(CreateTrip t : sourceIdList)
			{
				StringBuffer des = new StringBuffer();
				des.append(t.getSource().getLat());
				des.append(",");
				des.append(t.getSource().getLng());
				
			//	int sourceId = p.getPlaceId();
				distance = calcDistance(source, des);
				System.out.println(distance);
				if(distance <= radius )
				{
//					Query query = session.createQuery("from Trip where sourceid=:sourceId");
//					query.setInteger("sourceId", sourceId);
//					List<Trip> tempList = query.list();
					
						tripList.add(t);
					
				}
			}
			return tripList;
	
		
		//return null;
		// TODO Auto-generated method stub
		
	}
	
	private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONObject json = new JSONObject(jsonText);
            return json;
        } finally {
            is.close();
        }
    }
    
    public static float  calcDistance(StringBuffer beg, StringBuffer end) {
        JSONObject json = null;
        Integer tem;
        Float dist = null ;
        try {

//            json = readJsonFromUrl("https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + beg + "&destinations=" + end + "&mode=driving&sensor=false");
            json = readJsonFromUrl("https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + beg + "&destinations=" + end + "&sensor=false");
            json.get("rows");
            JSONArray arr = null;
            arr = json.getJSONArray("rows");
//            tem = (Integer) arr.getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("distance").getInt("value");
//            tem1 = (Integer) arr.getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("duration").getInt("text");
            tem = arr.getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("distance").getInt("value");
//            dist = (float) tem / 1000;
            dist = (float)(tem*0.000621371);

        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return dist;
    }


	
}
