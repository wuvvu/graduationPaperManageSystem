package com.bzh.project.model.student;

public class Student {

    private String id; //学号
    private String password; //密码
    private String realName; //姓名
    private String subject; //专业
    private String graduationYear; //毕业年份
    private String teacherId; //指导老师工号
    private String paperId; //毕设题目Id

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(String graduationYear) {
        this.graduationYear = graduationYear;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = String.valueOf(teacherId);
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public Student() {

    }

    public Student(String id, String password, String realName, String subject, String graduationYear) {
        this.id = id;
        this.password = password;
        this.realName = realName;
        this.subject = subject;
        this.graduationYear = graduationYear;
    }

    public Student(String id, String password, String realName, String subject, String graduationYear, String teacherId, String paperId) {
        this.id = id;
        this.password = password;
        this.realName = realName;
        this.subject = subject;
        this.graduationYear = graduationYear;
        this.teacherId = teacherId;
        this.paperId = paperId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", subject='" + subject + '\'' +
                ", graduationYear='" + graduationYear + '\'' +
                ", teacherId='" + teacherId + '\'' +
                ", paperId='" + paperId + '\'' +
                '}';
    }
}
