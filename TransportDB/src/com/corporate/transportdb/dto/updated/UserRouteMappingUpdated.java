package com.corporate.transportdb.dto.updated;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "user_route_mapping")
public class UserRouteMappingUpdated {

	@Id @GeneratedValue
	@Column(name = "user_route_mapping_id")
	private Long userRouteMappingId;
	
	@OneToOne(targetEntity=UserUpdated.class)
    @JoinColumn(name="user_id",referencedColumnName="user_id")
	private UserUpdated user;
	
	@OneToOne(targetEntity=RouteUpdated.class)
    @JoinColumn(name="route_id",referencedColumnName="route_id")
	private RouteUpdated route;
	
	@OneToOne(targetEntity=PlaceUpdated.class)
    @JoinColumn(name="place_id",referencedColumnName="place_id")
	private PlaceUpdated place;
	
	
	public PlaceUpdated getPlace() {
		return place;
	}
	public void setPlace(PlaceUpdated place) {
		this.place = place;
	}
	public UserUpdated getUser() {
		return user;
	}
	public void setUser(UserUpdated user) {
		this.user = user;
	}
	
	public RouteUpdated getRoute() {
		return route;
	}
	public void setRoute(RouteUpdated route) {
		this.route = route;
	}
	public Long getUserRouteMappingId() {
		return userRouteMappingId;
	}
	public void setUserRouteMappingId(Long userRouteMappingId) {
		this.userRouteMappingId = userRouteMappingId;
	}
	
}
