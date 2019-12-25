package com.service;

import com.pojo.Users_Info;

public interface Users_InfoService {
	/**
	 * 根据用户id获取用户信息
	 * @param uid
	 * @return
	 */
	Users_Info selByUid(int uid);
	/**
	 * 根据用户id修改用户信息
	 * @param users_Info
	 * @return
	 */
	int updInfo(Users_Info users_Info);
	/**
	 * 根据用户id修改用户头像
	 * @param users_Info
	 * @return
	 */
	int updPhoto(Users_Info users_Info);
	/**
	 * 用户数据为空时，加入默认数据。
	 * @param uid
	 * @return
	 */
	int insUsers_Info(int uid);
}
