package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Permission implements Serializable{

	private static final long serialVersionUID = 1854009997056001419L;
	private long permissionId;
	private String permissionName=null;

	public long getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(long permissionId) {
		this.permissionId = permissionId;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	@Override
	public String toString() {
		return "Permission [permissionId=" + permissionId + ", permissionName="
				+ permissionName + "]";
	}
	
}
