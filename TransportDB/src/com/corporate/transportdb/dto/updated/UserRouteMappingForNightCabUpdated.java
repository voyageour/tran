package com.corporate.transportdb.dto.updated;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "user_route_night_cab_mapping")
public class UserRouteMappingForNightCabUpdated {

	@Id @GeneratedValue
	@Column(name = "user_route_night_cab_mapping_id")
	private Long userRouteMappingId;
	
	@OneToOne(targetEntity=UserUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="user_id",referencedColumnName="user_id")
	private UserUpdated user;
	
	@OneToOne(targetEntity=RouteUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="route_id",referencedColumnName="route_id")
	private RouteUpdated route;
	
	@OneToOne(targetEntity=PlaceUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="place_id",referencedColumnName="place_id")
	private PlaceUpdated place;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date_of_booking", nullable=false, length=19)
	private Date dateOfBooking;


	public PlaceUpdated getPlace() {
		return place;
	}

	public void setPlace(PlaceUpdated place) {
		this.place = place;
	}

	public Date getDateOfBooking() {
		return dateOfBooking;
	}

	public void setDateOfBooking(Date dateOfBooking) {
		this.dateOfBooking = dateOfBooking;
	}

	public Long getUserRouteMappingId() {
		return userRouteMappingId;
	}

	public void setUserRouteMappingId(Long userRouteMappingId) {
		this.userRouteMappingId = userRouteMappingId;
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

		
}
