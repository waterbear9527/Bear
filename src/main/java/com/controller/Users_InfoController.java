package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.pojo.Users;
import com.pojo.Users_Info;
import com.service.Users_InfoService;

@Controller
public class Users_InfoController {
	@Resource
	private Users_InfoService users_InfoServiceImpl;
	@RequestMapping("selByUid")
	public String selByUid(HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		Users_Info user_info = users_InfoServiceImpl.selByUid(user.getId());	//获取用户信息
		if(user_info==null) {
			users_InfoServiceImpl.insUsers_Info(user.getId());
			user_info = new Users_Info(0,"1","1990-01-01",0,"","","广东-广州",1,"",user.getId(),"default.jpeg");
		}
		session.setAttribute("user_info",user_info);
		return "message?pageNo=1";
	}
	@RequestMapping("updInfo")
	public String updInfo(Users_Info users_Info,int year,int month,int day,String province,String city,HttpSession session) {
		//获取用户要修改的数据 并将未小改的数据一并存到类里面 然后执行修改功能
		users_Info.setUid(((Users)session.getAttribute("user")).getId());
		users_Info.setBrith(year+"-"+month+"-"+day);
		users_Info.setLocation(province+"-"+city);
		users_Info.setLevel(((Users_Info)session.getAttribute("user_info")).getLevel());
		users_Info.setPhoto(((Users_Info)session.getAttribute("user_info")).getPhoto());
		session.setAttribute("user_info", users_Info);
		int index = users_InfoServiceImpl.updInfo(users_Info);
		if(index!=-1) {
			return "personal/personal_info.jsp";	//执行成功回到个人信息界面
		}else {
			return "personal/personal_upd_info.jsp";	//执行失败回到个人信息修改界面
		}
	}
	@RequestMapping("updPhoto")
	public String updPhoto(MultipartFile file,HttpServletRequest req) {
		String fileName = UUID.randomUUID().toString()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		//这个路径是tomcat部署哦的项目路径 而不是当前文件的路径  把文件存到这里面 下次部署的时候  pictrue里的照片会被清空
		String path1 = req.getServletContext().getRealPath("images")+"\\pictrue\\"+fileName;
		String path = "D:\\WaterBear\\Bear\\src\\main\\webapp\\images\\pictrue\\"+fileName;
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path1));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Users_Info user_Info = (Users_Info) req.getSession().getAttribute("user_info");
		user_Info.setPhoto(fileName);
		req.getSession().setAttribute("user_info", user_Info);
		users_InfoServiceImpl.updPhoto(user_Info);
		return "redirect: personal/personal_photo.jsp";
	}
}
