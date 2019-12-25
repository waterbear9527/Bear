package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.UsersMapper;
import com.pojo.Users;
import com.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService {
	@Resource
	private UsersMapper usersMapper;
	@Override
	public Users selByName(Users users) {
		return usersMapper.selByName(users);
	}
	
	@Override
	public int insUsers(Users users) {
		return usersMapper.insUsers(users);
	}

	@Override
	public int updById(int id, String new_password) {
		return usersMapper.updById(id, new_password);
	}
}
