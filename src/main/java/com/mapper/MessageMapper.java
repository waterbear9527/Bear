package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Message;

public interface MessageMapper {
	/**
	 * 将用户评论添加到消息表中
	 * @param message
	 * @return
	 */
	@Insert("insert into message values(default,#{context},#{createtime},#{fabulous_count},#{stepon_count},#{uid})")
	int insMessage(Message message);
	/**
	 * 查询所有用户发布过的所有消息 分页查询
	 * @return
	 */
	List<Message> selMessage(int pageNo);
	/**
	 * 点赞修改用户的点赞数
	 * @param id
	 * @param fabulous
	 * @return
	 */
	@Update("update message set fabulous_count=#{fabulous} where id=#{id}")
	int updFabulous(@Param("id")int id,@Param("fabulous")int fabulous);
	/**
	 * 点击踩时修改用户踩数
	 * @param id
	 * @param stepon
	 * @return
	 */
	@Update("update message set stepon_count=#{stepon} where id=#{id}")
	int updStepon(@Param("id")int id,@Param("stepon")int stepon);
	/**
	 * 通过评论id获取点赞数以及踩数
	 * @return
	 */
	@Select("select * from message where id = #{0}")
	Message selById(int id);
	@Select("select count(*) from message")
	int selCount();
}
