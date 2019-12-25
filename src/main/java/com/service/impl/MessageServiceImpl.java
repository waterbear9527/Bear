package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.MessageMapper;
import com.pojo.Message;
import com.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageMapper messageMapper;
	@Override
	public int insMessage(Message message) {
		return messageMapper.insMessage(message);
	}
	@Override
	public List<Message> selMessage(int pageNo) {
		pageNo = (pageNo-1)*5;
		return messageMapper.selMessage(pageNo);
	}
	@Override
	public int updFabulous(int id, int fabulous) {
		return messageMapper.updFabulous(id, fabulous);
	}
	@Override
	public int updStepon(int id, int stepon) {
		return messageMapper.updStepon(id, stepon);
	}
	@Override
	public Message selById(int id) {
		return messageMapper.selById(id);
	}
	@Override
	public int selCount() {
		return messageMapper.selCount();
	}
}
