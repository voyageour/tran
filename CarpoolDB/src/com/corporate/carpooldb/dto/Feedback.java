package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Feedback implements Serializable{

	private static final long serialVersionUID = -482658551087612103L;

	private int feedback_id;
	
	private String feedback=null;
	private int feedback_type;
	private User user=null;
	
	public int getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int getFeedback_type() {
		return feedback_type;
	}
	public void setFeedback_type(int feedback_type) {
		this.feedback_type = feedback_type;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Feedback [feedback_id=" + feedback_id + ", feedback="
				+ feedback + ", feedback_type=" + feedback_type + ", user="
				+ user + "]";
	}
	
}

