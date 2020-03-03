package com.bzh.project.model.admin;

public class AnnouncementSearchResult {

    private String id;
    private String title;
    private String content;
    private String remark;
    private String createAdminId;
    private String lastModifyAdminId;
    private String createTime;
    private String lastModifyTime; //TODO datetime

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

}
