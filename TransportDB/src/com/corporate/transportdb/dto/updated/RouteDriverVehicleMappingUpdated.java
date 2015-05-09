package com.corporate.transportdb.dto.updated;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "route_driver_vehicle_mapping")
public class RouteDriverVehicleMappingUpdated {

	@Id @GeneratedValue
	@Column(name = "route_driver_vehicle_mapping_id")
	private Long routeDriverVehicleMappingId;
	
	@OneToOne(targetEntity=RouteUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="route_id",referencedColumnName="route_id")
	private RouteUpdated route;
	
	@OneToOne(targetEntity=DriverVehicleMappingUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="driver_vehicle_mapping_id",referencedColumnName="driver_vehicle_mapping_id")
	private DriverVehicleMappingUpdated driverVehicleMappingUpdated;

	
	public Long getRouteDriverVehicleMappingId() {
		return routeDriverVehicleMappingId;
	}

	public void setRouteDriverVehicleMappingId(Long routeDriverVehicleMappingId) {
		this.routeDriverVehicleMappingId = routeDriverVehicleMappingId;
	}

	public RouteUpdated getRoute() {
		return route;
	}

	public void setRoute(RouteUpdated route) {
		this.route = route;
	}

	public DriverVehicleMappingUpdated getDriverVehicleMappingUpdated() {
		return driverVehicleMappingUpdated;
	}

	public void setDriverVehicleMappingUpdated(
			DriverVehicleMappingUpdated driverVehicleMappingUpdated) {
		this.driverVehicleMappingUpdated = driverVehicleMappingUpdated;
	}
		
}
