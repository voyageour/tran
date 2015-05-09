package com.corporate.transportdb.dto.updated;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "status")
public class Status implements Serializable{
	
	private static final long serialVersionUID = 79885857169780226L;
	
	@Id @GeneratedValue
	@Column(name = "status_id")
	private long statusId;
	
	@Column(name = "status_name")
	private String statusName=null;
	
	public long getStatusId() {
		return statusId;
	}
	public void setStatusId(long statusId) {
		this.statusId = statusId;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	@Override
	public String toString() {
		return "Status [statusId=" + statusId + ", statusName=" + statusName
				+ "]";
	}
	
	
}

