package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class CarpoolerPreference implements Serializable{

	private static final long serialVersionUID = 2696490536840464389L;
	
	private long carpoolerPreferenceId;
	private String genderPreference;
	private String compensation;
	private String wayOfContact;

	private Carpooler carpooler=null;

	
	public Carpooler getCarpooler() {
		return carpooler;
	}
	public void setCarpooler(Carpooler carpooler) {
		this.carpooler = carpooler;
	}
	public long getCarpoolerPreferenceId() {
		return carpoolerPreferenceId;
	}
	public void setCarpoolerPreferenceId(long carpoolerPreferenceId) {
		this.carpoolerPreferenceId = carpoolerPreferenceId;
	}


	public String getGenderPreference() {
		return genderPreference;
	}
	public void setGenderPreference(String genderPreference) {
		this.genderPreference = genderPreference;
	}
	public String getCompensation() {
		return compensation;
	}
	public void setCompensation(String compensation) {
		this.compensation = compensation;
	}
	public String getWayOfContact() {
		return wayOfContact;
	}
	public void setWayOfContact(String wayOfContact) {
		this.wayOfContact = wayOfContact;
	}
	@Override
	public String toString() {
		return "CarpoolerPreference [carpoolerPreferenceId="
				+ carpoolerPreferenceId + ", genderPreference="
				+ genderPreference + ", compensation=" + compensation
				+ ", wayOfContact=" + wayOfContact + "]";
	}
	
	
}
