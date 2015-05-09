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
@Table(name = "driver_vehicle_mapping")
public class DriverVehicleMappingUpdated {

	@Id @GeneratedValue
	@Column(name = "driver_vehicle_mapping_id")
	private Long driverVehicleMappingId;
	
	@OneToOne(targetEntity=DriverUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="driver_id",referencedColumnName="driver_id")
	private DriverUpdated driver;

	@OneToOne(targetEntity=VehicleUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="vehicle_id",referencedColumnName="vehicle_id")
	private VehicleUpdated vehicle;

	
	public Long getDriverVehicleMappingId() {
		return driverVehicleMappingId;
	}

	public void setDriverVehicleMappingId(Long driverVehicleMappingId) {
		this.driverVehicleMappingId = driverVehicleMappingId;
	}

	public DriverUpdated getDriver() {
		return driver;
	}

	public void setDriver(DriverUpdated driver) {
		this.driver = driver;
	}

	public VehicleUpdated getVehicle() {
		return vehicle;
	}

	public void setVehicle(VehicleUpdated vehicle) {
		this.vehicle = vehicle;
	}

}





