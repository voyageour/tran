package com.corporate.carpooldb.db;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * Interface contains all the method expose to Controller layer.
 * 
 * @author jayesh.patel
 * @version 1.0
 */
public interface CarpoolService {

	public boolean validateUser(User user);
	public List<Place> getAllPlaces();
	public Place getPlacebyPlaceName(String placeName);
	public List<User> getAllCarpoolProviderDetails();
	public List<User> getAllCarpoolConsumerDetails();
	public User getUserByUserName(String userName);
	public User getUserByEmailId(String emailId);
	public User getUserByUserId(String userId);
	
	public boolean saveCarpoolDetails(Carpooler carpooler);
	public boolean updateCarpoolDetails(Carpooler carpooler);
	public boolean saveSourceTodestinationDetails(SourceToDestinationDetails std);
	public boolean saveCarpoolerPreference(CarpoolerPreference carpoolerPreference);
	
	
	public Status getStatusByName(String statusName);
	public Role getRoleByRoleName(String roleName);
	public boolean saveUser(User user);
	public List<User> getAllUser();
	public boolean updateUser(User user);
	public boolean deleteUser(String userName);
	public Carpooler getCarpoolerByUser(User user);
	public List<Carpooler> getAllCarpooler();
	public List<Carpooler> getAllCarpoolerProvider();
	public List<Carpooler> getAllCarpoolerConsumer();
	public List<SourceToDestinationDetails> getAllSourceToDestinationDetailsbyCarpooler(Carpooler carpooler);
	public List<Carpooler> getTopTenCarpooler();
	public List<UserTestimonial> getAllTestimonial();
	public Map<String, List> getAllMatchingCarpooler(String from, String to);
	//public void saveSourceToDestinationdetails(long carpooler, String sourcePlace, String destinationPlace, String inBetweenPlace, String sourceLeavingTime);
	public List<Carpooler> getExactMatchCarpooler(String from, String to);	
	public List<Carpooler> getInBetweenMatchCarpooler(String from, String to);	
	public List<Carpooler> getAllApproximateMatchCarpooler(String from, String to);	
	public Carpooler getCarpoolerByCarpoolerId(long carpoolerId);
	public List<SourceToDestinationDetails> getSourceTodestinationDetailsByCarpoolerId(long carpoolerId);
	
	
	public UserTestimonial getTestimonialByUserName(String userName);
	public List<FeedbackUpdated> getFeedbackByType(int feedbackType);
	public List<FeedbackUpdated> getActiveFeedbackByType(int feedbackType);
	
	public boolean saveFeedback(int feedbackType, String feebackContent, User user, boolean isActive);

	public List<SourceToDestinationDetails> findMatchingCarpoolerInSourceAndInBetweenPlace(String from);
	public List<SourceToDestinationDetails> findMatchingCarpoolerInDestinationAndInBetweenPlace(String to);
	
	public boolean deleteSourceToDestinationDetails(SourceToDestinationDetails std);
	public boolean deleteCarpoolerPreference(CarpoolerPreference carpoolerPreference);
	public boolean deleteCarpooler(Carpooler carpooler);
	
	public CarpoolerPreference getCarpoolerPreferenceByCarpooler(Carpooler carpooler);
}
