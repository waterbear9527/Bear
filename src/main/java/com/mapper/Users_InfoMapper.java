package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Users_Info;

public interface Users_InfoMapper {
	/**
	 * �����û�id��ȡ�û���Ϣ
	 * @param uid
	 * @return
	 */
	@Select("select * from users_info where uid = #{0}")
	Users_Info selByUid(int uid);
	/**
	 * �����û�id�޸��û���Ϣ
	 * @param users_Info
	 * @return
	 */
	@Update("update users_info set sex=#{sex},brith=#{brith},age=#{age},mail=#{mail},phone=#{phone},location=#{location},games=#{games} where uid=#{uid}")
	int updInfo(Users_Info users_Info);
	/**
	 * �����û�id�޸��û�ͷ��
	 * @param photo
	 * @return
	 */
	@Update("update users_info set photo=#{photo} where id=#{id}")
	int updPhoto(Users_Info users_Info);
	/**
	 * ���û�����Ϊ��ʱ������Ĭ������
	 * @param uid
	 * @return
	 */
	@Insert("insert into users_info values(default,'1','1990-01-01',0,'','','�㶫-����',1,'',#{0},'default.jpeg')")
	int insUsers_Info(int uid);
}
