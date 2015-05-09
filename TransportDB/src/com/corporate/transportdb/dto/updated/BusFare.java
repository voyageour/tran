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
@Table(name = "bus_fare")
public class BusFare {

	@Id @GeneratedValue
	@Column(name = "bus_fare_id")
	private int busFareId;
	
	@Column(name = "route_id")
	private int routeId;
	
	@Column(name = "bus_fare_amount")
	private int busFareAmount;

	public int getBusFareId() {
		return busFareId;
	}

	public void setBusFareId(int busFareId) {
		this.busFareId = busFareId;
	}

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	public int getBusFareAmount() {
		return busFareAmount;
	}

	public void setBusFareAmount(int busFareAmount) {
		this.busFareAmount = busFareAmount;
	}
	
}

