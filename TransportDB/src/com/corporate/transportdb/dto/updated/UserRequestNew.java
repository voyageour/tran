package com.corporate.transportdb.dto.updated;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "user_request_new")
public class UserRequestNew {

	@Id @GeneratedValue
	@Column(name = "user_request_id")
	private Long requestId;
	
	@Column(name = "email_id")
	private String emailId;
	
	@Column(name = "action")
	private String action;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="request_date", nullable=false, length=19)
	private Date requestDate;

	@Column(name = "request_status")
	private int requestStatus;

	@Column(name = "admin_comment")
	private String adminComment;

	
	public String getAdminComment() {
		return adminComment;
	}

	public void setAdminComment(String adminComment) {
		this.adminComment = adminComment;
	}

	public Long getRequestId() {
		return requestId;
	}

	public void setRequestId(Long requestId) {
		this.requestId = requestId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public int getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(int requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "UserRequestNew [requestId=" + requestId + ", emailId="
				+ emailId + ", action=" + action + ", requestDate="
				+ requestDate + ", requestStatus=" + requestStatus
				+ ", adminComment=" + adminComment + "]";
	}

	
}
