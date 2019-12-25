package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Users;

public interface UsersMapper {
	/**
	 * 根据用户名和密码查询用户是否存在
	 * @param users
	 * @return
	 */
	@Select("select * from users where username=#{username} and password=#{password}")
	Users selByName(Users users);
	/**
	 * 用户注册添加新数据进表
	 * @param users
	 * @return
	 */
	@Insert("insert into users values(default,#{username},#{password},#{phone})")
	int insUsers(Users users);
	/**
	 * 修改密码
	 * @param id
	 * @param new_password
	 * @return
	 */
	@Update("update users set password=#{new_password} where id=#{id}")
	int updById(@Param("id")int id,@Param("new_password")String new_password);
	/**
	 * 用于消息类里面查询用户 因为评论里需要用户名 所以需要对应的id来查询用户
	 * @param id
	 * @return
	 */
	@Select("select * from users where id = #{0}")
	Users selById(int id);
}
