package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class UserTestimonial implements Serializable{

	private static final long serialVersionUID = -7725756515974119480L;

	private int userTestimonialId;
	private User user;
	private Feedback feedback;
	//private Testimonial testimonial;
	
	
	public int getUserTestimonialId() {
		return userTestimonialId;
	}
	public void setUserTestimonialId(int userTestimonialId) {
		this.userTestimonialId = userTestimonialId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	/*
	public Testimonial getTestimonial() {
		return testimonial;
	}
	public void setTestimonial(Testimonial testimonial) {
		this.testimonial = testimonial;
	}
	*/
	
	@Override
	public String toString() {
		return "UserTestimonial [userTestimonialId=" + userTestimonialId
				+ ", user=" + user + "]";
	}
	
	
}
