package com.bzh.project.service;

import com.bzh.project.mapper.TeacherMapper;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.PaperSearchResult;
import com.bzh.project.model.student.StudentAndPaper;
import com.bzh.project.model.teacher.Teacher;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeacherService {

    private final TeacherMapper teacherMapper;

    private final AdminService adminService;

    @Autowired
    public TeacherService(TeacherMapper teacherMapper, AdminService adminService) {
        this.teacherMapper = teacherMapper;
        this.adminService = adminService;
    }

    public int changePassword(@NotNull Teacher teacher, String oldPassword, String newPassword) {
        if(teacher.getPassword().equals(oldPassword)) {
            teacher.setPassword(newPassword);
            adminService.setTeacherPassword(teacher);
            return 0;
        }
        return -1;
    }

    public Paper getPaperById(String id) {
        return adminService.getPaperById(id);
    }

    public int modifyPaper(Paper paper) {
        return adminService.modifyPaper(paper);
    }

    public Teacher getTeacherById(String id) {
        return teacherMapper.getTeacherById(id);
    }

    public List<StudentAndPaper> listStudentByTeacherId(String id) {
        return teacherMapper.listStudentByTeacherId(id);
    }

    public List<Paper> listPaperByTeacherId(String id) {
        return teacherMapper.listPaperByTeacherId(id);
    }

    public int addPaper(Paper paper) {
        return teacherMapper.addPaper(paper);
    }

    public PaperForView viewPaperByStudentId(String id) {
        return teacherMapper.viewPaperByStudentId(id);
    }

    public List<Announcement> listAnnouncement(String word) {
        return adminService.listAnnouncement(word);
    }

    public Announcement getAnnouncementById(String id) {
        return adminService.getAnnouncementById(id);
    }

    public List<PaperSearchResult> listUnevaluatedPaper(Teacher teacher) {
        return teacherMapper.listUnevaluatedPaper(teacher.getId());
    }

    public int updateFirstEvaluation(String evaluation, String paperId) {
        return teacherMapper.updateFirstEvaluation(evaluation, paperId);
    }

    public int updateFinalEvaluation(String evaluation, String paperId) {
        return teacherMapper.updateFinalEvaluation(evaluation, paperId);
    }

    public String getFirstFileNameByPaperId(String id) {
        return teacherMapper.getFirstFileNameByPaperId(id);
    }

    public String getFinalFileNameByPaperId(String id) {
        return teacherMapper.getFinalFileNameByPaperId(id);
    }

    public Map<String, Object> getEvaluationStatusByPaper(PaperForView paperForView) {
        Map<String, Object> result = new HashMap<>();
        String fileName = null;
        boolean firstIsEvaluated = false;
        boolean finalFileIsUpload = false;
        boolean finalIsEvaluated = false;
        if(paperForView.getPaperFirstFileName() != null && !paperForView.getPaperFirstFileName().equals("")) { //已上传初审
            fileName = paperForView.getPaperFirstFileName();
            if(paperForView.getPaperFirstEvaluationResult() != null && !paperForView.getPaperFirstEvaluationResult().equals("")) { //已评阅初审
                firstIsEvaluated = true;
                if(paperForView.getPaperFinalFileName() != null && !paperForView.getPaperFinalFileName().equals("")) { //已上传终审
                    finalFileIsUpload = true;
                    fileName = paperForView.getPaperFinalFileName();
                    if(paperForView.getPaperFinalEvaluationResult() != null && !paperForView.getPaperFinalEvaluationResult().equals("")) { //已评阅终审
                        finalIsEvaluated = true;
                    }
                }
            }
        }
        result.put("fileName", fileName);
        result.put("firstIsEvaluated", firstIsEvaluated);
        result.put("finalFileIsUpload", finalFileIsUpload);
        result.put("finalIsEvaluated", finalIsEvaluated);
        return result;
    }

}
