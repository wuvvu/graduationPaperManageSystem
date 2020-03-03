package com.bzh.project.model.teacher;

public class Teacher {

    private String id; //老师工号
    private String realName; //姓名
    private String password; //密码
    private String jobTitle; //职称
    private String officePhone; //办公电话
    private String personalPhone; //个人电话
    private int studentCounts; //学生数

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getPersonalPhone() {
        return personalPhone;
    }

    public void setPersonalPhone(String personalPhone) {
        this.personalPhone = personalPhone;
    }

    public int getStudentCounts() {
        return studentCounts;
    }

    public void setStudentCounts(int studentCounts) {
        this.studentCounts = studentCounts;
    }

    public Teacher() {

    }

    public Teacher(String id, String realName, String password, String jobTitle, String officePhone, String personalPhone) {
        this.id = id;
        this.realName = realName;
        this.password = password;
        this.jobTitle = jobTitle;
        this.officePhone = officePhone;
        this.personalPhone = personalPhone;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id='" + id + '\'' +
                ", realName='" + realName + '\'' +
                ", password='" + password + '\'' +
                ", jobTitle='" + jobTitle + '\'' +
                ", officePhone='" + officePhone + '\'' +
                ", personalPhone='" + personalPhone + '\'' +
                ", studentCounts='" + studentCounts + '\'' +
                '}';
    }
}
