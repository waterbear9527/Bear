package com.pojo;

import java.io.Serializable;
import java.util.List;

public class Message implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String context;
	private String createtime;
	private int fabulous_count;
	private int stepon_count;
	private int uid;
	private Users users;
	private Users_Info users_info;
	private List<Message_Reply> message_replys;
	@Override
	public String toString() {
		return "Message [id=" + id + ", context=" + context + ", createtime=" + createtime + ", fabulous_count="
				+ fabulous_count + ", stepon_count=" + stepon_count + ", uid=" + uid + ", users=" + users
				+ ", users_info=" + users_info + ", message_replys=" + message_replys + "]";
	}
	public Message(int id, String context, String createtime, int fabulous_count, int stepon_count, int uid,
			Users users, Users_Info users_info, List<Message_Reply> message_replys) {
		super();
		this.id = id;
		this.context = context;
		this.createtime = createtime;
		this.fabulous_count = fabulous_count;
		this.stepon_count = stepon_count;
		this.uid = uid;
		this.users = users;
		this.users_info = users_info;
		this.message_replys = message_replys;
	}
	public List<Message_Reply> getMessage_replys() {
		return message_replys;
	}
	public void setMessage_replys(List<Message_Reply> message_replys) {
		this.message_replys = message_replys;
	}
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
	public int getFabulous_count() {
		return fabulous_count;
	}
	public void setFabulous_count(int fabulous_count) {
		this.fabulous_count = fabulous_count;
	}
	public int getStepon_count() {
		return stepon_count;
	}
	public void setStepon_count(int stepon_count) {
		this.stepon_count = stepon_count;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Users_Info getUsers_info() {
		return users_info;
	}
	public void setUsers_info(Users_Info users_info) {
		this.users_info = users_info;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
}
