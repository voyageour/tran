package com.corporate.transportdb.dto.updated;


import java.io.Serializable;

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
@Table(name = "feedback")
public class FeedbackUpdated implements Serializable{

	private static final long serialVersionUID = 714570250663068898L;

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "feedback_id")
	private long feedbackId;
	
	@Column(name = "feedback")
	private String feedbackContents=null;
	
	@Column(name = "feedback_type")
	private int feedbackType;

	@OneToOne(targetEntity=UserUpdated.class,cascade=CascadeType.ALL)
    @JoinColumn(name="user_id",referencedColumnName="user_id")
	private UserUpdated user;

	@Column(name = "active")
	private boolean active;
		
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public UserUpdated getUser() {
		return user;
	}

	public void setUser(UserUpdated user) {
		this.user = user;
	}

	public long getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(long feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getFeedbackContents() {
		return feedbackContents;
	}
	public void setFeedbackContents(String feedbackContents) {
		this.feedbackContents = feedbackContents;
	}
	public int getFeedbackType() {
		return feedbackType;
	}
	public void setFeedbackType(int feedbackType) {
		this.feedbackType = feedbackType;
	}

	
}
