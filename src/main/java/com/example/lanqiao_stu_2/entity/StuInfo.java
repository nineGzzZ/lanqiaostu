package com.example.lanqiao_stu_2.entity;

public class StuInfo {
    private String stu_head;
    private int stu_id;
    private String stu_name;
    private String stu_sex;
    private String stu_no;
    private int stu_age;
    private String stu_school;
    private String stu_phone;
    private int class_id;
    private String stu_profession;  //专业名称
    private String class_name;

    public String getStu_head() {
        return stu_head;
    }

    public void setStu_head(String stu_head) {
        this.stu_head = stu_head;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    @Override
    public String toString() {
        return "StuInfo{" +
                "stu_id=" + stu_id +
                ", stu_name='" + stu_name + '\'' +
                ", stu_sex='" + stu_sex + '\'' +
                ", stu_no='" + stu_no + '\'' +
                ", stu_age=" + stu_age +
                ", stu_school='" + stu_school + '\'' +
                ", stu_phone='" + stu_phone + '\'' +
                ", class_id=" + class_id +
                ", stu_profession='" + stu_profession + '\'' +
                '}';
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

    public String getStu_sex() {
        return stu_sex;
    }

    public void setStu_sex(String stu_sex) {
        this.stu_sex = stu_sex;
    }

    public String getStu_no() {
        return stu_no;
    }

    public void setStu_no(String stu_no) {
        this.stu_no = stu_no;
    }

    public int getStu_age() {
        return stu_age;
    }

    public void setStu_age(int stu_age) {
        this.stu_age = stu_age;
    }

    public String getStu_school() {
        return stu_school;
    }

    public void setStu_school(String stu_school) {
        this.stu_school = stu_school;
    }

    public String getStu_phone() {
        return stu_phone;
    }

    public void setStu_phone(String stu_phone) {
        this.stu_phone = stu_phone;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getStu_profession() {
        return stu_profession;
    }

    public void setStu_profession(String stu_profession) {
        this.stu_profession = stu_profession;
    }
}
