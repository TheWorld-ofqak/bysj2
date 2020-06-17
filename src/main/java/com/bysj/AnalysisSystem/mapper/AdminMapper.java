package com.bysj.AnalysisSystem.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bysj.AnalysisSystem.entity.Admin;
import com.bysj.AnalysisSystem.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qak
 * @since 2019-10-17
 */
@Mapper
@Repository
public interface AdminMapper extends BaseMapper<Admin> {

    @Select("select password from admin where username=#{username} ")
    String selectpassword(String username);

    @Update("update admin set password=#{password} where username=#{username}")
    void fixpwdbyusername(@Param("username") String username,@Param("password") String password);



    @Select("select * from user")
    List<User> selectall();

    @Select("select * from user where username= #{username}")
    User selectbyusername(String username);

    @Insert("insert  into admin (username,password,role,age,phonenumber) values (#{username},#{password},#{role},#{age},#{phonenumber}) ")
    void addadmin(Admin admin);

    @Delete("delete  from user where username=#{username}")
    void deleteuserbyname(@Param("username") String username);
}
