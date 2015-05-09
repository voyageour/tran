package com.corporate.transportdb.dto.updated;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "user")
public class UserUpdated {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "user_id")
	private Long userId;
	
	@Column(name = "user_name")
	private String userName;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "email_id")
	private String emailId;
	
	@Column(name = "avail_bus_facility")
	private boolean availBusService;


	@OneToOne(targetEntity=Role.class)
    @JoinColumn(name="role_id",referencedColumnName="role_id")
	private Role role=null;	
	
	@OneToOne(targetEntity=Status.class)
    @JoinColumn(name="status_id",referencedColumnName="status_id")
	private Status status=null;

	
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAvailBusService() {
		return availBusService;
	}
	public void setAvailBusService(boolean availBusService) {
		this.availBusService = availBusService;
	}
	
}
