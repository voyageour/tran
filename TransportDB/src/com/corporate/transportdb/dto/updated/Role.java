package com.corporate.transportdb.dto.updated;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "role")
public class Role implements Serializable{

	private static final long serialVersionUID = -2040129655070496841L;

	@Id @GeneratedValue
	@Column(name = "role_id")
	private long roleId;
	
	@Column(name = "role_name")
	private String roleName;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "permissionId")
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
