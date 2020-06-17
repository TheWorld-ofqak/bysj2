package com.bysj.AnalysisSystem.service.impl;


import com.bysj.AnalysisSystem.entity.User;
import com.bysj.AnalysisSystem.mapper.UserMapper;
import com.bysj.AnalysisSystem.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author qak
 * @since 2019-10-18
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {




    @Autowired
    private UserMapper userMapper;


   //加入redis
    @Override
    public String selectpassword(String username) {
//        String selectpassword =null;
//      if(redisTemplate.opsForValue().get(username)==null)
//      {
//          selectpassword=userMapper.selectpassword(username);
//
//      }
//
//      else{
//
//          User user= (User) redisTemplate.opsForValue().get(username);
//          selectpassword=user.getPassword();
//      }
//
//        return  selectpassword;




        return  userMapper.selectpassword(username);
    }

    @Override
    public void saveuserinfo(User user) {
        userMapper.avasuserinfo(user);

    }

    @Override
    public void fixpwdbyusername(String username, String password) {
        userMapper.fixpwdbyusername(username,password);
    }



}
