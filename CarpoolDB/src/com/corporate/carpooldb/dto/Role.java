package com.corporate.carpooldb.dto;

import java.io.Serializable;
import java.util.Set;

public class Role implements Serializable{

	private static final long serialVersionUID = -2040129655070496841L;

	private long roleId;
	private String roleName;
	private Set<Permission> setOfPermission=null;
	
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Set<Permission> getSetOfPermission() {
		return setOfPermission;
	}
	public void setSetOfPermission(Set<Permission> setOfPermission) {
		this.setOfPermission = setOfPermission;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName
				+ ", setOfPermission=" + setOfPermission + "]";
	}
	
}
