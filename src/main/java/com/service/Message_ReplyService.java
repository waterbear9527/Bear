package com.service;

import java.util.List;

import com.pojo.Message_Reply;

public interface Message_ReplyService {
	/**
	 * 用户回复信息时，向回复表中插入数据
	 * @param message_reply
	 * @return
	 */
	int insReplyMessage(Message_Reply message_reply);
	/**
	 * 查询指定信息的所有回复信息
	 * @param mid
	 * @return
	 */
	List<Message_Reply> selReplyMessage(int mid);
	/**
	 * 查询消息的回复数
	 * @param mid
	 * @return
	 */
	int selCount(int mid);
}
