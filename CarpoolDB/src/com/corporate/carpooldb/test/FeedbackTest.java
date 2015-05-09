package com.corporate.carpooldb.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.FeedbackUpdated;
import com.corporate.carpooldb.dto.User;
import com.corporate.carpooldb.dto.UserTestimonial;
import static org.junit.Assert.assertTrue;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/carpool-application-context.xml"})
public class FeedbackTest {

	Logger log = Logger.getLogger(FeedbackTest.class);

	@Autowired
	CarpoolService carpoolService=null;

	public CarpoolService getCarpoolService() {
		return carpoolService;
	}

	public void setCarpoolService(CarpoolService carpoolService) {
		this.carpoolService = carpoolService;
	}


	/*	@Test
	public void getAllTestimonialTest(){
		log.debug("Request received for fetching all testimonial");
		List<UserTestimonial> listOfUserTestimonial = carpoolService.getAllTestimonial();
		for (int i = 0; i < listOfUserTestimonial.size(); i++) {
			UserTestimonial userTestimonial = listOfUserTestimonial.get(i);
			log.debug("Testimonial No : "+i+" started");
			log.debug("id :"+userTestimonial.getUserTestimonialId()+ " User: "+userTestimonial.getUser().getUserName()+ " testimonial: "+userTestimonial.getTestimonial().getTestimonial());
			log.debug("Testimonial No : "+i+" completed");
		}
		log.debug("Request completed for fetching all testimonial");
	}
	*/

	/*
	@Test
	public void getTestimonialByUserName(){
		log.debug("Request received for fetching testimonial by user name");
		UserTestimonial userTestimonial = carpoolService.getTestimonialByUserName("Khyati");

		if(userTestimonial!=null){
			log.debug("Testimonial Id :"+userTestimonial.getUserTestimonialId()+ " User: "+userTestimonial.getUser().getUserName());
		}else{
			log.debug("UserTestimonial object is null");
		}
		log.debug("Request completed for fetching testimonial by user name");
		assertTrue("Result :", userTestimonial!=null);
	}
	*/



	/*
	@Test
	public void saveFeedbackByType(){
		log.debug("Request received for saving feedback");
		
		//General = 1 
		//Suggestion = 2 
		//Problem = 3 
		//Praise = 4

		log.debug("Finding user by user name");
		User user = carpoolService.getUserByEmailId("pokarjm@gmail.com");
		log.debug("Received user object :"+user);
		
		carpoolService.saveFeedback(2, "Servicezbhh is worst", null, true);
		log.debug("Request completed for saving feedback");
	}

*/
	
	/*@Test
	public void getFeedbackByType(){
		log.debug("Request received for fetching all feedback");
		List<FeedbackUpdated> listOfFeedback = carpoolService.getFeedbackByType(-1); //-1 for all feedback | specify id for specific feedback (1 = Praise, 2 = suggestion, 3 = problem, 4 = feedback(general) )
		for (int i = 0; i < listOfFeedback.size(); i++) {
			FeedbackUpdated feedbackUpdated = listOfFeedback.get(i);
			log.debug("feedback No : "+i+" started");
			log.debug("id :"+feedbackUpdated.getFeedbackId()+ " User: "+feedbackUpdated.getUser().getUserName()+ " feedback: "+feedbackUpdated.getFeedbackContents());
			log.debug("feedback No : "+i+" completed");
		}
		log.debug("Request completed for fetching all feedback");
	}
	*/
	
	
	@Test
	public void getActiveFeedbackByType(){
		log.debug("Request received for fetching all feedback");
		List<FeedbackUpdated> listOfFeedback = carpoolService.getActiveFeedbackByType(-1); //-1 for all feedback | specify id for specific feedback (1 = Praise, 2 = suggestion, 3 = problem, 4 = feedback(general) )
		for (int i = 0; i < listOfFeedback.size(); i++) {
			FeedbackUpdated feedbackUpdated = listOfFeedback.get(i);
			log.debug("feedback No : "+i+" started");
			log.debug("id :"+feedbackUpdated.getFeedbackId()+ " User: "+feedbackUpdated.getUser().getUserName()+ " feedback: "+feedbackUpdated.getFeedbackContents());
			log.debug("feedback No : "+i+" completed");
		}
		log.debug("Request completed for fetching all feedback");
	}
	
	
	private User getUser(String userName){
		return carpoolService.getUserByUserName(userName);
	}
	

}
