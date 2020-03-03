package com.bzh.project.model.paper;

public class PaperSearchResult {

    private String studentId;
    private String studentRealName;
    private String studentSubject;
    private String paperTitle;
    private String paperKeyword;
    private String studentGraduateYear;
    private String teacherName;
    private String teacherJobTitle;
    private String paperFinalEvaluationResult;

    public String getStudentRealName() {
        return studentRealName;
    }

    public void setStudentRealName(String studentRealName) {
        this.studentRealName = studentRealName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentSubject() {
        return studentSubject;
    }

    public void setStudentSubject(String studentSubject) {
        this.studentSubject = studentSubject;
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

    public String getStudentGraduateYear() {
        return studentGraduateYear;
    }

    public void setStudentGraduateYear(String studentGraduateYear) {
        this.studentGraduateYear = studentGraduateYear;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherJobTitle() {
        return teacherJobTitle;
    }

    public void setTeacherJobTitle(String teacherJobTitle) {
        this.teacherJobTitle = teacherJobTitle;
    }

    public String getPaperFinalEvaluationResult() {
        return paperFinalEvaluationResult;
    }

    public void setPaperFinalEvaluationResult(String paperFinalEvaluationResult) {
        this.paperFinalEvaluationResult = paperFinalEvaluationResult;
    }
}
