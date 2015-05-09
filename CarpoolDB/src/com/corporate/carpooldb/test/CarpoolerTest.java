package com.corporate.carpooldb.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import static org.junit.Assert.assertTrue;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.CarpoolerPreference;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.User;
import com.corporate.carpooldb.dto.VehicleDetails;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/carpool-application-context.xml"})
public class CarpoolerTest {

	Logger log = Logger.getLogger(CarpoolerTest.class);

	@Autowired
	CarpoolService carpoolService;

	public CarpoolService getCarpoolService() {
		return carpoolService;
	}

	public void setCarpoolService(CarpoolService carpoolService) {
		this.carpoolService = carpoolService;
	}


	//	@Test
	//	public void findCarpoolerByUser(){
	//
	//		User u = carpoolService.getUserByEmailId("jayesh.patel@avaya.com");
	//		Carpooler c = carpoolService.getCarpoolerByUser(u);
	//		assertTrue("Result :", c!=null);
	//	}

	

	@Test
	public void deleteCarpooler(){
		log.debug("Finding user by user name");
		User user = carpoolService.getUserByEmailId("pokarjm@gmail.com");
		log.debug("Received user object :"+user);

		log.debug("Fetching carpooler by user.");
		Carpooler carpooler = carpoolService.getCarpoolerByUser(user);
		log.debug("Fetched Carpooler is :"+carpooler);


		//DELETE EXISTING SOURCE TO DEST DETAILS STARTED
		List<SourceToDestinationDetails> listOfSTD = carpoolService.getSourceTodestinationDetailsByCarpoolerId(carpooler.getCarpoolerId());
		for (SourceToDestinationDetails sourceToDestinationDetails : listOfSTD) {
			carpoolService.deleteSourceToDestinationDetails(sourceToDestinationDetails);
		}
		//DELETE EXISTING SOURCE TO DEST DETAILS ENDED

		

		//DELETE EXISTING CARPOOLER PREFERENCE STARTED
		CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
		carpoolService.deleteCarpoolerPreference(cp);
		//DELETE EXISTING CARPOOLER PREFERENCE ENDED

		
		log.debug("Fetching carpooler by user.");
		Carpooler carpooler1 = carpoolService.getCarpoolerByUser(user);
		log.debug("Fetched Carpooler is :"+carpooler);
		

		//DELETE EXISTING CARPOOLER STARTED
		carpoolService.deleteCarpooler(carpooler1);
		//DELETE EXISTING CARPOOLER ENDED

	}

	
	
	
	/*
	
	@Test
	public void saveCarpoolerProvider(){

		//SAVE CARPOOLER STARTED
		User user = carpoolService.getUserByEmailId("pokarjm@gmail.com");
		System.out.println("User is :"+user);

		Carpooler carpooler=new Carpooler();
		carpooler.setUser(user);
		carpooler.setAvailability(true);
		carpooler.setUserType("provider");		
		carpoolService.saveCarpoolDetails(carpooler);
		//SAVE CARPOOLER ENDED
		
		
		//SAVE CARPOOLPREFERENCE STARTED
		
		Carpooler c = carpoolService.getCarpoolerByUser(user);
		
		CarpoolerPreference cp = new CarpoolerPreference();
		cp.setCarpooler(c);
		cp.setCompensation("money");
		cp.setGenderPreference("any");
		cp.setWayOfContact("email");
		
		carpoolService.saveCarpoolerPreference(cp);

		//SAVE CARPOOLPREFERENCE ENDED
		
		
		
		//SAVE SOURCE TO DESTINATION DETAILS STARTED
		
		Carpooler c1 = carpoolService.getCarpoolerByUser(user);
		
		List<SourceToDestinationDetails> listSourceTodestinationDetails = new ArrayList<SourceToDestinationDetails>();

		SourceToDestinationDetails std1 = new SourceToDestinationDetails();
		std1.setAvailability(true);
		std1.setCarpoolOnDays("Mon,Tue,Wed");
		std1.setCarpoolerId(c1.getCarpoolerId());
		std1.setDestinationPlace("Marathalli");
		std1.setInBetweenPlaces("silkboard --> BTM");
		std1.setSourceLeavingTime("12:22:52");
		std1.setSourcePlace("JP Nagar");

		SourceToDestinationDetails std2 = new SourceToDestinationDetails();
		std2.setAvailability(true);
		std2.setCarpoolOnDays("Mon,Tue,Wed");
		std2.setCarpoolerId(c1.getCarpoolerId());
		std2.setDestinationPlace("Marathalli");
		std2.setInBetweenPlaces("silkboard --> BTM");
		std2.setSourceLeavingTime("12:22:52");
		std2.setSourcePlace("JP Nagar");

		listSourceTodestinationDetails.add(std1);
		listSourceTodestinationDetails.add(std2);

		c1.setListOfSourceToDestinationDetails(listSourceTodestinationDetails);
		carpoolService.updateCarpoolDetails(c1);
		
		//SAVE SOURCE TO DESTINATION DETAILS ENDED
		

	}

*/
	
	
	
	
	/*

		@Test
	public void getCarpoolerByCarpoolerId(){
		log.debug("Request received for fetching carpooler by carpooler id");
		Carpooler carpooler = carpoolService.getCarpoolerByCarpoolerId(145);
		log.debug("carpooler object is :"+carpooler.getCarpoolerPreference().getCompensation());

		assertTrue("Result :", carpooler!=null);
	}


	@Test
	public void getAllExactMatchingCarpooler(){
		log.debug("Request received for fetching all exact matching carpooler");

		String from = "Marathahalli";
		String to = "BTM Layout 2nd Stage";

		List<Carpooler> listOfExactMatchCarpooler = carpoolService.getExactMatchCarpooler(from, to);

		log.debug("listOfExactMatchCarpooler is :"+listOfExactMatchCarpooler);

		for (int i = 0; i < listOfExactMatchCarpooler.size(); i++) {
			Carpooler carpooler = listOfExactMatchCarpooler.get(i);
			log.debug("Exact Match carpooler is :"+carpooler);
			log.debug("Carpooler User type is :"+carpooler.getUserType());

			List<SourceToDestinationDetails> listOfSourceToDestinationDetails = carpooler.getListOfSourceToDestinationDetails();

			log.debug("listOfSourceToDestinationDetails is :"+listOfSourceToDestinationDetails);

			if(listOfSourceToDestinationDetails!=null && listOfSourceToDestinationDetails.size()>0){
				for (int j = 0; j < listOfSourceToDestinationDetails.size(); j++) {

					SourceToDestinationDetails sourceToDestinationDetails = listOfSourceToDestinationDetails.get(j);
					if(sourceToDestinationDetails!=null){
						log.debug("Source ID is :"+sourceToDestinationDetails.getSourceToDestinationId());						
					}else{
						log.debug("sourceToDestinationDetails is null");
					}
				}
			}else{
				log.debug("List of SourceToDestinationDetails is empty or null");
			}
		}
		log.debug("Returning from fetching all exact matching carpooler");
	}
	 */


