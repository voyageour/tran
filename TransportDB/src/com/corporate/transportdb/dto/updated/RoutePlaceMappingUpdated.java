package com.corporate.transportdb.dto.updated;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "route_place_mapping")
public class RoutePlaceMappingUpdated {
	
	@Id @GeneratedValue
	@Column(name = "route_place_mapping_id")
	private Long routePlaceMappingId;
	
	@OneToOne(targetEntity=RouteUpdated.class)
    @JoinColumn(name="route_id", referencedColumnName="route_id")
	private RouteUpdated route;
	 
	@OneToOne(targetEntity=PlaceUpdated.class)
    @JoinColumn(name="place_id",referencedColumnName="place_id")
	private PlaceUpdated place;
	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "arrival_time", nullable=false, length=19)
	private Date arrivalTime;
	
	@Column(name = "sequence_of_arrival")
	private String sequenceArrivalAtPlace;

	public Long getRoutePlaceMappingId() {
		return routePlaceMappingId;
	}

	public void setRoutePlaceMappingId(Long routePlaceMappingId) {
		this.routePlaceMappingId = routePlaceMappingId;
	}

	public RouteUpdated getRoute() {
		return route;
	}

	public void setRoute(RouteUpdated route) {
		this.route = route;
	}

	public PlaceUpdated getPlace() {
		return place;
	}

	public void setPlace(PlaceUpdated place) {
		this.place = place;
	}

	public Date getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getSequenceArrivalAtPlace() {
		return sequenceArrivalAtPlace;
	}

	public void setSequenceArrivalAtPlace(String sequenceArrivalAtPlace) {
		this.sequenceArrivalAtPlace = sequenceArrivalAtPlace;
	}
	
}


