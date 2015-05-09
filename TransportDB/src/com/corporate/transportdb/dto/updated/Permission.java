package com.corporate.transportdb.dto.updated;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "permission")
public class Permission implements Serializable{

	private static final long serialVersionUID = 1854009997056001419L;
	
	@Id @GeneratedValue
	@Column(name = "permission_id")
	private long permissionId;
	
	@Column(name = "permission_name")
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