	//	@Test
	//	public void getAllApproximateMatchingCarpooler(){
	//		log.debug("Request received for fetching all approximate matching carpooler");
	//
	//		String from = "Marathahalli";
	//		String to = "btm";
	//
	//		List<Carpooler> listOfApproximateMatchCarpooler = carpoolService.getAllApproximateMatchCarpooler(from, to);
	//
	//		log.debug("listOfApproximateMatchCarpooler is :"+listOfApproximateMatchCarpooler);
	//
	//		for (int i = 0; i < listOfApproximateMatchCarpooler.size(); i++) {
	//			Carpooler carpooler = listOfApproximateMatchCarpooler.get(i);
	//			log.debug("Approximate Match carpooler is :"+carpooler);
	//			log.debug("Carpooler User type is :"+carpooler.getUserType());
	//
	//			List<SourceToDestinationDetails> listOfSourceToDestinationDetails = carpooler.getListOfSourceToDestinationDetails();
	//
	//			log.debug("listOfSourceToDestinationDetails is :"+listOfSourceToDestinationDetails);
	//
	//			if(listOfSourceToDestinationDetails!=null && listOfSourceToDestinationDetails.size()>0){
	//				for (int j = 0; j < listOfSourceToDestinationDetails.size(); j++) {
	//
	//					SourceToDestinationDetails sourceToDestinationDetails = listOfSourceToDestinationDetails.get(j);
	//					if(sourceToDestinationDetails!=null){
	//						log.debug("Source ID is :"+sourceToDestinationDetails.getSourceToDestinationId());						
	//					}else{
	//						log.debug("sourceToDestinationDetails is null");
	//					}
	//				}
	//			}else{
	//				log.debug("List of SourceToDestinationDetails is empty or null");
	//			}
	//		}
	//		
	//		log.debug("Returning from fetching all approximate matching carpooler");
	//	}
	//	


	
	/*
	@Test
	public void fetchAllCarpooler(){
		List<Carpooler> listOfAllCarpooler = carpoolService.getAllCarpooler();
		Iterator<Carpooler> carpoolIterator = listOfAllCarpooler.iterator();
		while (carpoolIterator.hasNext()) {
			Carpooler carpooler = (Carpooler) carpoolIterator.next();
			System.out.println("User Type :"+carpooler.getUserType());
		}
		assertTrue("Result :", (listOfAllCarpooler!=null && listOfAllCarpooler.size()>0));
	}

	@Test
	public void fetchAllCarpoolProvider(){
		List<Carpooler> listOfAllCarpoolProvider = carpoolService.getAllCarpoolerProvider();
		Iterator<Carpooler> carpoolIterator = listOfAllCarpoolProvider.iterator();
		while (carpoolIterator.hasNext()) {
			Carpooler carpooler = (Carpooler) carpoolIterator.next();
			System.out.println("User Type :"+carpooler.getUserType());
		}
		assertTrue("Result :", (listOfAllCarpoolProvider!=null && listOfAllCarpoolProvider.size()>0));
	}

	@Test
	public void fetchAllCarpoolConsumer(){
		List<Carpooler> listOfAllCarpoolConsumer = carpoolService.getAllCarpoolerConsumer();
		Iterator<Carpooler> carpoolIterator = listOfAllCarpoolConsumer.iterator();
		while (carpoolIterator.hasNext()) {
			Carpooler carpooler = (Carpooler) carpoolIterator.next();
			System.out.println("User Type :"+carpooler.getUserType());
		}
		assertTrue("Result :", (listOfAllCarpoolConsumer!=null && listOfAllCarpoolConsumer.size()>0));	
	}

	 */

