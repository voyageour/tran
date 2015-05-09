package com.corporate.transportdb.domain;

import java.util.List;

import com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.UserRouteMappingForNightCabUpdated;
import com.corporate.transportdb.dto.updated.UserRouteMappingUpdated;

public class RouteDetailsHelper {

	RouteUpdated route;
	List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated;
	List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated;
	RouteDriverVehicleMappingUpdated routeDriverVehicleMappingUpdated;
	List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated;
	
	
	public List<UserRouteMappingForNightCabUpdated> getListOfUserRouteMappingForNightCabUpdated() {
		return listOfUserRouteMappingForNightCabUpdated;
	}
	public void setListOfUserRouteMappingForNightCabUpdated(
			List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated) {
		this.listOfUserRouteMappingForNightCabUpdated = listOfUserRouteMappingForNightCabUpdated;
	}
	
	public RouteUpdated getRoute() {
		return route;
	}
	public void setRoute(RouteUpdated route) {
		this.route = route;
	}
	public List<RoutePlaceMappingUpdated> getListOfRoutePlaceMappingUpdated() {
		return listOfRoutePlaceMappingUpdated;
	}
	public void setListOfRoutePlaceMappingUpdated(
			List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated) {
		this.listOfRoutePlaceMappingUpdated = listOfRoutePlaceMappingUpdated; 
	}
	public List<UserRouteMappingUpdated> getListOfUserRouteMappingUpdated() {
		return listOfUserRouteMappingUpdated;
	}
	public void setListOfUserRouteMappingUpdated(
			List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated) {
		this.listOfUserRouteMappingUpdated = listOfUserRouteMappingUpdated;
	}
	public RouteDriverVehicleMappingUpdated getRouteDriverVehicleMappingUpdated() {
		return routeDriverVehicleMappingUpdated;
	}
	public void setRouteDriverVehicleMappingUpdated(
			RouteDriverVehicleMappingUpdated routeDriverVehicleMappingUpdated) {
		this.routeDriverVehicleMappingUpdated = routeDriverVehicleMappingUpdated;
	}
	
}
