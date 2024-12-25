package com.example.lanqiao_stu_2.dao;

import com.example.lanqiao_stu_2.entity.ClassInfo;
import com.example.lanqiao_stu_2.util.ORMUtil;

import java.util.List;

public class ClassDao {
    public List<ClassInfo> select(){
        ORMUtil ormUtil=new ORMUtil();
        List<ClassInfo> classInfos = ormUtil.selectList(ClassInfo.class, "select * from tb_class");
        return classInfos;
    }
    public int insert(String class_name){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("insert into tb_class(class_name) values(?)",class_name);
        return result;
    }
    public int delete(String class_id){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("delete from tb_class where class_id=?",class_id);
        return result;
    }
    public int update(String class_id,String class_name){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("update tb_class set class_name=? where class_id=?",class_name,class_id);
        return result;
    }
}
