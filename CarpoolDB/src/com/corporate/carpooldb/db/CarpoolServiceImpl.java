package com.corporate.carpooldb.db;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
 * Implementation class for all the method expose to controller layer.
 * @author jayesh.patel
 *
 */
@Service("carpoolService")
@Transactional(readOnly = false, value="transactionManagerCarpool") 
public class CarpoolServiceImpl implements CarpoolService{
	
	@Autowired
	private CarpoolDao carpoolDao=null;
	
	public CarpoolDao getCarpoolDao() {
		return carpoolDao;
	}

	public void setCarpoolDao(CarpoolDao carpoolDao) {
		this.carpoolDao = carpoolDao;
	}

	@Override
	public List<User> getAllCarpoolConsumerDetails() {
		System.out.println("CarpoolServiceImpl.getAllCarpoolConsumerDetails() 3");
		System.out.println(carpoolDao.getAllCarpoolConsumerDetails());
		System.out.println("CarpoolServiceImpl.getAllCarpoolConsumerDetails() 4");
		return null;
	}

	@Override
	public List<User> getAllCarpoolProviderDetails() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Returns all the places from the DAO layer.
	 * @return
	 */
	@Override
	public List<Place> getAllPlaces() {
		System.out.println("CarpoolServiceImpl.getAllPlaces()");
		return carpoolDao.getAllPlaces();
	}

