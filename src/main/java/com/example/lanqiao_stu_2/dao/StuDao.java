package com.example.lanqiao_stu_2.dao;

import com.example.lanqiao_stu_2.entity.ClassInfo;
import com.example.lanqiao_stu_2.entity.StuInfo;
import com.example.lanqiao_stu_2.util.ORMUtil;

import java.util.List;

public class StuDao {
    public List<StuInfo> select(){
        ORMUtil ormUtil=new ORMUtil();
        List<StuInfo> stuDaos = ormUtil.selectList(StuInfo.class, "select * from tb_student,tb_class\n" +
                "where tb_student.class_id=tb_class.class_id");
        return stuDaos;
    }
    public int insert(String stu_head,String stu_name,String stu_no,String stu_age,String stu_sex,String stu_school,String stu_phone ,String class_id,String stu_profession){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("insert into tb_student(stu_head,stu_name,stu_no,stu_age,stu_sex,stu_school,stu_phone,class_id,stu_profession) VALUES(?,?,?,?,?,?,?,?,?);",
                stu_head,stu_name,stu_no,stu_age,stu_sex,stu_school,stu_phone,class_id,stu_profession);
        return result;
    }
    public int delete(String stu_id){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("delete from tb_student where stu_id=?",stu_id);
        return result;
    }
    public List<StuInfo> selectById(String stu_id){
        ORMUtil ormUtil=new ORMUtil();
        List<StuInfo> stuDaos = ormUtil.selectList(StuInfo.class, "select * from tb_student,tb_class\n" +
                "where tb_student.class_id=tb_class.class_id and stu_id=?",stu_id);
        return stuDaos;
    }
    public int update(String stu_name,String stu_age,String stu_sex,String stu_school,String stu_phone,String stu_profession,String stu_id){
        ORMUtil ormUtil=new ORMUtil();
        int i = ormUtil.executeDML("update tb_student set stu_name=?,stu_age=?,stu_sex=?,stu_school=?,stu_phone=?,stu_profession=? where stu_id=?",   stu_name, stu_age, stu_sex, stu_school, stu_phone, stu_profession,stu_id);
        return i;
    }
}
