package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Message;
import com.pojo.Message_Reply;
import com.service.Message_ReplyService;

@Controller
public class Message_ReplyController {
	@Resource
	private Message_ReplyService message_ReplyServiceImpl;
	@ResponseBody
	@RequestMapping("insReplyMessage")
	public Message_Reply insReplyMessage(Message_Reply message_reply,HttpServletRequest req) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		message_reply.setCreatetime(sdf.format(date));
		message_ReplyServiceImpl.insReplyMessage(message_reply);
		return message_reply;
	}
	@ResponseBody
	@RequestMapping("selCount_Reply")
	public int selCount_Reply(int mid) {
		int selCount = message_ReplyServiceImpl.selCount(mid);
		return selCount;
	}
	@ResponseBody
	@RequestMapping("selReplyMessage")
	public List<Message_Reply> selReplyMessage(int mid,HttpSession session){
		List<Message_Reply> message_replys = message_ReplyServiceImpl.selReplyMessage(mid);
		@SuppressWarnings("unchecked")
		List<Message> messages = (List<Message>) session.getAttribute("messages");
		for(int x =0; x<messages.size(); x++) {
			if(messages.get(x).getId()==mid) {
				messages.get(x).setMessage_replys(message_replys);
			}
		}
		return message_replys;
	}
}
