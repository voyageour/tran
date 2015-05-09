package com.corporate.transportdb.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/transport-application-context.xml"})
public class TransportPreferenceTest {

	Logger log = Logger.getLogger(TransportPreferenceTest.class);

	@Autowired
	TransportServiceUpdated transportServiceUpdated;

	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@Test
	public void deleteCarpoolerPreference(){

		try{
			System.out.println("Finding user by user name");
			List<UserUpdated> lisUserUpdated = transportServiceUpdated.getAllUserUpdated();
			System.out.println("Received user object :"+lisUserUpdated);

			for (UserUpdated userUpdated : lisUserUpdated) {
				System.out.println(userUpdated.getUserName());
			}
		}catch (Exception e) {
			System.out.println("eee :"+e.getMessage());
		}
	}


}
