package com.enoteapp.model;

import java.time.LocalDate;

public class NoteDetails {

	private Long id;
	private String title;
	private String content;
	private Long userId;
	private LocalDate date;
	
	
	public NoteDetails() {}


	public NoteDetails(Long id, String title, String content, Long userId, LocalDate date) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.date = date;
	}


	public NoteDetails(String title, String content, Long userId, LocalDate date) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.date = date;
	}

	public NoteDetails(Long id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Long getUserId() {
		return userId;
	}


	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public LocalDate getDate() {
		return date;
	}


	public void setDate(LocalDate date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "NoteDetails [id=" + id + ", title=" + title + ", content=" + content + ", userId=" + userId + ", date="
				+ date + "]";
	}
	
	
}
