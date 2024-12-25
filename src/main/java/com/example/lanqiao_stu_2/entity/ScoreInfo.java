package com.example.lanqiao_stu_2.entity;

public class ScoreInfo {
    private int score_id;
    private int score_type;//积分类型：1代表纪律分、2代表技术分、3代表职业分
    private double score_value;//积分值，+2加两分，-2减两分
    private int stu_id;
    private String stu_name;
    private String score_contents;//积分描述
    private String time;
    private int class_id;
    private String class_name;

    public int getScore_type() {
        return score_type;
    }

    public void setScore_type(int score_type) {
        this.score_type = score_type;
    }

    public double getScore_value() {
        return score_value;
    }

    public void setScore_value(double score_value) {
        this.score_value = score_value;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public int getScore_id() {
        return score_id;
    }

    public void setScore_id(int score_id) {
        this.score_id = score_id;
    }

    public String getScore_contents() {
        return score_contents;
    }

    public void setScore_contents(String score_contents) {
        this.score_contents = score_contents;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }
}
