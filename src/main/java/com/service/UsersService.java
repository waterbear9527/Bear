package com.service;

import com.pojo.Users;

public interface UsersService {
	/**
	 * ��¼У�鹦��
	 * @param users
	 * @return
	 */
	Users selByName(Users users);
	/**
	 * ע�Ṧ��
	 * @param users
	 * @return
	 */
	int insUsers(Users users);
	/**
	 * �޸����빦��
	 * @param id
	 * @param new_password
	 * @return
	 */
	int updById(int id,String new_password);
}
