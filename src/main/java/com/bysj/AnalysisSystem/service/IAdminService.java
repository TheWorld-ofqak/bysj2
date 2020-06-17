package com.bysj.AnalysisSystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.bysj.AnalysisSystem.entity.Admin;
import com.bysj.AnalysisSystem.entity.Orders;
import com.bysj.AnalysisSystem.entity.User;

import java.util.List;

public interface IAdminService extends IService<Admin> {



    String selectpassword(String username);

    void fixpwdbyusername(String username, String password);

    List<User> selectall();

    User selectbyusername(String username);

    void addadmin(Admin admin);

    void deleteuserbyname(String username);

}
