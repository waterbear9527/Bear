package com.service;

import com.pojo.Users_Info;

public interface Users_InfoService {
	/**
	 * �����û�id��ȡ�û���Ϣ
	 * @param uid
	 * @return
	 */
	Users_Info selByUid(int uid);
	/**
	 * �����û�id�޸��û���Ϣ
	 * @param users_Info
	 * @return
	 */
	int updInfo(Users_Info users_Info);
	/**
	 * �����û�id�޸��û�ͷ��
	 * @param users_Info
	 * @return
	 */
	int updPhoto(Users_Info users_Info);
	/**
	 * �û�����Ϊ��ʱ������Ĭ�����ݡ�
	 * @param uid
	 * @return
	 */
	int insUsers_Info(int uid);
}
