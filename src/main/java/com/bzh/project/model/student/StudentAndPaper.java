package com.bzh.project.model.student;

public class StudentAndPaper {
    private String studentId; //学生学号
    private String studentRealName; //学生姓名
    private String paperTitle; //论文题目
    private String paperKeyword; //论文关键字

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentRealName() {
        return studentRealName;
    }

    public void setStudentRealName(String studentRealName) {
        this.studentRealName = studentRealName;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

    public String getPaperKeyword() {
        return paperKeyword;
    }

    public void setPaperKeyword(String paperKeyword) {
        this.paperKeyword = paperKeyword;
    }

}
