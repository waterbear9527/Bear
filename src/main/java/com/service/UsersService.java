package com.service;

import com.pojo.Users;

public interface UsersService {
	/**
	 * 登录校验功能
	 * @param users
	 * @return
	 */
	Users selByName(Users users);
	/**
	 * 注册功能
	 * @param users
	 * @return
	 */
	int insUsers(Users users);
	/**
	 * 修改密码功能
	 * @param id
	 * @param new_password
	 * @return
	 */
	int updById(int id,String new_password);
}
