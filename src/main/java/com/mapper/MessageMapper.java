package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Message;

public interface MessageMapper {
	/**
	 * ���û�������ӵ���Ϣ����
	 * @param message
	 * @return
	 */
	@Insert("insert into message values(default,#{context},#{createtime},#{fabulous_count},#{stepon_count},#{uid})")
	int insMessage(Message message);
	/**
	 * ��ѯ�����û���������������Ϣ ��ҳ��ѯ
	 * @return
	 */
	List<Message> selMessage(int pageNo);
	/**
	 * �����޸��û��ĵ�����
	 * @param id
	 * @param fabulous
	 * @return
	 */
	@Update("update message set fabulous_count=#{fabulous} where id=#{id}")
	int updFabulous(@Param("id")int id,@Param("fabulous")int fabulous);
	/**
	 * �����ʱ�޸��û�����
	 * @param id
	 * @param stepon
	 * @return
	 */
	@Update("update message set stepon_count=#{stepon} where id=#{id}")
	int updStepon(@Param("id")int id,@Param("stepon")int stepon);
	/**
	 * ͨ������id��ȡ�������Լ�����
	 * @return
	 */
	@Select("select * from message where id = #{0}")
	Message selById(int id);
	@Select("select count(*) from message")
	int selCount();
}
