package com.pojo;

import java.io.Serializable;

public class Message_Reply implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String context;
	private String createtime;
	private int mid;
	private int uid;
	private Users_Info users_info;
	private Users users;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Users_Info getUsers_info() {
		return users_info;
	}
	public void setUsers_info(Users_Info users_info) {
		this.users_info = users_info;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Message_Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Message_Reply [id=" + id + ", context=" + context + ", createtime=" + createtime + ", mid=" + mid
				+ ", uid=" + uid + ", users_info=" + users_info + ", users=" + users + "]";
	}
	public Message_Reply(int id, String context, String createtime, int mid, int uid, Users_Info users_info,
			Users users) {
		super();
		this.id = id;
		this.context = context;
		this.createtime = createtime;
		this.mid = mid;
		this.uid = uid;
		this.users_info = users_info;
		this.users = users;
	}
}
