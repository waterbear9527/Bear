package com.service;

import java.util.List;

import com.pojo.Message;

public interface MessageService {
	/**
	 * �û��������۹���
	 * @param message
	 * @return
	 */
	int insMessage(Message message);
	/**
	 * ��ѯ��Ϣ����������
	 * @return
	 */
	List<Message> selMessage(int pageNo);
	/**
	 * �����޸��û�������
	 * @param id
	 * @param fabulous
	 * @return
	 */
	int updFabulous(int id,int fabulous);
	/**
	 * �����ʱ�޸��û�����
	 * @param id
	 * @param stepon
	 * @return
	 */
	int updStepon(int id,int stepon);
	/**
	 * ��������id��ȡ�û��������� ���ڷ�ֹ�û�δˢ�½��� ������������֮ǰ�ĵ����� ����ÿ�ε���ʱ��ȥ���ݿ���ִ��һ�β�ѯ ��ȡʵʱ�ĵ�����
	 * @param id
	 * @return
	 */
	Message selById(int id);
	/**
	 * ��ȡ���е���Ϣ���� ��������ҳ��ѯ
	 * @return
	 */
	int selCount();
}
