package com.example.lanqiao_stu_2.dao;

import com.example.lanqiao_stu_2.entity.UserInfo;
import com.example.lanqiao_stu_2.util.ORMUtil;

import java.util.List;

public class UserDao {
    public List<UserInfo> login(String user_email,String user_pwd){
        ORMUtil ormUtil=new ORMUtil();
        List<UserInfo> userInfos = ormUtil.selectList(UserInfo.class, "select * from tb_user where user_email=? and user_pwd=?", user_email, user_pwd);
        return userInfos;
    }
    public List<UserInfo>cookie_select(String user_id){
        ORMUtil ormUtil=new ORMUtil();
        List<UserInfo> userInfos = ormUtil.selectList(UserInfo.class, "select * from tb_user where user_id=?", user_id);
        return userInfos;
    }
}
