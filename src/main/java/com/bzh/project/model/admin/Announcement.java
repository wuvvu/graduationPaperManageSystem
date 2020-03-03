package com.bzh.project.model.admin;

public class Announcement {

    private String id;
    private String title;
    private String content;
    private String remark;
    private String createAdminId;
    private Admin createAdmin;
    private String lastModifyAdminId;
    private Admin lastModifyAdmin;
    private String createTime;
    private String lastModifyTime; //TODO datetime

    public Announcement() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Admin getCreateAdmin() {
        return createAdmin;
    }

    public void setCreateAdmin(Admin createAdmin) {
        this.createAdmin = createAdmin;
    }

    public Admin getLastModifyAdmin() {
        return lastModifyAdmin;
    }

    public void setLastModifyAdmin(Admin lastModifyAdmin) {
        this.lastModifyAdmin = lastModifyAdmin;
    }

    public String getCreateAdminId() {
        return createAdminId;
    }

    public void setCreateAdminId(String createAdminId) {
        this.createAdminId = createAdminId;
    }

    public String getLastModifyAdminId() {
        return lastModifyAdminId;
    }

    public void setLastModifyAdminId(String lastModifyAdminId) {
        this.lastModifyAdminId = lastModifyAdminId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(String lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    public Announcement(String id, String title, String content, String remark, String createAdminId, Admin createAdmin, String lastModifyAdminId, Admin lastModifyAdmin, String createTime, String lastModifyTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.remark = remark;
        this.createAdminId = createAdminId;
        this.createAdmin = createAdmin;
        this.lastModifyAdminId = lastModifyAdminId;
        this.lastModifyAdmin = lastModifyAdmin;
        this.createTime = createTime;
        this.lastModifyTime = lastModifyTime;
    }
}
