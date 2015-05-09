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
@Table(name = "news")
public class News {

	@Id @GeneratedValue
	@Column(name = "news_id")
	private Long newsId;
	
	@Column(name = "news_subject")
	private String newsSubject;
	
	@Column(name = "news_content")
	private String newsContent;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="news_active_from", nullable=false, length=19)
	private Date newsActiveFromDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="news_active_till", nullable=false, length=19)
	private Date newsActiveTillDate;

	public Long getNewsId() {
		return newsId;
	}

	public void setNewsId(Long newsId) {
		this.newsId = newsId;
	}

	public String getNewsSubject() {
		return newsSubject;
	}

	public void setNewsSubject(String newsSubject) {
		this.newsSubject = newsSubject;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public Date getNewsActiveFromDate() {
		return newsActiveFromDate;
	}

	public void setNewsActiveFromDate(Date newsActiveFromDate) {
		this.newsActiveFromDate = newsActiveFromDate;
	}

	public Date getNewsActiveTillDate() {
		return newsActiveTillDate;
	}

	public void setNewsActiveTillDate(Date newsActiveTillDate) {
		this.newsActiveTillDate = newsActiveTillDate;
	}

}
