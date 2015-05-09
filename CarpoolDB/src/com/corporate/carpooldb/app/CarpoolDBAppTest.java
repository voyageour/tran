package com.corporate.carpooldb.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Address;
import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.Role;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.Status;
import com.corporate.carpooldb.dto.User;

public class CarpoolDBAppTest {

	Logger log = Logger.getLogger(CarpoolDBAppTest.class);
	CarpoolService carpoolService=null; 
	
	public static void main(String[] args) {
		new CarpoolDBAppTest();
		 
	}
	public CarpoolDBAppTest(){
		ApplicationContext context = new ClassPathXmlApplicationContext("carpool-application-context.xml");
	    carpoolService = (CarpoolService) context.getBean("carpoolService");
	    
	    findMatchingCarpoolerInSourceAndInBetweenPlace();
    }
	
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
					it.remove();
				}
			}

			log.debug("MAP AFTER SIZE IS :"+mapOfCarpooler.size());

		}
		
	}
	
}
