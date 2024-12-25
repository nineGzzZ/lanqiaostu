package com.example.lanqiao_stu_2.dao;

import com.example.lanqiao_stu_2.entity.ClassInfo;
import com.example.lanqiao_stu_2.entity.ScoreInfo;
import com.example.lanqiao_stu_2.entity.StuInfo;
import com.example.lanqiao_stu_2.util.ORMUtil;

import java.util.List;

public class ScoreDao {
    public List<ScoreInfo> select(){
        ORMUtil ormUtil=new ORMUtil();
        List<ScoreInfo> scoreInfos = ormUtil.selectList(ScoreInfo.class, "SELECT * FROM tb_score,tb_student\n" +
                "WHERE tb_score.stu_id=tb_student.stu_id;");
        return scoreInfos;
    }
    public int insert(String score_type,String score_value,String stu_id,String score_contents,String time,String class_id){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("insert into tb_score(score_type,score_value,stu_id,score_contents,time,class_id) VALUES(?,?,?,?,?,?);",
                score_type,score_value,stu_id,score_contents,time,class_id);
        return result;
    }
    public int delete(String score_id){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("delete from tb_score where score_id=?",score_id);
        return result;
    }
    public List<ScoreInfo> selectById(String score_id){
        ORMUtil ormUtil=new ORMUtil();
        List<ScoreInfo> scoreInfos = ormUtil.selectList(ScoreInfo.class, "SELECT * FROM tb_score,tb_student\n" +
                "WHERE tb_score.stu_id=tb_student.stu_id and score_id=?",score_id);
        return scoreInfos;
    }
    public int update(String score_type,String score_value,String score_contents,String time,String score_id){
        ORMUtil ormUtil=new ORMUtil();
        int result=ormUtil.executeDML("update tb_score set score_type=?,score_value=?,score_contents=?,time=? where score_id=?",
                score_type,score_value,score_contents,time,score_id);
        return result;
    }
}
