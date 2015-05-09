package com.corporate.transportdb.dto.updated;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author jayesh.patel
 *
 */
@Entity
@Table(name = "driver")
public class DriverUpdated {

	@Id @GeneratedValue
	@Column(name = "driver_id")
	private Long driverId;
	
	@Column(name = "driver_name")
	private String driverName;
	 
	@Column(name = "driver_mob_number")
	private String driverMobileNumber;


	public Long getDriverId() {
		return driverId;
	}

	public void setDriverId(Long driverId) {
		this.driverId = driverId;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDriverMobileNumber() {
		return driverMobileNumber;
	}

	public void setDriverMobileNumber(String driverMobileNumber) {
		this.driverMobileNumber = driverMobileNumber;
	}
	
	
}
