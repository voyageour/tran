package com.corporate.carpooldb.test;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/carpool-application-context.xml"})
public class SourceToDestinationDetailsTest {

	Logger log = Logger.getLogger(SourceToDestinationDetailsTest.class);

	@Autowired
	CarpoolService carpoolService;

	public CarpoolService getCarpoolService() {
		return carpoolService;
	}

	public void setCarpoolService(CarpoolService carpoolService) {
		this.carpoolService = carpoolService;
	}


	@Test
	public void deleteSourceToDestinationDetailsOfCarpooler(){

		log.debug("Finding user by user name");
		User user = carpoolService.getUserByEmailId("pokarjm@gmail.com");
		log.debug("Received user object :"+user);
		
		log.debug("Fetching carpooler by user.");
		Carpooler carpooler = carpoolService.getCarpoolerByUser(user);
		log.debug("Fetched Carpooler is :"+carpooler);


		if(carpooler!=null && carpooler.getListOfSourceToDestinationDetails()!=null && carpooler.getListOfSourceToDestinationDetails().size()>0){

			List<SourceToDestinationDetails> listOfSourceToDestDetails = carpooler.getListOfSourceToDestinationDetails();
			if(listOfSourceToDestDetails!=null && listOfSourceToDestDetails.size()>0){

				for (SourceToDestinationDetails sourceToDestinationDetails : listOfSourceToDestDetails) {
					carpoolService.deleteSourceToDestinationDetails(sourceToDestinationDetails);
				}

			}
		}
	}	




//	@Test
//	public void getAllMatchingCarpooler(){
//
//		log.debug("Request received for fetching all matching carpooler");
//
//		String from = "Silk Board";
//		String to = "Marathalli";
//
//
//		carpoolService.getAllApproximateMatchCarpooler(from, to);
//
//		/*		Map<String, List> mapOfCarpooler = carpoolService.getAllMatchingCarpooler(from, to);
//
//		List<SourceToDestinationDetails> listOfExactMatchCarpooler = mapOfCarpooler.get("exactMatch");
//		List<SourceToDestinationDetails> listOfInBetweenMatchCarpooler = mapOfCarpooler.get("inBetweenMatch");
//
//		if(listOfExactMatchCarpooler!=null){
//			log.debug("Exact Route Found :"+listOfExactMatchCarpooler.size());
//			for (SourceToDestinationDetails sourceToDestinationDetails : listOfExactMatchCarpooler) {
//				log.debug("Exact Route is :"+sourceToDestinationDetails.getSourceToDestinationId());
//				log.debug("Carpooler object :"+sourceToDestinationDetails.getCarpooler());
//
//			}
//		}else{
//			log.debug("Exact Route Not Found");
//		}
//
//		if(listOfExactMatchCarpooler!=null){
//			log.debug("In Between Route Found :"+listOfInBetweenMatchCarpooler.size());
//			for (SourceToDestinationDetails sourceToDestinationDetails : listOfInBetweenMatchCarpooler) {
//				log.debug("Like Route is :"+sourceToDestinationDetails.getSourceToDestinationId());
//				log.debug("Carpooler object :"+sourceToDestinationDetails.getCarpooler());
//			}
//		}else{
//			log.debug("In Between Route Not Found");
//		}
//
//		log.debug("Exact Match carpooler is :"+listOfExactMatchCarpooler);
//		log.debug("In Between Match carpooler is :"+listOfInBetweenMatchCarpooler);
//
//		log.debug("Request completed for fetching all matching carpooler");
//		 */
//
//
//
//
//	}

	//	@Test
	//	public void insertSourceToDestinationRescoredTest(){
	//		log.debug("Request received for inserting Source To Destination Details data");
	//		
	//		String name = "Apurv";
	//		
	//		log.debug("Fetching user with name :"+name);
	//		User user = carpoolService.getUserByUserName(name);
	//		log.debug("Fetching user completed with data :"+user);
	//		
	//		log.debug("Fetching carpooler");
	//		Carpooler carpooler = carpoolService.getCarpoolerByUser(user);
	//		log.debug("Fetching carpooler completed with data :"+carpooler);
	//		
	//		
	//		log.debug("Saving Source to destination details now");
	//		carpoolService.saveSourceToDestinationdetails(carpooler.getCarpoolerId(), "avaya", "KR Puram", "Jayadeva Hospital,BTM,Silk Board,Bellandur,Marathalli", "08:00:00");
	//		log.debug("Request completed for inserting Source To Destination Details data");
	//	}

}
