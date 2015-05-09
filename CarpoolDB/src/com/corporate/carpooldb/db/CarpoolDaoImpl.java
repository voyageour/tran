package com.corporate.carpooldb.db;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.CarpoolerPreference;
import com.corporate.carpooldb.dto.FeedbackUpdated;
import com.corporate.carpooldb.dto.Place;
import com.corporate.carpooldb.dto.Role;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.Status;
import com.corporate.carpooldb.dto.User;
import com.corporate.carpooldb.dto.UserTestimonial;

/**
 * Implementation class for all the method expose to service layer.
 * @author jayesh.patel
 *
 */
public class CarpoolDaoImpl extends HibernateDaoSupport implements CarpoolDao{

	Logger log = Logger.getLogger(CarpoolDaoImpl.class);

	@Autowired
	public void init(@Qualifier("sessionFactoryCarpool") SessionFactory factory) {
		setSessionFactory(factory);
	}
	
	@Override
	public List<User> getAllCarpoolConsumerDetails() {
		return null;
	}

	@Override
	public List<User> getAllCarpoolProviderDetails() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Returns all the places from the Database.
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Place> getAllPlaces() {
		System.out.println("CarpoolDaoImpl.getAllPlaces()");
		
		Session session = getSession();
		Criteria cr = session.createCriteria(Place.class);
		List ls= cr.list();
		
		this.releaseSession(session); 
		
		return ls;
		
	}

	@Override
	public Place getPlacebyPlaceName(String placeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@SuppressWarnings("unchecked")
	public User getUserByUserName(String userName) {
		log.debug("Request received for fetching user by user name");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findUserByName",new String[] {"username"},	new String[] { userName });
			if (list != null && list.size()>0) {
				log.debug("User Found");
			}			
		}catch(Exception e){
			log.debug("Exception occured while fetching user by user name :"+e.getMessage());
		}
		log.debug("Request completed for fetching user by user name");
		return (list != null && list.size() > 0 ? (User)list.get(0) : null);
	}

	@Override
	public boolean saveCarpoolDetails(Carpooler carpooler) {

		try{
			System.out.println("CarpoolDaoImpl.saveCarpoolDetails()");
			Long carpoolerId = (Long)getHibernateTemplate().save(carpooler);
			if(carpoolerId!=null){
				return true;
			}
			System.out.println("CarpoolDaoImpl.saveCarpoolDetails()");
		}catch (Exception e) {
			System.out.println("CarpoolDaoImpl.saveCarpoolDetails() leaving "+e.getMessage());
		}
		return false;
	}
	
	@Override
	public boolean saveSourceTodestinationDetails(SourceToDestinationDetails std) {
		try{
			System.out.println("CarpoolDaoImpl.saveSourceTodestinationDetails()");
			Long stdId = (Long)getHibernateTemplate().save(std);
			if(stdId!=null){
				return true;
			}
			System.out.println("CarpoolDaoImpl.saveSourceTodestinationDetails() leaving");
		}catch (Exception e) {
			System.out.println("CarpoolDaoImpl.saveSourceTodestinationDetails() Exception "+e.getMessage());
		}
		return false;
	}
	

