package com.corporate.carpooldb.test;

import static org.junit.Assert.assertTrue;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Place;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/carpool-application-context.xml"})
public class PlaceTest {

	@Autowired
	CarpoolService carpoolService;
	
	@Test
	public void fetchAllPLaces(){
		List<Place> listOfPLaces = carpoolService.getAllPlaces();
		Iterator<Place> iterator = listOfPLaces.iterator();
		while (iterator.hasNext()) {
			Place place = (Place) iterator.next();
			System.out.println("Place Name :"+place.getPlaceName());
		}
		assertTrue("Result :", (listOfPLaces!=null && listOfPLaces.size()>0));
	}
}
