package com.corporate.carpooldb.dto;

import java.io.Serializable;
import java.util.Date;

public class SourceToDestinationDetails implements Serializable{

	private static final long serialVersionUID = -7158985673279885525L;

	private long sourceToDestinationId;
	private String sourcePlace=null;
	private String destinationPlace=null;
	private String inBetweenPlaces=null;	
	private String sourceLeavingTime=null;
	private String carpoolOnDays=null;
	private Date carpoolDate=null;
	
	private long carpoolerId;

	private boolean availability;
	//private Carpooler carpoolerId;
	
	
	
	public Date getCarpoolDate() {
		return carpoolDate;
	}
	public boolean isAvailability() {
		return availability;
	}
	public void setAvailability(boolean availability) {
		this.availability = availability;
	}
	public void setCarpoolDate(Date carpoolDate) {
		this.carpoolDate = carpoolDate;
	}
	public String getCarpoolOnDays() {
		return carpoolOnDays;
	}
	public void setCarpoolOnDays(String carpoolOnDays) {
		this.carpoolOnDays = carpoolOnDays;
	}
	public long getCarpoolerId() {
		return carpoolerId;
	}
	public void setCarpoolerId(long carpoolerId) {
		this.carpoolerId = carpoolerId;
	}

	
	public long getSourceToDestinationId() {
		return sourceToDestinationId;
	}
//	public Carpooler getCarpoolerId() {
//		return carpoolerId;
//	}
//	public void setCarpoolerId(Carpooler carpoolerId) {
//		this.carpoolerId = carpoolerId;
//	}
	public void setSourceToDestinationId(long sourceToDestinationId) {
		this.sourceToDestinationId = sourceToDestinationId;
	}
	public String getSourceLeavingTime() {
		return sourceLeavingTime;
	}
	public void setSourceLeavingTime(String sourceLeavingTime) {
		this.sourceLeavingTime = sourceLeavingTime;
	}
	public String getSourcePlace() {
		return sourcePlace;
	}
	public void setSourcePlace(String sourcePlace) {
		this.sourcePlace = sourcePlace;
	}
	public String getDestinationPlace() {
		return destinationPlace;
	}
	public void setDestinationPlace(String destinationPlace) {
		this.destinationPlace = destinationPlace;
	}
	public String getInBetweenPlaces() {
		return inBetweenPlaces;
	}
	public void setInBetweenPlaces(String inBetweenPlaces) {
		this.inBetweenPlaces = inBetweenPlaces;
	}
	@Override
	public String toString() {
		return "SourceToDestinationDetails [sourceToDestinationId="
				+ sourceToDestinationId + ", sourcePlace=" + sourcePlace
				+ ", destinationPlace=" + destinationPlace
				+ ", inBetweenPlaces=" + inBetweenPlaces
				+ ", sourceLeavingTime=" + sourceLeavingTime + ", carpoolerId="
				+ carpoolerId + "]";
	}
	
	
}
