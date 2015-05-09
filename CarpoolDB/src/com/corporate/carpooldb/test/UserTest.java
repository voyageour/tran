package com.corporate.carpooldb.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Address;
import com.corporate.carpooldb.dto.Role;
import com.corporate.carpooldb.dto.Status;
import com.corporate.carpooldb.dto.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/carpool-application-context.xml"})
public class UserTest {

	@Autowired
	CarpoolService carpoolService=null;

	public CarpoolService getCarpoolService() {
		return carpoolService;
	}

	public void setCarpoolService(CarpoolService carpoolService) {
		this.carpoolService = carpoolService;
	}

	
/*	@Test
	public void saveUser(){
		Status status = carpoolService.getStatusByName("ACTIVE");
		Role role = carpoolService.getRoleByRoleName("ROLE_ADMIN");
		Address address = getAddress("102", "Vanshee Eldorado", "Outer Ring Road", "Marathalli", "Bangalore", "Karnataka", "India", 401105);
		
//		log.debug("Hashing Password started");
//		PasswordEncoder encoder = new Md5PasswordEncoder();
//		String hashedPass = encoder.encodePassword(userDTO.getPassword(), null);
//		log.debug("Hashing Password completed");
		
		System.out.println("Date is :"+new Date());
		
		User user = getUser(null, "Nitin", "Patel", "nitin.patel@avaya.com", 1, new Date(), "9887765430", "9742987654", status, role, address);
		
		assertEquals("Result", true, carpoolService.saveUser(user));
	}*/
	


	@Test
	public void fetchUser(){
		List<User> listOfAllUser = carpoolService.getAllUser();
		Iterator<User> iterator = listOfAllUser.iterator();
		
		
		while (iterator.hasNext()) {
			User user = (User) iterator.next();
			System.out.println(user.getUserName());
			System.out.println(user.getStatus().getStatusName());
			System.out.println(user.getRole().getRoleName());
			System.out.println(user.getAddress().getApartmentName());
			System.out.println(user.getDob());
			System.out.println(user.getGender());
			System.out.println(user.getActivationLink());
		}
		
		System.out.println();
		assertTrue("Result :", (listOfAllUser!=null && listOfAllUser.size()>0));	

	}
	

/*	
	@Test
	public void updateUser(){
		User user = carpoolService.getUserByUserName("abc");
		
		if(user!=null){
		
		System.out.println("Before User ID :"+ user.getUserId());	
		Status status = carpoolService.getStatusByName("INACTIVE");
		Role role = carpoolService.getRoleByRoleName("ROLE_REPORT");
		
		System.out.println(" STATUS :"+status + "  ROLE :"+role);
		
		Address address = user.getAddress();
		address.setApartmentName("Nirmal");
		
		//Address address = getAddress("102", "Sar1", "sv road", "near cross word", "SBC", "KR", "IN", 560078);
		User user1 = getUser(user, "jayesh1", "jayesh1", "jayesh.patel@avaya.com", "9886609713", "9742515766", true, status, role, address);
		
		System.out.println("ID :"+user1.getUserId());
		
		assertEquals("Result", true, carpoolService.updateUser(user1));
		}else{
			assertTrue(false);
		}
	}

	

	@Test
	public void deleteUser(){
		assertTrue("Result :", carpoolService.deleteUser("jayesh1"));
	}
	*/ 

	private User getUser(User user, String userName, String password, String emailId, int gender, Date dob, String primaryContactNumber, String secondaryContactNumber, Status status, Role role, Address address){
		if(user==null){
			user = new User();
		}
		user.setUserName(userName);
		user.setPassword(password);
		user.setEmailId(emailId);
		user.setDob(dob);
		user.setGender(gender);
		user.setPrimaryContactNumber(primaryContactNumber);
		user.setSecondaryContactNumber(secondaryContactNumber);
		user.setStatus(status);
		user.setAddress(address);
		user.setRole(role);
		return user;
	}

	private Address getAddress(String flatNumber, String apartmentName, String streetName, String landmarkName, String cityName, String stateName, String countryName, int pincode){
		Address address = new Address();
		address.setFlatNo(flatNumber);
		address.setApartmentName(apartmentName);
		address.setStreetName(streetName);
		address.setLandMarkName(landmarkName);
		address.setCityName(cityName);
		address.setStateName(stateName);
		address.setCountryName(countryName);
		address.setPincode(pincode);
		return address;	
	}
}
