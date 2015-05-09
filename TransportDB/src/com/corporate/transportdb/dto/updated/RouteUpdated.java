package com.corporate.transportdb.dto.updated;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "route")
public class RouteUpdated {

	@Id @GeneratedValue
	@Column(name = "route_id")
	private Long routeId;
	
	@Column(name = "route_name")
	private String routeName;

	@Column(name = "regular_cab")
	private boolean regularCab;

	@Column(name = "route_map_url")
	private String routeMapUrl;
	
	
	public String getRouteMapUrl() {
		return routeMapUrl;
	}
	public void setRouteMapUrl(String routeMapUrl) {
		this.routeMapUrl = routeMapUrl;
	}
	public boolean getRegularCab() {
		return regularCab;
	}
	public void setRegularCab(boolean regularCab) {
		this.regularCab = regularCab;
	}
	
	public Long getRouteId() {
		return routeId;
	}
	public void setRouteId(Long routeId) {
		this.routeId = routeId;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	
}
