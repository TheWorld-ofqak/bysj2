package com.bysj.AnalysisSystem.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.bysj.AnalysisSystem.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qak
 * @since 2019-10-18
 */

public interface IUserService extends IService<User> {
    String selectpassword(String username);


    void saveuserinfo(User user);

    void fixpwdbyusername(String username, String password);


}
