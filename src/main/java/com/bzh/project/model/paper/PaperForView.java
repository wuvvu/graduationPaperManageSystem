package com.bzh.project.model.paper;

public class PaperForView {

    private String paperId; //论文id
    private String paperTitle; //论文题目
    private String studentId; //学生学号
    private String studentRealName; //学生姓名
    private String studentGraduationYear;  //学生毕业年份
    private String teacherRealName;  //指导老师姓名
    private String paperFirstFileName; //初审上传文件名
    private String paperFirstEvaluationResult; //初审结果
    private String paperFinalFileName; //终审上传文件名
    private String paperFinalEvaluationResult; //论文等级(终审结果)

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

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

    public String getStudentGraduationYear() {
        return studentGraduationYear;
    }

    public void setStudentGraduationYear(String studentGraduationYear) {
        this.studentGraduationYear = studentGraduationYear;
    }

    public String getTeacherRealName() {
        return teacherRealName;
    }

    public void setTeacherRealName(String teacherRealName) {
        this.teacherRealName = teacherRealName;
    }

    public String getPaperFirstFileName() {
        return paperFirstFileName;
    }

    public void setPaperFirstFileName(String paperFirstFileName) {
        this.paperFirstFileName = paperFirstFileName;
    }

    public String getPaperFirstEvaluationResult() {
        return paperFirstEvaluationResult;
    }

    public void setPaperFirstEvaluationResult(String paperFirstEvaluationResult) {
        this.paperFirstEvaluationResult = paperFirstEvaluationResult;
    }

    public String getPaperFinalFileName() {
        return paperFinalFileName;
    }

    public void setPaperFinalFileName(String paperFinalFileName) {
        this.paperFinalFileName = paperFinalFileName;
    }

    public String getPaperFinalEvaluationResult() {
        return paperFinalEvaluationResult;
    }

    public void setPaperFinalEvaluationResult(String paperFinalEvaluationResult) {
        this.paperFinalEvaluationResult = paperFinalEvaluationResult;
    }
}
