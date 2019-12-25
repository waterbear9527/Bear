package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pojo.Message;
import com.pojo.Users;
import com.service.MessageService;

@Controller
public class MessageController {
	@Resource
	private MessageService messageServiceImpl;
	@RequestMapping("publish")
	public String publish(Message message,HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		//获取实时时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		message.setCreatetime(sdf.format(date)); 
		message.setUid(user.getId());
		messageServiceImpl.insMessage(message);
		return "message?pageNo=1";
	}
	@RequestMapping("message")
	public String message(int pageNo,HttpSession session){
		List<Message> messages = messageServiceImpl.selMessage(pageNo);
		session.setAttribute("messages", messages);
		return "selCount";
	}
	@RequestMapping("click")
	@ResponseBody
	public Message cilck(int floor,int flag,HttpServletResponse response,HttpSession session) {
		Message message = messageServiceImpl.selById(floor);
		@SuppressWarnings("unchecked")
		List<Message> messages =(List<Message>) session.getAttribute("messages");
		if(flag==1) {
			message.setFabulous_count(message.getFabulous_count()+1);
			messages.get(floor-1).setFabulous_count(message.getFabulous_count());
			messageServiceImpl.updFabulous(floor, message.getFabulous_count());
		}else{
			message.setStepon_count(message.getStepon_count()+1);
			messages.get(floor-1).setStepon_count(message.getStepon_count());
			messageServiceImpl.updStepon(floor, message.getStepon_count());
		}
		session.setAttribute("messages", messages);
		return message;
	}
	@RequestMapping("selCount")
	public String selCount(HttpSession session) {
		int count = messageServiceImpl.selCount();
		session.setAttribute("count", count);
		return "redirect: homepage.jsp";
	}
}
