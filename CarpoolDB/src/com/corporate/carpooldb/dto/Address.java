package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Address implements Serializable{

	private static final long serialVersionUID = -4061862434434392498L;

	private long addressId;	
	private String flatNo=null;
	private String apartmentName=null;	
	private String streetName=null;
	private String cityName=null;
	private String stateName=null;
	private String countryName=null;
	private int pincode;
	private String landMarkName=null;
	private String singleAddress=null;
	
	
	public String getSingleAddress() {
		return singleAddress;
	}
	public void setSingleAddress(String singleAddress) {
		this.singleAddress = singleAddress;
	}
	public long getAddressId() {
		return addressId;
	}
	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}
	public String getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(String flatNo) {
		this.flatNo = flatNo;
	}
	public String getApartmentName() {
		return apartmentName;
	}
	public void setApartmentName(String apartmentName) {
		this.apartmentName = apartmentName;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getLandMarkName() {
		return landMarkName;
	}
	public void setLandMarkName(String landMarkName) {
		this.landMarkName = landMarkName;
	}
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", flatNo=" + flatNo
				+ ", apartmentName=" + apartmentName + ", streetName="
				+ streetName + ", cityName=" + cityName + ", stateName="
				+ stateName + ", countryName=" + countryName + ", pincode="
				+ pincode + ", landMarkName=" + landMarkName + "]";
	}
	
}

