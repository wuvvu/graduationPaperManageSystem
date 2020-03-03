package com.bzh.project.model.paper;

public class Paper {

    private String id; //题目id
    private String teacherId; //出题老师id
    private String title; //题目名
    private String subtitle; //小标题
    private String keyword; //关键字
    private String overview; //题目概述
    private String demand; //要求
    private String module; //功能模块
    private String remark; //备注
    private String studentId; //选题学生id
    private String grade; //评审等级
    private String status; //题目审核状态
    private String firstFileName; //初审文件路径
    private String firstEvaluationResult; //初审结果
    private String finalFileName; //终审文件路径
    private String finalEvaluationResult; //终审结果

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFirstFileName() {
        return firstFileName;
    }

    public void setFirstFileName(String firstFileName) {
        this.firstFileName = firstFileName;
    }

    public String getFinalFileName() {
        return finalFileName;
    }

    public void setFinalFileName(String finalFileName) {
        this.finalFileName = finalFileName;
    }

    public String getFirstEvaluationResult() {
        return firstEvaluationResult;
    }

    public void setFirstEvaluationResult(String firstEvaluationResult) {
        this.firstEvaluationResult = firstEvaluationResult;
    }

    public String getFinalEvaluationResult() {
        return finalEvaluationResult;
    }

    public void setFinalEvaluationResult(String finalEvaluationResult) {
        this.finalEvaluationResult = finalEvaluationResult;
    }
}
