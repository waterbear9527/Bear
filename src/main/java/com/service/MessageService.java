package com.service;

import java.util.List;

import com.pojo.Message;

public interface MessageService {
	/**
	 * 用户发表评论功能
	 * @param message
	 * @return
	 */
	int insMessage(Message message);
	/**
	 * 查询消息表所有数据
	 * @return
	 */
	List<Message> selMessage(int pageNo);
	/**
	 * 点赞修改用户点赞数
	 * @param id
	 * @param fabulous
	 * @return
	 */
	int updFabulous(int id,int fabulous);
	/**
	 * 点击踩时修改用户踩数
	 * @param id
	 * @param stepon
	 * @return
	 */
	int updStepon(int id,int stepon);
	/**
	 * 根据评论id获取用户评论数据 用于防止用户未刷新界面 而点赞数还是之前的点赞数 所以每次点赞时都去数据库中执行一次查询 获取实时的点赞数
	 * @param id
	 * @return
	 */
	Message selById(int id);
	/**
	 * 获取所有的消息数量 用于做分页查询
	 * @return
	 */
	int selCount();
}
