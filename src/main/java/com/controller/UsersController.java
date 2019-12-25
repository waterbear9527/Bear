package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Users;
import com.service.UsersService;

@Controller
public class UsersController {
	@Resource
	private UsersService usersServiceImpl;
	@RequestMapping("login")
	public String login(Users users,HttpSession session) {    
		Users user = usersServiceImpl.selByName(users);
		if(user!=null) {	//�ж��û��Ƿ���� ��¼�ж�
			session.setAttribute("user", user);
			session.removeAttribute("error_login");
			return "selByUid";
		}else {
			session.setAttribute("error_login", "�û����������");
			return "redirect:/login.jsp";
		}
	}
	@RequestMapping("udpPassword")
	public String udpPassword(String new_password,HttpSession session) {
		usersServiceImpl.updById(((Users)session.getAttribute("user")).getId(), new_password); 
		session.setAttribute("success", "�����޸ĳɹ�");
		return "redirect:/personal/personal_password.jsp";
	}
	@RequestMapping("register")
	public String register(String reg_username,String reg_password,String phone) {
		Users users = new Users(0,reg_username,reg_password,phone);
		System.out.println(users);
		usersServiceImpl.insUsers(users);
		return "login.jsp";
	}
}
