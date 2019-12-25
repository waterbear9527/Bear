package com.pojo;

import java.io.Serializable;

public class Users_Info implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String sex;
	private String brith;
	private int age;
	private String mail;
	private String phone;
	private String location;
	private int level;
	private String games;
	private int uid;
	private String photo;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBrith() {
		return brith;
	}

	public void setBrith(String brith) {
		this.brith = brith;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getGames() {
		return games;
	}

	public void setGames(String games) {
		this.games = games;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Users_Info [id=" + id + ", sex=" + sex + ", brith=" + brith + ", age=" + age + ", mail=" + mail
				+ ", phone=" + phone + ", location=" + location + ", level=" + level + ", games=" + games + ", uid="
				+ uid + ", photo=" + photo + "]";
	}

	public Users_Info() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users_Info(int id, String sex, String brith, int age, String mail, String phone, String location, int level,
			String games, int uid, String photo) {
		super();
		this.id = id;
		this.sex = sex;
		this.brith = brith;
		this.age = age;
		this.mail = mail;
		this.phone = phone;
		this.location = location;
		this.level = level;
		this.games = games;
		this.uid = uid;
		this.photo = photo;
	}
	
}
