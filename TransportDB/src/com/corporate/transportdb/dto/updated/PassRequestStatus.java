package com.corporate.transportdb.dto.updated;

import java.util.Date;

import javax.persistence.CascadeType;
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
@Table(name = "user_request")
public class PassRequestStatus {

	@Id @GeneratedValue
	@Column(name = "user_request_id")
	private Long passRequestId;
	
	@OneToOne(targetEntity=UserUpdated.class)
    @JoinColumn(name="user_id",referencedColumnName="user_id")
	private UserUpdated user;
	
	@OneToOne(targetEntity=RouteUpdated.class)
    @JoinColumn(name="route_id",referencedColumnName="route_id")
	private RouteUpdated route;
	
	@OneToOne(targetEntity=PlaceUpdated.class)
    @JoinColumn(name="place_id",referencedColumnName="place_id")
	private PlaceUpdated place;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="request_date", nullable=false, length=19)
	private Date requestDate;

	@Column(name = "request")
	private String request;

	@Column(name = "status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="admin_status_date", nullable=false, length=19)
	private Date adminStatusDate;

	public Long getPassRequestId() {
		return passRequestId;
	}

	public void setPassRequestId(Long passRequestId) {
		this.passRequestId = passRequestId;
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

	public PlaceUpdated getPlace() {
		return place;
	}

	public void setPlace(PlaceUpdated place) {
		this.place = place;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getAdminStatusDate() {
		return adminStatusDate;
	}

	public void setAdminStatusDate(Date adminStatusDate) {
		this.adminStatusDate = adminStatusDate;
	}

}