	@Override
	public Place getPlacebyPlaceName(String placeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validateUser(User user) {
		carpoolDao.validateUser(user);
		return false;
	}

	@Override
	public User getUserByUserName(String userName) {
		return carpoolDao.getUserByUserName(userName);
	}

	@Override
	public boolean saveCarpoolDetails(Carpooler carpooler) {
		System.out.println("CarpoolServiceImpl.saveCarpoolDetails()");
		carpooler.setCarpoolerCreationDate(new Date());
		return carpoolDao.saveCarpoolDetails(carpooler);
	}

	@Override
	public Status getStatusByName(String statusName) {
		System.out.println("CarpoolServiceImpl.getStatusByName()");
		return carpoolDao.getStatusByName(statusName);
	}

	@Override
	public Role getRoleByRoleName(String roleName) {
		return carpoolDao.getRoleByRoleName(roleName);
	}

	@Override
	public boolean saveUser(User user) {
		System.out.println("CarpoolServiceImpl.saveUser()");
		user.setUserCreationDate(new Date());		
		return carpoolDao.saveUser(user);
	}

	@Override
	public List<User> getAllUser() {
		return carpoolDao.getAllUser();
	}

	@Override
	public boolean updateUser(User user) {
		return carpoolDao.updateUser(user);
	}

	@Override
	public boolean deleteUser(String userName) {
		User user = carpoolDao.getUserByUserName(userName);
		if(user!=null){
			System.out.println("USER :"+user);
			return carpoolDao.deleteUser(user);
		}
		System.out.println("User Not Found");
		return false;
	}
	
	@Override
	public Carpooler getCarpoolerByUser(User user) {
		return carpoolDao.getCarpoolerByUser(user);
	}
	
	@Override
	public List<Carpooler> getAllCarpooler() {
		return carpoolDao.getAllCarpooler();
	}
	@Override
	public List<Carpooler> getAllCarpoolerConsumer() {
		return carpoolDao.getAllCarpoolerConsumer();
	}
	@Override
	public List<Carpooler> getAllCarpoolerProvider() {
		return carpoolDao.getAllCarpoolerProvider();
	}
	
	@Override
	public List<SourceToDestinationDetails> getAllSourceToDestinationDetailsbyCarpooler(
			Carpooler carpooler) {
		return carpoolDao.getAllSourceToDestinationDetailsbyCarpooler(carpooler);
	}
	
	@Override
	public List<Carpooler> getTopTenCarpooler() {
		return carpoolDao.getTopTenCarpooler();
	}
	
	@Override
	public List<UserTestimonial> getAllTestimonial() {
		return carpoolDao.getAllTestimonial();
	}
	
	@Override
	public Map<String, List> getAllMatchingCarpooler(String from, String to) {
		return carpoolDao.getAllMatchingCarpooler(from, to);
	}
	
	
//	@Override
//	public void saveSourceToDestinationdetails(long carpooler,
//			String sourcePlace, String destinationPlace, String inBetweenPlace,
//			String sourceLeavingTime) {
////		SourceToDestinationDetails sourceToDestinationDetails = new SourceToDestinationDetails();
////		sourceToDestinationDetails.setCarpoolerId(carpooler);
////		sourceToDestinationDetails.setSourcePlace(sourcePlace);
////		sourceToDestinationDetails.setDestinationPlace(destinationPlace);
////		sourceToDestinationDetails.setInBetweenPlaces(inBetweenPlace);
////		sourceToDestinationDetails.setSourceLeavingTime(sourceLeavingTime);
//		
//		carpoolDao.saveSourceToDestinationdetails(sourceToDestinationDetails);
//	}

	@Override
	public List<Carpooler> getExactMatchCarpooler(String from, String to) {
		return carpoolDao.getExactMatchCarpooler(from, to);
	}
	
	@Override
	public List<Carpooler> getInBetweenMatchCarpooler(String from, String to) {
		return carpoolDao.getInBetweenMatchCarpooler(from, to);
	}
	
	@Override
	public List<Carpooler> getAllApproximateMatchCarpooler(String from,
			String to) {
		return carpoolDao.getAllApproximateMatchCarpooler(from, to);
	}
	
	@Override
	public Carpooler getCarpoolerByCarpoolerId(long carpoolerId) {
		return carpoolDao.getCarpoolerByCarpoolerId(carpoolerId);
	}
	
	@Override
	public UserTestimonial getTestimonialByUserName(String userName) {
		return carpoolDao.getTestimonialByUserName(userName);
	}
	
	@Override
	public List<FeedbackUpdated> getFeedbackByType(int feedbackType) {
		return carpoolDao.getFeedbackByType(feedbackType);
	}
	
	@Override
	public List<FeedbackUpdated> getActiveFeedbackByType(int feedbackType) {
		return carpoolDao.getActiveFeedbackByType(feedbackType);
	}
	
	@Override
	public boolean saveFeedback(int feedbackType, String feebackContent, User user, boolean isActive) {
		FeedbackUpdated feedbackUpdated = new FeedbackUpdated();
		feedbackUpdated.setFeedbackType(feedbackType);
		feedbackUpdated.setFeedbackContents(feebackContent);
		feedbackUpdated.setUser(user);
		feedbackUpdated.setActive(isActive);

		return carpoolDao.saveFeedback(feedbackUpdated);
	}
	
	@Override
	public User getUserByEmailId(String emailId) {
		return carpoolDao.getUserByEmailId(emailId);
	}
	
	@Override
	public List<SourceToDestinationDetails> findMatchingCarpoolerInSourceAndInBetweenPlace(String from) {
		return carpoolDao.findMatchingCarpoolerInSourceAndInBetweenPlace(from);
	}
	@Override
	public List<SourceToDestinationDetails> findMatchingCarpoolerInDestinationAndInBetweenPlace(String to) {	
		return carpoolDao.findMatchingCarpoolerInDestinationAndInBetweenPlace(to);
	}
	@Override
	public User getUserByUserId(String userId) {
		return carpoolDao.getUserByUserId(userId);
	}
	
	@Override
	public boolean updateCarpoolDetails(Carpooler carpooler) {
		return carpoolDao.updateCarpoolDetails(carpooler);
	}
	
	@Override
	public boolean deleteSourceToDestinationDetails(SourceToDestinationDetails std) {
		return carpoolDao.deleteSourceToDestinationDetails(std);
	}
	
	@Override
	public CarpoolerPreference getCarpoolerPreferenceByCarpooler(Carpooler carpooler) {
		return carpoolDao.getCarpoolerPreferenceByCarpooler(carpooler);
	}
	
	@Override
	public boolean deleteCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
		return carpoolDao.deleteCarpoolerPreference(carpoolerPreference);
	}
	
	@Override
	public boolean deleteCarpooler(Carpooler carpooler) {
		return carpoolDao.deleteCarpooler(carpooler);
	}
	@Override
	public boolean saveSourceTodestinationDetails(SourceToDestinationDetails std) {
		return carpoolDao.saveSourceTodestinationDetails(std);
	}
	
	@Override
	public boolean saveCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
		return carpoolDao.saveCarpoolerPreference(carpoolerPreference);
	}
	
	@Override
	public List<SourceToDestinationDetails> getSourceTodestinationDetailsByCarpoolerId(long carpoolerId) {
		return carpoolDao.getSourceTodestinationDetailsByCarpoolerId(carpoolerId);
	}
}
