package com.bysj.AnalysisSystem.service.impl;

import com.bysj.AnalysisSystem.entity.Admin;
import com.bysj.AnalysisSystem.entity.User;
import com.bysj.AnalysisSystem.mapper.AdminMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bysj.AnalysisSystem.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author qak
 * @since 2019-10-17
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public String selectpassword(String username) {

        String password = adminMapper.selectpassword(username);

        return password;
    }


    @Override
    public void fixpwdbyusername(String username, String password) {
        adminMapper.fixpwdbyusername(username,password);
    }


    @Override
    public List<User> selectall() {
        return adminMapper.selectall();
    }



    @Override
    public User selectbyusername(String username) {
        return adminMapper.selectbyusername(username);
    }

    @Override
    public void addadmin(Admin admin) {
        adminMapper.addadmin(admin);
    }

    @Override
    public void deleteuserbyname(String username) {
        adminMapper.deleteuserbyname(username);
    }

}