	/*
	@Test
	public void saveCarpoolerConsumer(){

		List<SourceToDestinationDetails> listSourceTodestinationDetails = new ArrayList<SourceToDestinationDetails>();
		SourceToDestinationDetails sourceToDestinationDetails1 = getSourceToDestinationDetails("KR Puram", "avaya", "Marathalli,Bellandur,Silk Board,BTM,Jayadeva Hospital", "08:00:00");
		listSourceTodestinationDetails.add(sourceToDestinationDetails1);

		Carpooler carpooler=null;

		User user = getUser("Apurv");
		if(user==null){
			throw new RuntimeException("User Not found...");
		}

		carpooler = getCarpooler("123458", "consumer", user, null, listSourceTodestinationDetails);
		assertTrue("Result :", carpoolService.saveCarpoolDetails(carpooler));

	}
	 */

	/*
	@Test
	public void updateCarpoolerProvider(){
		User user = getUser("jayesh1");
		if(user ==null){
			throw new RuntimeException("User Not found...");
		}
		Carpooler carpooler = (Carpooler)carpoolService.getCarpoolerByUser(user);
		System.out.println(carpooler.getUserType());		
	}
	 */

	/*	@Test
	public void updateCarpoolerConsumer(){

	}*/




	/*
	@Test
	public void findMatchingCarpoolerInSourceAndInBetweenPlace(){
		log.debug("Request received for fetching approximate matching carpooler in Source and in between places");


		String fromArea = "HSR Layout";
		String toArea="Majestic";

		List<Carpooler> listOfExactMatchCarpooler=null;
		List<SourceToDestinationDetails> listOfApproximateMatchSourceToDestDetails=null;

		List<List<SourceToDestinationDetails>> listOfAllListOfApproximateMatchSourceToDestDetails=new ArrayList<List<SourceToDestinationDetails>>();

		Map<Long, SourceToDestinationDetails> mapOfCarpooler = new HashMap<Long, SourceToDestinationDetails>();

		if(fromArea!=null && toArea!=null){
			//EXACT MATCH
			log.debug("Quering for Exact Match carpooler.");
			listOfExactMatchCarpooler = carpoolService.getExactMatchCarpooler(fromArea, toArea);

			//IN-BETWEEN MATCH BY SPLITTING FROM KEYWORDS.
			StringTokenizer stk1 = new StringTokenizer(fromArea," ");

			while(stk1.hasMoreTokens()){
				String token1 = stk1.nextToken();
				listOfApproximateMatchSourceToDestDetails = carpoolService.findMatchingCarpoolerInSourceAndInBetweenPlace(token1);	
				listOfAllListOfApproximateMatchSourceToDestDetails.add(listOfApproximateMatchSourceToDestDetails);
			}


			for (int i = 0; i < listOfAllListOfApproximateMatchSourceToDestDetails.size(); i++) {

				List<SourceToDestinationDetails> listOfSouToDestDetails = listOfAllListOfApproximateMatchSourceToDestDetails.get(i);

				for (int j = 0; j < listOfSouToDestDetails.size(); j++) {
					SourceToDestinationDetails stdDetails = listOfSouToDestDetails.get(j);
					Long carpoolID = stdDetails.getCarpoolerId();
					mapOfCarpooler.put(stdDetails.getSourceToDestinationId(), stdDetails);
				}	
			}

			log.debug("MAP BEFORE SIZE IS :"+mapOfCarpooler.size());


			Set<Long> keys = mapOfCarpooler.keySet();
			Iterator<Long> it = keys.iterator();

			while (it.hasNext()) {
				Long key = (Long) it.next();
				SourceToDestinationDetails stdDetails = mapOfCarpooler.get(key);
				boolean status = false;

				StringTokenizer stk2 = new StringTokenizer(toArea," ");
				while(stk2.hasMoreTokens()){
					String token2 = stk2.nextToken();

					if(stdDetails.getDestinationPlace().contains(token2) || (stdDetails.getInBetweenPlaces()!=null && stdDetails.getInBetweenPlaces().contains(token2)) ){
						status = true;
						break;
					}

				}

				if(status==false){
					mapOfCarpooler.remove(stdDetails.getSourceToDestinationId());
				}
			}

			log.debug("MAP AFTER SIZE IS :"+mapOfCarpooler.size());
		}*/

