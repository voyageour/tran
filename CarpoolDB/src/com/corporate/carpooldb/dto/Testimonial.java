package com.corporate.carpooldb.dto;

import java.io.Serializable;

public class Testimonial implements Serializable{

	private static final long serialVersionUID = -2245290337800332896L;

	private int testimonialId;
	private String testimonial;
	
	public int getTestimonialId() {
		return testimonialId;
	}
	public void setTestimonialId(int testimonialId) {
		this.testimonialId = testimonialId;
	}
	public String getTestimonial() {
		return testimonial;
	}
	public void setTestimonial(String testimonial) {
		this.testimonial = testimonial;
	}
	@Override
	public String toString() {
		return "Testimonial [testimonialId=" + testimonialId + ", testimonial="
				+ testimonial + "]";
	}	
	
}
