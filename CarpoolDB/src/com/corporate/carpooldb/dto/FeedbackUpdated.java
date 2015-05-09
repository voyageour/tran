package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class FeedbackUpdated implements Serializable{

	private static final long serialVersionUID = 714570250663068898L;

	private long feedbackId;
	private String feedbackContents=null;
	private int feedbackType;
	private User user=null;
	private boolean active;
	
	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
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
