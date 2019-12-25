package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Users_Info;

public interface Users_InfoMapper {
	/**
	 * 根据用户id获取用户信息
	 * @param uid
	 * @return
	 */
	@Select("select * from users_info where uid = #{0}")
	Users_Info selByUid(int uid);
	/**
	 * 根据用户id修改用户信息
	 * @param users_Info
	 * @return
	 */
	@Update("update users_info set sex=#{sex},brith=#{brith},age=#{age},mail=#{mail},phone=#{phone},location=#{location},games=#{games} where uid=#{uid}")
	int updInfo(Users_Info users_Info);
	/**
	 * 根据用户id修改用户头像
	 * @param photo
	 * @return
	 */
	@Update("update users_info set photo=#{photo} where id=#{id}")
	int updPhoto(Users_Info users_Info);
	/**
	 * 当用户数据为空时，加入默认数据
	 * @param uid
	 * @return
	 */
	@Insert("insert into users_info values(default,'1','1990-01-01',0,'','','广东-广州',1,'',#{0},'default.jpeg')")
	int insUsers_Info(int uid);
}
