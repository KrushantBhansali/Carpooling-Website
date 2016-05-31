package com.me.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.me.dao.CarDao;
import com.me.dao.DrivingDao;
import com.me.dao.MessageDao;
import com.me.dao.PaymentDao;
import com.me.dao.PlaceDao;
import com.me.dao.SearchDao;
import com.me.dao.UserDao;
import com.me.dao.ViewDetailsDao;
import com.me.nodel.Address;
import com.me.nodel.Car;
import com.me.nodel.Companion;
import com.me.nodel.CreateTrip;
import com.me.nodel.Driving;
import com.me.nodel.Messages;
import com.me.nodel.Payment;
import com.me.nodel.Place;
import com.me.nodel.User;
import com.me.validator.AddressValidator;
import com.me.validator.CarValidator;
import com.me.validator.DrivingValidator;
import com.me.validator.LoginValidator;
import com.me.validator.PaymentValidator;
import com.me.validator.SignUpValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private PlaceDao placeDao;
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private ViewDetailsDao viewDetailsDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private CarDao carDao;
	
	@Autowired
	private DrivingDao drivingDao;
	/*
	@Autowired
	private LoginValidator loginValidator;
	*/
	
	
	@Autowired
	private SignUpValidator  signUpValidator;
	
	@Autowired
	private AddressValidator  addressValidator;
	
	@Autowired
	private PaymentValidator  paymentValidator;
	
   /* 
	@Autowired
	private CarValidator carValidator;
	*/
	@Autowired
	private CarValidator carValidator;
	
	@Autowired
	private DrivingValidator drivingValidator;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	
	@InitBinder("u")
	private void initBinder (WebDataBinder binder){
		binder.setValidator(signUpValidator);
	}
	

	@InitBinder("address")
	private void initBinder1 (WebDataBinder binder){
		binder.setValidator(addressValidator);
	}
	
	@InitBinder("car")
	private void initBinder2 (WebDataBinder binder){
		binder.setValidator(carValidator);
	}
	
	
	
	@InitBinder("driving")
	private void initBinder3 (WebDataBinder binder){
		binder.setValidator(drivingValidator);
	}
	
	@InitBinder("payment")
	private void initBinder5 (WebDataBinder binder){
		binder.setValidator(paymentValidator);
	}
	
	/*@InitBinder("user")
	private void initBinder1 (WebDataBinder binder){
		binder.setValidator(loginValidator);
	}*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		User u = new User();
		HttpSession session = request.getSession();
		session.setAttribute("user",u);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("user",u);
		
		
		return "home";
	}
	
	
	@RequestMapping(value = "/search.htm", method = RequestMethod.POST)
	public String search(HttpServletRequest request,Model model)
	{
		System.out.println("hi");
		
		
		
		HttpSession session = request.getSession();
		User user = (User) request.getAttribute("user");
		
	
		
	
		
		String slat = request.getParameter("startlat");
		String slon = request.getParameter("startlong");
        String dlat = request.getParameter("endlat");
		String dlon = request.getParameter("endlong");
//		int radius =  Integer.parseInt(request.getParameter("radius"));
		
		
		//String slat = "42.339807";
		//String slon = "-71.089172";
		
		List<CreateTrip> tripList = searchDao.populateTrips(slat,slon,10000);
		model.addAttribute("tripList", tripList);
		return "home";
		
	}
	
	@RequestMapping(value="/viewDetails.htm", method = RequestMethod.GET)
	public String viewDetails(HttpServletRequest request, Model model) throws Exception
	{  
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		
		
		
		if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
		
		
		/*String uname = user.getFname();
		
		System.out.println(uname);
		String vd = null;
	    if(uname!=null){
	       int tripId = Integer.parseInt(request.getParameter("trip"));
	       System.out.println(tripId);
	     CreateTrip trip =  viewDetailsDao.fetchDetails(tripId);
	     model.addAttribute("user", user);
	    // model.addAttribute("trip",trip);
	    	vd = "viewDetails";
	    	return vd;
	    }
	    else{*/
	    	model.addAttribute("user",user);
	    	System.out.println("guest view..");
			String l = "login";
			return l;
	    }
		
		
		
	
	
	
	@RequestMapping(value="/userViewDetails.htm", method = RequestMethod.GET)
	public String userView(HttpServletRequest request, Model model) throws Exception
	{ 
	
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("user");
	
	
	
	if(user==null){
		User u1 = new User();
		model.addAttribute("user", u1);
		boolean sessionMsg = true;
		model.addAttribute("sessionMsg",sessionMsg);
		return "home";
	}
	
	
	
	String uname = user.getFname();
	
	System.out.println(uname);
	String vd = null;
    if(uname!=null){
       int tripId = Integer.parseInt(request.getParameter("trip"));
       System.out.println(tripId);
     CreateTrip trip =  viewDetailsDao.fetchDetails(tripId);
     
     
     model.addAttribute("user", user);
     
     model.addAttribute("trip",trip);
    	vd = "viewDetails";
    	return vd;
	 
    }
	return vd;
	}
	
	@RequestMapping(value="/homepage.htm", method = RequestMethod.POST)
	public String homepage(HttpServletRequest request, Model model) throws Exception
	{   System.out.println("Homepage..");
	
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("user");
	
	
	if(user==null){
		User u1 = new User();
		model.addAttribute("user", u1);
		boolean sessionMsg = true;
		model.addAttribute("sessionMsg",sessionMsg);
		return "home";
	}
	
	  // String username = request.getParameter("username");
	   // String password = request.getParameter("password");
	    
	    System.out.println((request.getAttribute("username")));
	   
	    User u =  userDao.validateUser(String.valueOf(request.getAttribute("username")), String.valueOf(request.getAttribute("password")));
	    //System.out.println((request.getAttribute("username").toString()));
	   // User u = userDao.validateUser(username, password);
	    System.out.println(u.getFname());
	    
	    
	    
	    if(u!=null){
	  //  HttpSession session = request.getSession();
	     session.setAttribute("user", u);
	  if(u.getUsername()!="admin"){   
	   System.out.println(u.getFname());
	     model.addAttribute("user",u);
	     
	     System.out.println(u.getUserId());
	     
	     String hp = "homepage";
			return hp;
			
	   }
	  else{
		  String ad="admin";
		  return ad;
	  }
	    }
		return null;
		
	
	}
	
	@RequestMapping(value="/login.htm", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) throws Exception
	{   
		String button = request.getParameter("button");
		
		HttpSession session = request.getSession();
		   User user1 = (User) session.getAttribute("user");
		   
		 
		   
		
		if(button.equals("LOGIN")){
			
			model.addAttribute("user",user1);
		
	  String l = "login";
	return l;
		}else {
			
			User u = new User();
			session.setAttribute("user", u);
			
			model.addAttribute("u", u);
			 String su = "signUp";
				return su;
			
		}
	 
		
	}
	
	
	@RequestMapping(value="/searchRide.htm", method = RequestMethod.GET)
	public String searchRide(HttpServletRequest request, Model model) throws Exception
	{   System.out.println("guest search");
	
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	   
	   model.addAttribute("user",user);
	  String sr = "searchRide";
	return sr;
	 	
	}
	
	
	@RequestMapping(value="/userSearchRide.htm", method = RequestMethod.POST)
	public String userSearch(HttpServletRequest request, Model model) throws Exception
	{   System.out.println("user search");
	
	  HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	  
	String slat = request.getParameter("startlat");
	String slon = request.getParameter("startlong");
    String dlat = request.getParameter("endlat");
	String dlon = request.getParameter("endlong");
	
	System.out.println(slat+" "+slon+" "+dlat+" "+dlon);
//	int radius =  Integer.parseInt(request.getParameter("radius"));
	
	 model.addAttribute("user",user);
	//String slat = "42.339807";
	//String slon = "-71.089172";
	
	List<CreateTrip> tripList = searchDao.populateTrips(slat,slon,10000);
	
	int size = tripList.size();
	
	model.addAttribute("size" ,size);
	model.addAttribute("tripList", tripList);
	  String sr = "searchRide";
	return sr;
	 	
	}
	
	
	
	@RequestMapping(value="/logout.htm", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception
	{   System.out.println("logout..");
	    HttpSession session = request.getSession();
	    session.invalidate();
	  String lo = "logout";
	return lo;
	 
		
	}
	
	@RequestMapping(value="/signUp.htm", method = RequestMethod.POST)
	public String signUp(HttpServletRequest request, Model model,@Validated User u, BindingResult result) throws Exception
	{   
		
		HttpSession session = request.getSession();
		String button = request.getParameter("submit");
		
		if(button.equals("Cancel")){
			
			User u1 = new User();
			model.addAttribute("user", u1);
			return "home";
		}
		
		if (result.hasErrors()){
			System.out.println("signUp validator");
	   model.addAttribute("u",u);
			return "signUp";
		}
	       
				
		try{	
		/*String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email =  request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));*/
		
		userDao.saveImage(u);
		
		
	//	User user = userDao.addUser(u, username, password,fname,lname, email, phone, gender, age);
		//User user = userDao.addUser(u);
	
		session.setAttribute("user", u);
   model.addAttribute("user",u);
   
   Address address = new Address();
   model.addAttribute("address",address);
   
    String ua = "userAddress";
	return ua;
	
		}catch(Exception e){
			//String err = "erroLoad";
			//return err;
		}
		return null;
	
	}
	
	
	
	@RequestMapping(value="/userAddress.htm", method = RequestMethod.POST)
	public String userADd(HttpServletRequest request, Model model, @Validated Address address, BindingResult result) throws Exception
	{   
		
		
       String button = request.getParameter("submit");
		
		if(button.equals("Cancel")){
			User u = new User();
			model.addAttribute("user", u);
			return "home";
		}
		
		
		if (result.hasErrors()){
			return "userAddress";
		}
				
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   
		   System.out.println(user);
		   String street = request.getParameter("street");
		   String city = request.getParameter("city");
		   String state = request.getParameter("state");
		   String country= request.getParameter("country");
		   String zip = request.getParameter("zip");
		   
		   session.setAttribute("address", address);
		   System.out.println(street+" "+ city);
		     /// userDao.addAddress(address,user, street, city, state, country, zip);
		
    
     
     Car c = new Car();
     model.addAttribute("user",user);
     model.addAttribute("car", c);
    String cd = "carDetails";
	return cd;
	
	}
	
	
	
	@RequestMapping(value="/carDetails.htm", method = RequestMethod.POST)
	public String carDetails(HttpServletRequest request, Model model,@Validated Car car, BindingResult result) throws Exception
	{   
		
        String button = request.getParameter("submit");
		
		if(button.equals("Cancel")){
			User u = new User();
			model.addAttribute("user", u);
			return "home";
		}
		
		
		
		if (result.hasErrors()){
			System.out.println("inside errors");
			model.addAttribute("car",car);
			return "carDetails";
		}
		
		
		try{
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		  
		   String carmodel = request.getParameter("model");
		   String type = request.getParameter("type");
		   int seats = Integer.parseInt(request.getParameter("seats"));
		   int carno = Integer.parseInt(request.getParameter("carno"));
		   String color = request.getParameter("color");
		   
		   
		   carDao.saveImage(car);
		  // carDao.addCar(car,user, carmodel, type, seats, carno, color);
		   session.setAttribute("car", car);
		   model.addAttribute("user",user);
		   
		   Driving d = new Driving();
		   model.addAttribute("driving",d);
		    String dd = "driverDetails";
			return dd;
		   
		}catch(HibernateException e){
			throw new Exception("Cannot add car "+e);
			
		}
  
	
	}
	
	@RequestMapping(value="/drivingDetails.htm", method = RequestMethod.POST)
	public String driverDetails(HttpServletRequest request, Model model,@Validated Driving driving, BindingResult result) throws Exception
	{   
         String button = request.getParameter("submit");
		
		if(button.equals("Cancel")){
			User u = new User();
			model.addAttribute("user", u);
			return "home";
		}
		
		
		
		if(result.hasErrors()){
			return "driverDetails";
		}
		
		
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   String license = request.getParameter("license");
		  String validity =(request.getParameter("validity"));
		   
		   
		 //  drivingDao.addDrivingDetails(user, license, validity);
		  
		  session.setAttribute("driving", driving);
		
		
   //model.addAttribute("user",u);
		   
   Payment p = new Payment();
   model.addAttribute("payment",p);
    String pd = "paymentDetails";
	return pd;
	
	}
	

	@RequestMapping(value="/paymentDetails.htm", method = RequestMethod.POST)
	public String payDetails(HttpServletRequest request, Model model,@Validated Payment payment,BindingResult result) throws Exception
	{ 
		
		
String button = request.getParameter("submit");
		
		if(button.equals("Cancel")){
			User u = new User();
			model.addAttribute("user", u);
			return "home";
		}
		
		if(result.hasErrors()){
			return "paymentDetails";
		}
		
		
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   String name = request.getParameter("cardholderName");
		   String type = request.getParameter("cardType");
		   int no = Integer.parseInt(request.getParameter("cardNo"));
		   int expiry = Integer.parseInt(request.getParameter("cardExpiry"));
		   
		   //paymentDao.addPaymentDetails(user, payment, name, type, expiry, no);
		       
		      session.setAttribute("payment",payment);
		      
		   Address a = (Address) session.getAttribute("address");
		   Car c = (Car) session.getAttribute("car");
		   Driving d = (Driving) session.getAttribute("driving");
		   Payment p = (Payment) session.getAttribute("payment");
		   
		   
		   System.out.println("User "+user+"Address "+a+"Car "+c+"Driving "+d+"Payment "+p);
		   
		   userDao.registerUser(user, a, c, d, p);
		   
		   
		   
	  String r = "register";
	return r;
	 
		
	}
	
	
	
	@RequestMapping(value="/cancel.htm", method = RequestMethod.GET)
	public String register(HttpServletRequest request, Model model) throws Exception
	{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		userDao.cancelUser(user);
		
		return "home";  
		
		
	}
	
	
	
	@RequestMapping(value="/approveReject.htm", method = RequestMethod.GET)
	public String apprej(HttpServletRequest request, Model model) throws Exception
	{  
	     
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	
	if(user==null){
		User u1 = new User();
		model.addAttribute("user", u1);
		boolean sessionMsg = true;
		model.addAttribute("sessionMsg",sessionMsg);
		return "home";
	}
	
	
	     int msgId= Integer.parseInt(request.getParameter("msgId"));
	     String recName = request.getParameter("recName");
	     String status = request.getParameter("status");
	     
	     System.out.println(status);
	       messageDao.changeStatus(recName, msgId, user,status);
	       
	       List<Messages> messageList = messageDao.retrieveMessages(user);
	        model.addAttribute("messageList", messageList);
	        model.addAttribute("user", user);
	       
	  String mg = "messages";
	return mg;
	 
		
	}
	
	@RequestMapping(value="/request.htm", method = RequestMethod.POST)
	public String requestC(HttpServletRequest request, Model model) throws Exception
	{  
		try{
		String text = request.getParameter("text");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
		
		   
		System.out.println(user.getUserId());
		String recName =  request.getParameter("recName");
		int tripId =  Integer.parseInt(request.getParameter("tripId"));
		
		
		int recId = Integer.parseInt(request.getParameter("recId"));
		System.out.println(recId);
		
		
		messageDao.sendMessage(text, user, recName,recId,tripId);
		      
		System.out.println("Request..");
	  String rq = "request";
	return rq;
	
		}catch(HibernateException e){
			throw new Exception("Request cannot be forwarded "+e);
		}
		
	 
		
	}
	
	@RequestMapping(value="/messages.htm", method = RequestMethod.GET)
	public String message(HttpServletRequest request, Model model) throws Exception
	{  
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	
	        List<Messages> messageList = messageDao.retrieveMessages(user);
	        model.addAttribute("messageList", messageList);
	        model.addAttribute("user", user);
	  String m = "messages";
	return m;
	 
		
	}
	
	
	@RequestMapping(value="/myTrips.htm", method = RequestMethod.GET)
	public String myTrips(HttpServletRequest request, Model model) throws Exception
	{   
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		
		   List<CreateTrip> createList = viewDetailsDao.fetchCreatedTrip(user);
		   
		   List<Companion>  cList = viewDetailsDao.fetchJoinedTrip(user);
		   
		   model.addAttribute("createList", createList);
		   model.addAttribute("cList",cList);
		
	  String mt = "myTrips";
	return mt;
	 
		
	}
	
	
	@RequestMapping(value="/payment.htm", method = RequestMethod.GET)
	public String payment(HttpServletRequest request, Model model) throws Exception
	{   
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   int cost = Integer.parseInt(request.getParameter("cost"));  
		   int tripId = Integer.parseInt(request.getParameter("tripId"));
		   
		   
		   
		   Payment p = paymentDao.fetchCardDetails(user);
		 
		model.addAttribute("tripId",tripId);
		model.addAttribute("cost",cost);
		model.addAttribute("payment",p);
	  String py = "payment";
	return py;
	 
		
	}
	
	

	@RequestMapping(value="/paymentConfirm.htm", method = RequestMethod.POST)
	public String payConfirm(HttpServletRequest request, Model model) throws Exception
	{ 
		
		 HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   int tripId = Integer.parseInt(request.getParameter("tripId"));
		   
		       paymentDao.confirmSeat(user,tripId);
		       
		       
		   
	  String pc = "paymentConfirmation";
	return pc;
	 
		
	}
	
	@RequestMapping(value="/postRide.htm", method = RequestMethod.GET)
	public String postRide(HttpServletRequest request, Model model) throws Exception
	{   
	
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	   
	   model.addAttribute("user",user);
	  String pr = "postRide";
	return pr;
	 	
	}
	
	
	
	@RequestMapping(value="/confirmTrip.htm", method = RequestMethod.POST)
	public String tripC(HttpServletRequest request, Model model) throws Exception
	{   
	
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	   
		try{
			
			User u=(User) session.getAttribute("user");
			String slat = request.getParameter("slat");
			String slong = request.getParameter("slong");
			String dlat = request.getParameter("dlat");
			String dlong = request.getParameter("dlong");
			String sourceaddr = request.getParameter("sourceid");
			String destaddr = request.getParameter("destid");
			// AUTO FILL PLACE TABLE

			
			System.out.println(slat);
			System.out.println(slong);
			System.out.println(dlat);
			System.out.println(dlong);
			
			placeDao.addPlace(slat, slong, sourceaddr, dlat, dlong, destaddr);

			// Retrieve PLACE OBJECT FOR SOURCE
			Place start = placeDao.fetchPlace(slat, slong);

			// Retrieve PLACE OBJECT FOR DESTINATION
			Place end = placeDao.fetchPlace(dlat, dlong);	
			
		java.sql.Date sqlStartDate = java.sql.Date.valueOf((request.getParameter("startdate")));
				
		java.sql.Date sqlEndDate =java.sql.Date.valueOf(request.getParameter("enddate"));

		
		String TripTime = (request.getParameter("triptime"));

		
		int cost = Integer.parseInt(request.getParameter("cost"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		
		//FOR DISTANCE CALCULATION
		StringBuffer begcoords= new  StringBuffer();
		begcoords.append(slat);
		begcoords.append(",");
		begcoords.append(slong);
		StringBuffer endcoords= new  StringBuffer();
		endcoords.append(dlat);
		endcoords.append(",");
		endcoords.append(dlong);
		
		float distance=SearchDao.calcDistance(begcoords, endcoords);
		
		
		String comments = request.getParameter("comments");
		
		viewDetailsDao.postTrip(start, end, sqlStartDate, sqlEndDate, TripTime, cost, distance,	capacity, comments,u);
	
		 model.addAttribute("user",user);
		  String pr = "confirmTrip";
		  return pr;
		  
		
		}
		catch(Exception e)
		{
			System.out.println("Error in processing values"+e);
			String er = "errorPost"; 
		  return er;
		}
		
	
	}
	
	@RequestMapping(value = "/ajax.html", method = RequestMethod.POST)
	public @ResponseBody String ajaximpl(Locale locale, Model model,
			HttpServletRequest request) {
		String username = request.getParameter("username");
		System.out.print(username);
		User u = userDao.fetchUserByUsername(username);

		//System.out.print(u.getUsername());
		if (u != null) {
			return "User with username " + u.getUsername()
					+ " already exists!!!!";
		} else {
			return " ";
		}
	}


	@RequestMapping(value="/viewProfile.htm", method = RequestMethod.GET)
	public String viewProfile(HttpServletRequest request, Model model) throws Exception
	{   
	
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	   
	  User u = userDao.fetchProfile(user.getUserId());
	   model.addAttribute("user",u);
	  String cp = "viewProfile";
	return cp;
	 	
	}
	
	@RequestMapping(value="/confirmChange.htm", method = RequestMethod.POST)
	public String confirmChange(HttpServletRequest request, Model model) throws Exception
	{   
	
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");
	   
	   
	   if(user==null){
			User u1 = new User();
			model.addAttribute("user", u1);
			boolean sessionMsg = true;
			model.addAttribute("sessionMsg",sessionMsg);
			return "home";
		}
	   
	   
	   
	   String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email =  request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
	   
		
		
	  User u = userDao.changeProfile(user, username, password, email, fname, lname, phone, gender, age);
	  
	  model.addAttribute("user",u);
	  String cp = "confirmChange";
	return cp;
	 	
	}
	
	
	@RequestMapping(value="/admin.htm", method = RequestMethod.GET)
	public String allUser(HttpServletRequest request, Model model) throws Exception{
		
		  HttpSession session = request.getSession();
		   User user = (User) session.getAttribute("user");
		   
		   if(user==null){
				User u1 = new User();
				model.addAttribute("user", u1);
				boolean sessionMsg = true;
				model.addAttribute("sessionMsg",sessionMsg);
				return "home";
			}
		   
		   List userList = userDao.fetchAllUsers();
		   
		   model.addAttribute("userList",userList);
		   
		   String vu= "viewUsers";
		return vu;
		
	}
	 	
	}

