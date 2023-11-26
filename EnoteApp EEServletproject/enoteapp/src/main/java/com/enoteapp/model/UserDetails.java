package com.enoteapp.model;

public class UserDetails {

	private Long id;
	private String name;
	private String nickname;
	private String email;
	private String password;
	private Boolean locked;
	
	public UserDetails() {}

	public UserDetails(Long id, String name, String nickname, String email, String password, Boolean locked) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.locked = locked;
	}

	public UserDetails(String name, String nickname, String email, String password) {
		super();
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
	}

	public UserDetails(Long id, String name, String nickname, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "UserDetails [id=" + id + ", name=" + name + ", nickname=" + nickname + ", email=" + email
				+ ", password=" + password + ", locked=" + locked + "]";
	}

	
}
