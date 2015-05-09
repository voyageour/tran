package com.corporate.carpooldb.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Carpooler implements Serializable{
	
	private static final long serialVersionUID = -1969597460487529988L;

	private long carpoolerId;
	private String userType=null;
	private boolean availability;
	
	private User user=null;
	//private List<VehicleDetails> listOfVehicleDetails=null;
	private List<SourceToDestinationDetails> listOfSourceToDestinationDetails=null;
//	private CarpoolerPreference carpoolerPreference=null;	
	private Date carpoolerCreationDate;

//	public CarpoolerPreference getCarpoolerPreference() {
//		return carpoolerPreference;
//	}
//	public void setCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
//		this.carpoolerPreference = carpoolerPreference;
//	}
	public Date getCarpoolerCreationDate() {
		return carpoolerCreationDate;
	}
	public void setCarpoolerCreationDate(Date carpoolerCreationDate) {
		this.carpoolerCreationDate = carpoolerCreationDate;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public List<SourceToDestinationDetails> getListOfSourceToDestinationDetails() {
		return listOfSourceToDestinationDetails;
	}
	public void setListOfSourceToDestinationDetails(
			List<SourceToDestinationDetails> listOfSourceToDestinationDetails) {
		this.listOfSourceToDestinationDetails = listOfSourceToDestinationDetails;
	}
	public long getCarpoolerId() {
		return carpoolerId;
	}
	public void setCarpoolerId(long carpoolerId) {
		this.carpoolerId = carpoolerId;
	}
	
	public boolean isAvailability() {
		return availability;
	}
	public void setAvailability(boolean availability) {
		this.availability = availability;
	}
//	public List<VehicleDetails> getListOfVehicleDetails() {
//		return listOfVehicleDetails;
//	}
//	public void setListOfVehicleDetails(List<VehicleDetails> listOfVehicleDetails) {
//		this.listOfVehicleDetails = listOfVehicleDetails;
//	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Carpooler [carpoolerId=" + carpoolerId + ", userType="
				+ userType + ", availability=" + availability + ", user="
				+ user + ", listOfSourceToDestinationDetails="
				+ listOfSourceToDestinationDetails + " , carpoolerCreationDate="
				+ carpoolerCreationDate + "]";
	}
	
}

