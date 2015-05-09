package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Status implements Serializable{
	
	private static final long serialVersionUID = 79885857169780226L;
	private long statusId;
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