	//		String from = "HSR";
	//
	//		List<SourceToDestinationDetails> listOfApproximateMatchCarpooler = carpoolService.findMatchingCarpoolerInSourceAndInBetweenPlace(from);
	//
	//		//log.debug("listOfApproximateMatchCarpooler is :"+listOfApproximateMatchCarpooler);
	//
	//		if(listOfApproximateMatchCarpooler!=null)
	//			log.debug("Length is :"+listOfApproximateMatchCarpooler.size());
	//
	//
	//
	//		if(listOfApproximateMatchCarpooler!=null && listOfApproximateMatchCarpooler.size()>0){
	//			for (int j = 0; j < listOfApproximateMatchCarpooler.size(); j++) {
	//
	//				SourceToDestinationDetails sourceToDestinationDetails = listOfApproximateMatchCarpooler.get(j);
	//				if(sourceToDestinationDetails!=null){
	//					log.debug("Source ID is :"+sourceToDestinationDetails.getSourceToDestinationId());						
	//				}else{
	//					log.debug("sourceToDestinationDetails is null");
	//				}
	//			}
	//
	//			log.debug("Returning from fetching all approximate matching carpooler");
	//		}
	//	}



	private Carpooler getCarpooler(boolean availabilty, String userType, User user, List<VehicleDetails> listOfVehicleDetails,  List<SourceToDestinationDetails> listOfSourceToDestinationDetails){
		Carpooler carpooler = new Carpooler();
		carpooler.setAvailability(availabilty);
		carpooler.setUserType(userType);
		carpooler.setListOfSourceToDestinationDetails(listOfSourceToDestinationDetails);
		//carpooler.setListOfVehicleDetails(listOfVehicleDetails);
		carpooler.setUser(user);
		carpooler.setCarpoolerCreationDate(new Date());
		return carpooler;
	}

