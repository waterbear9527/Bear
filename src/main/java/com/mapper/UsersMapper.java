package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Users;

public interface UsersMapper {
	/**
	 * �����û����������ѯ�û��Ƿ����
	 * @param users
	 * @return
	 */
	@Select("select * from users where username=#{username} and password=#{password}")
	Users selByName(Users users);
	/**
	 * �û�ע����������ݽ���
	 * @param users
	 * @return
	 */
	@Insert("insert into users values(default,#{username},#{password},#{phone})")
	int insUsers(Users users);
	/**
	 * �޸�����
	 * @param id
	 * @param new_password
	 * @return
	 */
	@Update("update users set password=#{new_password} where id=#{id}")
	int updById(@Param("id")int id,@Param("new_password")String new_password);
	/**
	 * ������Ϣ�������ѯ�û� ��Ϊ��������Ҫ�û��� ������Ҫ��Ӧ��id����ѯ�û�
	 * @param id
	 * @return
	 */
	@Select("select * from users where id = #{0}")
	Users selById(int id);
}
