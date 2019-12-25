package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.Users_InfoMapper;
import com.pojo.Users_Info;
import com.service.Users_InfoService;

@Service
public class Users_InfoServiceImpl implements Users_InfoService {
	@Resource
	private Users_InfoMapper users_InfoMapper;
	@Override
	public Users_Info selByUid(int uid) {
		return users_InfoMapper.selByUid(uid);
	}
	@Override
	public int updInfo(Users_Info users_Info) {
		return users_InfoMapper.updInfo(users_Info);
	}
	@Override
	public int updPhoto(Users_Info users_Info) {
		return users_InfoMapper.updPhoto(users_Info);
	}
	@Override
	public int insUsers_Info(int uid) {
		return users_InfoMapper.insUsers_Info(uid);
	}

}
