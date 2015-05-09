package com.corporate.carpooldb.dto;

import java.io.Serializable;
import java.util.Date;


public class User implements Serializable{

	private static final long serialVersionUID = 3737068277651341982L;
	
	private long userId;
	private String userName=null;
	private String password=null;
	private int gender;
	private Date dob=null;
	
	private String emailId=null;
	private String primaryContactNumber;
	private String secondaryContactNumber;	
	
	private Date userCreationDate=null;
	private String userProfilePic=null;
	
	private String activationLink=null;
	
	private Role role=null;	
	private Status status=null;
	private Address address=null;
	


	public String getActivationLink() {
		return activationLink;
	}
	public void setActivationLink(String activationLink) {
		this.activationLink = activationLink;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getUserProfilePic() {
		return userProfilePic;
	}
	public void setUserProfilePic(String userProfilePic) {
		this.userProfilePic = userProfilePic;
	}
	public Date getUserCreationDate() {
		return userCreationDate;
	}
	public void setUserCreationDate(Date userCreationDate) {
		this.userCreationDate = userCreationDate;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
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
	
	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}
	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}
	public String getSecondaryContactNumber() {
		return secondaryContactNumber;
	}
	public void setSecondaryContactNumber(String secondaryContactNumber) {
		this.secondaryContactNumber = secondaryContactNumber;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}

	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", gender=" + gender + ", dob="
				+ dob + ", emailId=" + emailId + ", primaryContactNumber="
				+ primaryContactNumber + ", secondaryContactNumber="
				+ secondaryContactNumber 
				+ ", userCreationDate=" + userCreationDate
				+ ", userProfilePic=" + userProfilePic + ", activationLink="
				+ activationLink + ", role=" + role + ", status=" + status
				+ ", address=" + address + "]";
	}
	
}
