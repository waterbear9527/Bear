package com.service;

import java.util.List;

import com.pojo.Message_Reply;

public interface Message_ReplyService {
	/**
	 * �û��ظ���Ϣʱ����ظ����в�������
	 * @param message_reply
	 * @return
	 */
	int insReplyMessage(Message_Reply message_reply);
	/**
	 * ��ѯָ����Ϣ�����лظ���Ϣ
	 * @param mid
	 * @return
	 */
	List<Message_Reply> selReplyMessage(int mid);
	/**
	 * ��ѯ��Ϣ�Ļظ���
	 * @param mid
	 * @return
	 */
	int selCount(int mid);
}
