package com.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pojo.Message_Reply;

public interface Message_ReplyMapper {
	@Insert("insert into message_reply values(default,#{context},#{createtime},#{mid},#{uid})")
	int insReplyMessage(Message_Reply message_reply);
	@Select("select count(*) from message_reply where mid=#{0}")
	int selCount(int mid);
	List<Message_Reply> selByMid(int mid);
}