	private VehicleDetails getVehicleDetails(String drivingLicenceNumber, String vehicleColor, String vehicleRegisteredNumber, int vehicleType){
		VehicleDetails vehicleDetails = new VehicleDetails();
		//		vehicleDetails.setDrivingLicenceNumber(drivingLicenceNumber);
		//		vehicleDetails.setVehicleColor(vehicleColor);
		//		vehicleDetails.setVehicleRegisteredNumber(vehicleRegisteredNumber);
		//		vehicleDetails.setVehicleType(vehicleType);
		return vehicleDetails;
	}

	private SourceToDestinationDetails getSourceToDestinationDetails(String sourcePlace, String destinationPlace, String inBetweenPlaces, String sourceLeavingTime){
		SourceToDestinationDetails sourceToDestinationDetails = new SourceToDestinationDetails();
		sourceToDestinationDetails.setSourcePlace(sourcePlace);
		sourceToDestinationDetails.setDestinationPlace(destinationPlace);
		sourceToDestinationDetails.setInBetweenPlaces(inBetweenPlaces);
		sourceToDestinationDetails.setSourceLeavingTime(sourceLeavingTime);
		return sourceToDestinationDetails;
	}



	private User getUser(String userName){
		return carpoolService.getUserByUserName(userName);
	}


	//	private User getUser(User user, String userName, String password, String emailId, String primaryContactNumber, String secondaryContactNumber, boolean knowDriving, Status status, Role role, Address address){
	//	if(user==null){
	//	user = new User();
	//	}
	//	user.setUserName(userName);
	//	user.setPassword(password);
	//	user.setEmailId(emailId);
	//	user.setPrimaryContactNumber(primaryContactNumber);
	//	user.setSecondaryContactNumber(secondaryContactNumber);
	//	user.setDrivingknown(knowDriving);
	//	user.setStatus(status);
	//	user.setAddress(address);
	//	user.setRole(role);
	//	return user;
	//	}

	//	private Address getAddress(String flatNumber, String apartmentName, String streetName, String landmarkName, String cityName, String stateName, String countryName, int pincode){
	//	Address address = new Address();
	//	address.setFlatNo(flatNumber);
	//	address.setApartmentName(apartmentName);
	//	address.setStreetName(streetName);
	//	address.setLandMarkName(landmarkName);
	//	address.setCityName(cityName);
	//	address.setStateName(stateName);
	//	address.setCountryName(countryName);
	//	address.setPincode(pincode);
	//	return address;	
	//	}

	public static void main(String[] args) {
		new CarpoolerTest();
	}

	//	public CarpoolerTest() {
	//		findMatchingCarpoolerInSourceAndInBetweenPlace();
	//	}
}
