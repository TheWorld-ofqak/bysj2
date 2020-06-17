package com.bysj.AnalysisSystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bysj.AnalysisSystem.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qak
 * @since 2019-10-18
 */

@Repository
@Mapper
public interface UserMapper extends BaseMapper<User> {
    @Select("select password from user where username=#{username} ")
    String selectpassword(String username);

    @Insert("insert  into user ( username,password,age,email,role) values (#{username},#{password},#{age},#{email},#{role}) ")
      void avasuserinfo(User user);

    @Update("update user set password=#{password} where username=#{username}")
    void fixpwdbyusername(@Param("username") String username, @Param("password")String password);



}
