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
public class CarpoolerPreferenceTest {

	Logger log = Logger.getLogger(CarpoolerPreferenceTest.class);

	@Autowired
	CarpoolService carpoolService;

	public CarpoolService getCarpoolService() {
		return carpoolService;
	}

	public void setCarpoolService(CarpoolService carpoolService) {
		this.carpoolService = carpoolService;
	}

	
	@Test
	public void deleteCarpoolerPreference(){
		
		try{
		log.debug("Finding user by user name");
		User user = carpoolService.getUserByEmailId("pokarjm@gmail.com");
		log.debug("Received user object :"+user);
		
		log.debug("Fetching carpooler by user.");
		Carpooler carpooler = carpoolService.getCarpoolerByUser(user);
		log.debug("Fetched Carpooler is :"+carpooler);

		if(carpooler!=null){
			
			CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
			carpoolService.deleteCarpoolerPreference(cp);
		}
		}catch (Exception e) {
			System.out.println("eee :"+e.getMessage());
		}
	}


}