	@Override
	public boolean saveCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
		try{
			System.out.println("CarpoolDaoImpl.saveCarpoolerPreference()");
			Long stdId = (Long)getHibernateTemplate().save(carpoolerPreference);
			if(stdId!=null){
				return true;
			}
			System.out.println("CarpoolDaoImpl.saveCarpoolerPreference() leaving");
		}catch (Exception e) {
			System.out.println("CarpoolDaoImpl.saveCarpoolerPreference() Exception "+e.getMessage());
		}
		return false;
	}
	
	@Override
	public boolean updateCarpoolDetails(Carpooler carpooler) {

		try{
			System.out.println("CarpoolDaoImpl.updateCarpoolDetails()");
			getHibernateTemplate().update(carpooler);
			return true;		
		}catch (Exception e) {
			System.out.println("CarpoolDaoImpl.saveCarpoolDetails() leaving "+e.getMessage());
		}
		return false;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Status getStatusByName(String statusName) {
		List<Status> listOfStatus = null;
		try{
			listOfStatus = getHibernateTemplate().findByNamedQueryAndNamedParam("getStatusByName", new String[]{"statusName"}, new String[]{statusName});
			if(listOfStatus!=null && listOfStatus.size()>0){
				return (Status)listOfStatus.get(0);
			}
		}catch (Exception e) {
			System.out.println("Inside Exception :"+e.getMessage());
		}
		return null;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Role getRoleByRoleName(String roleName) {
		try{
			List<Role> listOfRole = getHibernateTemplate().findByNamedQueryAndNamedParam("getRoleByRoleName", new String[]{"roleName"}, new String[]{roleName});
			if(listOfRole!=null && listOfRole.size()>0){
				return (Role)listOfRole.get(0);
			}
		}catch (Exception e) {
			System.out.println("Inside Exception :"+e.getMessage());
		}
		return null;
	}

	@Override
	public boolean saveUser(User user) {
		
		log.debug("Request received to save user");
		
		try{
		Long storedId = (Long)getHibernateTemplate().save(user);
		if(storedId!=null){
			System.out.println("ID :"+storedId);
			return true;
		}
		}catch (Exception e) {
			log.error("Exception while saving user data :"+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<User> getAllUser() {
		
		Session session = getSession();
		Criteria cr = session.createCriteria(User.class);
		List ls= cr.list();
		
		this.releaseSession(session); 
		
		//session.close();

		return ls;
	}

	@Override
	public boolean updateUser(User user) {
		getHibernateTemplate().update(user);
		return true;
	}

	@Override
	public boolean deleteUser(User user) {
		System.out.println("CarpoolDaoImpl.deleteUser()");
		getHibernateTemplate().delete(user);
		return true;
	}

	@Override
	public boolean deleteSourceToDestinationDetails(SourceToDestinationDetails std) {
		System.out.println("CarpoolDaoImpl.deleteSourceToDestinationDetails()");
		getHibernateTemplate().delete(std);		
		return true;
	}
	
	@Override
	public boolean deleteCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
		System.out.println("CarpoolDaoImpl.deleteCarpoolerPreference()");
		getHibernateTemplate().delete(carpoolerPreference);		
		return true;
	}
	
	@Override
	public boolean deleteCarpooler(Carpooler carpooler) {
		System.out.println("CarpoolDaoImpl.deleteCarpooler()");
		getHibernateTemplate().delete(carpooler);		
		return true;
	}
	
//	@Override
//	public CarpoolerPreference getCarpoolerPreferenceByCarpoolerId(long carpoolerId) {
//		log.debug("Request received for fetching CarpoolerPreference by carpooler id  :"+carpoolerId);
//		List list = null;
//		try{
//			list = getHibernateTemplate().findByNamedQueryAndNamedParam("getCarpoolerByUser","user",user);
//			if (list == null) {
//				log.debug("No carpooling found by user.");
//				return null;
//			}			
//			log.debug("Request completed for fetching Carpooler by User.");	
//			return (Carpooler)list.get(0);	
//		}catch(Exception e){
//			log.debug("Exception occured while fetching Carpooler by user :"+e.getMessage());
//		}
//		log.debug("Request completed for fetching Carpooler by User.");
//		return null;
//	}
	
	
	
	@Override
	public Carpooler getCarpoolerByUser(User user) {
		log.debug("Request received for fetching Carpooler by User with data as :"+user);
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("getCarpoolerByUser","user",user);
			if (list == null) {
				log.debug("No carpooling found by user.");
				return null;
			}			
			log.debug("Request completed for fetching Carpooler by User.");	
			return (Carpooler)list.get(0);	
		}catch(Exception e){
			log.debug("Exception occured while fetching Carpooler by user :"+e.getMessage());
		}
		log.debug("Request completed for fetching Carpooler by User.");
		return null;
	}

	@Override
	public CarpoolerPreference getCarpoolerPreferenceByCarpooler(Carpooler carpooler) {
		log.debug("Request received for fetching CarpoolerPreference by carpooler with data as :"+carpooler);
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("getCarpoolerPreferenceByCarpooler","carpooler",carpooler);
			if (list == null) {
				log.debug("No CarpoolerPreference found.");
				return null;
			}			
			log.debug("Request completed for fetching Carpooler by User.");	
			return (CarpoolerPreference)list.get(0);	
		}catch(Exception e){
			log.debug("Exception occured while fetching CarpoolerPreference by carpooler :"+e.getMessage());
		}
		log.debug("Request completed for fetching CarpoolerPreference by Carpooler.");
		return null;
	}
	
	@Override
	public List<Carpooler> getAllCarpooler() {
		
		Session session = getSession();
		Criteria cr = session.createCriteria(Carpooler.class);
		List ls= cr.list();
		
		//session.close();
		this.releaseSession(session); 
		
		return ls;
		
	}

	@Override
	public List<Carpooler> getAllCarpoolerConsumer() {
		List<Carpooler> listOfAllCarpooler = getAllCarpooler();
		for (int i = 0; i < listOfAllCarpooler.size(); i++) {
			Carpooler carpooler = listOfAllCarpooler.get(i);
			if(carpooler.getUserType().equals("provider")){
				listOfAllCarpooler.remove(i);
			}
		}
		return listOfAllCarpooler;
	}

	@Override
	public List<Carpooler> getAllCarpoolerProvider() {
		List<Carpooler> listOfAllCarpooler = getAllCarpooler();
		for (int i = 0; i < listOfAllCarpooler.size(); i++) {
			Carpooler carpooler = listOfAllCarpooler.get(i);
			if(carpooler.getUserType().equals("consumer")){
				listOfAllCarpooler.remove(i);
			}
		}
		return listOfAllCarpooler;
	}

	@Override
	public List<SourceToDestinationDetails> getAllSourceToDestinationDetailsbyCarpooler(
			Carpooler carpooler) {

		Session session = getSession();
		Criteria cr = session.createCriteria(SourceToDestinationDetails.class);
		cr.add(Expression.eq("listOfSourceToDestinationDetails",carpooler));
		List ls= cr.list();
		
		this.releaseSession(session); 
		
		//session.close();

		return ls;
	}

	@Override
	public List<Carpooler> getTopTenCarpooler() {
		log.debug("Request received for fetching top ten Carpooler.");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQuery("findTopTenCarpooler");
			if (list != null) {
				throw new RuntimeException("User Not Found");
			}

			if(list!=null)
				log.debug("Fetched top ten result is :"+list.toString());
			else
				log.debug("List is null");
			
			log.debug("Returning back from fetching Top Ten Carpooler");
			
			return list;
		}catch(Exception e){
			log.error("Exception Occurred while fetching Top Ten Result :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<UserTestimonial> getAllTestimonial() {
		
		Session session = getSession();
		Criteria cr = session.createCriteria(UserTestimonial.class);
		List ls= cr.list();

		this.releaseSession(session); 
		
		//session.close();

		return ls;
		
	}
	
	
	@Override
	public List<FeedbackUpdated> getFeedbackByType(int feedbackType) {
		
		log.debug("Request received for fetching Feedback by type :"+feedbackType);
		List list = null;
		try{

			if(feedbackType>0){
				list = getHibernateTemplate().findByNamedQueryAndNamedParam("getFeedbackByType","feedbackType",feedbackType);
			}else{
				list = getHibernateTemplate().findByNamedQuery("getAllFeedback");
			}

			if(list!=null)
				log.debug("Fetched feedback result is :"+list.toString());
			else
				log.debug("List is null");
			
			log.debug("Returning back from fetching Feedback by type");
			
			return list;
		}catch(Exception e){
			log.error("Exception Occurred while fetching Feedback by type :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<FeedbackUpdated> getActiveFeedbackByType(int feedbackType) {
	
		log.debug("Request received for fetching active Feedback by type :"+feedbackType);
		List list = null;
		try{

			if(feedbackType>0){
				list = getHibernateTemplate().findByNamedQueryAndNamedParam("getActiveFeedbackByType","feedbackType",feedbackType);
			}else{
				list = getHibernateTemplate().findByNamedQuery("getAllActiveFeedback");
			}

			if(list!=null)
				log.debug("Fetched active feedback result is :"+list.toString());
			else
				log.debug("List is null");
			
			log.debug("Returning back from fetching Feedback by type");
			
			return list;
		}catch(Exception e){
			System.out.println("Exception Occurred while fetching active Feedback by type :"+e.getMessage());
			log.error("Exception Occurred while fetching active Feedback by type :"+e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
		
	
	@Override
	public boolean saveFeedback(FeedbackUpdated feedbackUpdated) {
		try{
			log.debug("Request received to save Feedback :"+feedbackUpdated);
			
			Long feedBackId = (Long)getHibernateTemplate().save(feedbackUpdated);
			if(feedBackId!=null){
				return true;
			}
			log.debug("Request completed to save Feedback");
		}catch (Exception e) {
			log.error("Exception occured while saving feedback :"+e.getMessage());
		}
		return false;
	}

	
	
	@Override
	public Map<String, List> getAllMatchingCarpooler(String from, String to) {
		
		log.debug("Request received for fetching matched Carpooler.");
		log.debug("Source Place :"+from);
		log.debug("Destination Place :"+to);
		
		Map<String, List> hashMap = new HashMap<String, List>();
		
		
		Session session = getSession();
	
		Criteria criteria1 = session.createCriteria(SourceToDestinationDetails.class);
		criteria1.add(Restrictions.like("sourcePlace", "%" + from + "%"));
		criteria1.add(Restrictions.like("destinationPlace", "%" + to + "%"));
		List<SourceToDestinationDetails> listOfExactMatchCarpooler = criteria1.list();	

		this.releaseSession(session); 
		
		//session.close();
		
		log.debug("Got Matched Carpooler as:"+listOfExactMatchCarpooler);
	
		Session session1 = getSession();
		
		Criteria criteria2 = session1.createCriteria(SourceToDestinationDetails.class);
		criteria2.add(Restrictions.like("inBetweenPlaces", "%" + from + "%"));
		criteria2.add(Restrictions.like("inBetweenPlaces", "%" + to + "%"));
		List<SourceToDestinationDetails> listOfInBetweenMatchCarpooler = criteria2.list();	
		
		this.releaseSession(session1); 
		
		//session1.close();
		
		log.debug("Got appropriate Carpooler as:"+listOfInBetweenMatchCarpooler);
		
		hashMap.put("exactMatch", listOfExactMatchCarpooler);
		hashMap.put("inBetweenMatch", listOfInBetweenMatchCarpooler);
		
		log.debug("Request completed for fetching matched Carpooler.");
		
		return hashMap;
	}
	
	
	@Override
	public List<Carpooler> getExactMatchCarpooler(String from, String to) {
		
		log.debug("Request received for fetching Exact match Carpooler.");
		
		List<Carpooler> listOfFinalCarpooler = new ArrayList<Carpooler>();
		
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findExactMatchingCarpooler", new String[]{"source","destination"}, new String[]{from,to});

			if(list!=null){
				log.debug("Fetched Exact match carpooler list is :"+list.toString());
				
				for (int j = 0; j < list.size(); j++) {
					Object[] l = (Object[])list.get(j);
											
						Carpooler c = (Carpooler)l[0];
						SourceToDestinationDetails std = (SourceToDestinationDetails)l[1];
						
						Carpooler c1 = new Carpooler();
						c1.setCarpoolerCreationDate(c.getCarpoolerCreationDate());
						c1.setCarpoolerId(c.getCarpoolerId());
						c1.setAvailability(c.isAvailability());
						c1.setUser(c.getUser());
						//c1.setListOfVehicleDetails(c.getListOfVehicleDetails());
						c1.setUserType(c.getUserType());
						
						List<SourceToDestinationDetails> listOfSourceToDestinationDetails =new ArrayList<SourceToDestinationDetails>();
						listOfSourceToDestinationDetails.add(std);

						c1.setListOfSourceToDestinationDetails(listOfSourceToDestinationDetails);
						
						listOfFinalCarpooler.add(c1);
						
//						log.debug("Carpooler is :"+c.getCarpoolerId());
//						log.debug("SourceToDestinationDetails is :"+std.getSourceToDestinationId());
				}
				
				
			}else{
				log.debug("List is null");
			}
			
			log.debug("Returning back from fetching Exact match Carpooler");
			
			return listOfFinalCarpooler;
		}catch(Exception e){
			log.error("Exception Occurred while fetching Exact Match Result :"+e.getMessage());
		}
		return null;	
	}
	
	@Override
	public List<Carpooler> getInBetweenMatchCarpooler(String from, String to) {
		
/*		log.debug("Request received for fetching In between match Carpooler.");
		List list = null;
		try{
			
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findInBetweenMatchingCarpooler", new String[]{"source","destination"}, new String[]{"%"+from+"%","%"+to+"%"});

			if(list!=null)
				log.debug("Fetched in between match carpooler list is :"+list.toString());
			else
				log.debug("List is null");
			
			log.debug("Returning back from fetching in between match Carpooler");
			
			return list;
		}catch(Exception e){
			log.error("Exception Occurred while fetching In between Match Result :"+e.getMessage());
		}*/
		return null;	
	}	


	
	@Override
	public List<Carpooler> getAllApproximateMatchCarpooler(String from,String to) {
		log.debug("Request received for fetching Approximate match Carpooler.");
		
		List<Carpooler> listOfFinalCarpooler = new ArrayList<Carpooler>();
		
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findApproximateExactMatchCarpooler", new String[]{"source1","source2","destination1","destination2","source3","destination3"}, new String[]{from,"%"+from+"%",to,"%"+to+"%",from,to});

			if(list!=null){
				log.debug("Fetched approximate match carpooler list is :");
				
				
				for (int j = 0; j < list.size(); j++) {
					Object[] l = (Object[])list.get(j);
											
						Carpooler c = (Carpooler)l[0];
						SourceToDestinationDetails std = (SourceToDestinationDetails)l[1];
						
						Carpooler c1 = new Carpooler();
						c1.setCarpoolerCreationDate(c.getCarpoolerCreationDate());
						c1.setCarpoolerId(c.getCarpoolerId());
						c1.setAvailability(c.isAvailability());
						c1.setUser(c.getUser());
						//c1.setListOfVehicleDetails(c.getListOfVehicleDetails());
						c1.setUserType(c.getUserType());
						
						List<SourceToDestinationDetails> listOfSourceToDestinationDetails =new ArrayList<SourceToDestinationDetails>();
						listOfSourceToDestinationDetails.add(std);

						c1.setListOfSourceToDestinationDetails(listOfSourceToDestinationDetails);
						
						listOfFinalCarpooler.add(c1);
						
//						log.debug("Carpooler is :"+c.getCarpoolerId());
//						log.debug("SourceToDestinationDetails is :"+std.getSourceToDestinationId());
				}
				
				
			}else{
				log.debug("List is null");
			}
			
			log.debug("Returning back from fetching approximate match Carpooler");
			
			return listOfFinalCarpooler;
		}catch(Exception e){
			log.error("Exception Occurred while fetching approximate Match Result :"+e.getMessage());
		}
		return null;
	}
	
	
	@Override
	public List<SourceToDestinationDetails> findMatchingCarpoolerInSourceAndInBetweenPlace(String from){
		log.debug("Request received for fetching matched Carpooler with search point as starting area.");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findMatchingCarpoolerInSourceAndInBetweenPlace", new String[]{"source1","source2"}, new String[]{"%"+from+"%","%"+from+"%"});
			log.debug("Returning back from findMatchingCarpoolerInSourceAndInBetweenPlace method");
			return list;
		}catch(Exception e){
			log.error("Exception Occurred while calling findMatchingCarpoolerInSourceAndInBetweenPlace method :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<SourceToDestinationDetails> findMatchingCarpoolerInDestinationAndInBetweenPlace(String to){
		log.debug("Request received for fetching matched Carpooler with search point as ending area.");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findMatchingCarpoolerInDestinationAndInBetweenPlace", new String[]{"destination1","destination2"}, new String[]{"%"+to+"%","%"+to+"%"});
			log.debug("Returning back from findMatchingCarpoolerInDestinationAndInBetweenPlace method.");
			return list;
		}catch(Exception e){
			log.error("Exception Occurred while calling findMatchingCarpoolerInSourceAndInBetweenPlace method :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public Carpooler getCarpoolerByCarpoolerId(long carpoolerId) {
		log.debug("Request received for fetching Carpooler by Carpooler id :"+carpoolerId);
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findCarpoolerByCarpoolerId","carpoolerId",carpoolerId);
			if (list != null) {
				log.debug("Carpooler list Found with object data :"+list);
				log.debug("Returning from function with carpooler data :"+(Carpooler)list.get(0));
				return (Carpooler)list.get(0);
			}else{
				log.debug("Carpooler list is null.");
			}
			log.debug("Request completed for fetching Carpooler by Carpooler id.");	
			return null;	
		}catch(Exception e){
			log.debug("Exception occured while fetching Carpooler by id :"+e.getMessage());
		}
		return null;
	}
	  
	
	@Override
	public List<SourceToDestinationDetails> getSourceTodestinationDetailsByCarpoolerId(long carpoolerId) {
		log.debug("Request received for fetching SourceToDestinationDetails by Carpooler id :"+carpoolerId);
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findSourceToDestinationDetailsByCarpoolerId","carpoolerId",carpoolerId);
			if (list != null) {
				log.debug("SourceToDestinationDetails list Found with object data :"+list);
				return list;
			}else{
				log.debug("SourceToDestinationDetails list is null.");
			}
			log.debug("Request completed for fetching SourceToDestinationDetails by Carpooler id.");	
			return null;	
		}catch(Exception e){
			log.debug("Exception occured while fetching SourceToDestinationDetails by carpooler id :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public UserTestimonial getTestimonialByUserName(String userName) {
		log.debug("Request received for fetching Testimonial by user name :"+userName);
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findTestimonialByUserName","userName",userName);
			if (list != null) {
				log.debug("UserTestimonial list Found with object data :"+list);
				log.debug("Returning from function with UserTestimonial data :"+(UserTestimonial)list.get(0));
				return (UserTestimonial)list.get(0);
			}else{
				log.debug("UserTestimonial list is null.");
			}
			log.debug("Request completed for fetching UserTestimonial by user name.");	
			return null;	
		}catch(Exception e){
			log.debug("Exception occured while fetching UserTestimonial by user name :"+e.getMessage());
		}
		return null;
	}
	
	@Override
	public User getUserByEmailId(String emailId) {
		log.debug("Request received for fetching user by email id");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findUserByEmailId",new String[] {"emailId"},	new String[] { emailId });
			if (list != null && list.size()>0) {
				log.debug("User Found");
			}			
		}catch(Exception e){
			log.debug("Exception occured while fetching user by email id :"+e.getMessage());
		}
		log.debug("Request completed for fetching user by email id");
		return (list != null && list.size() > 0 ? (User)list.get(0) : null);
	}
	
	@Override
	public User getUserByUserId(String userId) {
		log.debug("Request received for fetching user by user id");
		List list = null;
		try{
			list = getHibernateTemplate().findByNamedQueryAndNamedParam("findUserByUserId",new String[] {"userId"},	new String[] { userId });
			if (list != null && list.size()>0) {
				log.debug("User Found");
			}			
		}catch(Exception e){
			log.debug("Exception occured while fetching user by user id :"+e.getMessage());
		}
		log.debug("Request completed for fetching user by user id");
		return (list != null && list.size() > 0 ? (User)list.get(0) : null);
	}

}
