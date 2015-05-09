package com.corporate.transportdb.dto.updated;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "place")
public class PlaceUpdated {


	@Id @GeneratedValue
	@Column(name = "place_id")
	private Long placeId;

	@Column(name = "place_name")
	private String placeName;	
	
	public Long getPlaceId() {
		return placeId;
	}
	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	
	
}
