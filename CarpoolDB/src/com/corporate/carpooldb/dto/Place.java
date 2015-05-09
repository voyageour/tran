package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Place implements Serializable{

	private static final long serialVersionUID = -8423055931986585698L;
	
	private long placeId;
	private String placeName;
	
	public long getPlaceId() {
		return placeId;
	}
	public void setPlaceId(long placeId) {
		this.placeId = placeId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	@Override
	public String toString() {
		return "Place [placeId=" + placeId + ", placeName=" + placeName + "]";
	}
	
	
}
