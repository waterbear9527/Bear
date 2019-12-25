package com.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.Message_ReplyMapper;
import com.pojo.Message_Reply;
import com.service.Message_ReplyService;

@Service
public class Message_ReplyServiceImpl implements Message_ReplyService {
	@Resource
	private Message_ReplyMapper message_ReplyMapper;
	@Override
	public int insReplyMessage(Message_Reply message_reply) {
		return message_ReplyMapper.insReplyMessage(message_reply);
	}
	@Override
	public List<Message_Reply> selReplyMessage(int mid) {
		return message_ReplyMapper.selByMid(mid);
	}
	@Override
	public int selCount(int mid) {
		return message_ReplyMapper.selCount(mid);
	}

}
