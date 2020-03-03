package com.bzh.project.service;

import com.bzh.project.mapper.StudentMapper;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.Teacher;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class StudentService {

    private final StudentMapper studentMapper;

    private final AdminService adminService;

    private final FileService fileService;

    private final TeacherService teacherService;

    public StudentService(StudentMapper studentMapper, AdminService adminService, FileService fileService, TeacherService teacherService) {
        this.studentMapper = studentMapper;
        this.adminService = adminService;
        this.fileService = fileService;
        this.teacherService = teacherService;
    }

    public int changePassword(@NotNull Student student, String oldPassword, String newPassword) {
        if(student.getPassword().equals(oldPassword)) {
            student.setPassword(newPassword);
            adminService.setStudentPassword(student);
            return 0;
        }
        return -1;
    }

    public Student getStudentById(String id) {
        return studentMapper.getStudentById(id);
    }

    public Teacher getTeacherByStudentId(String id) {
        return studentMapper.getTeacherByStudentId(id);
    }

    public Paper getPaperByStudentId(String id) {
        return studentMapper.getPaperByStudentId(id);
    }

    public List<Paper> listUnselectedPaperByTeacherId(String id) {
        return studentMapper.listUnselectedPaperByTeacherId(id);
    }

    public void studentSelectPaper(String studentId, String paperId) {
        studentMapper.studentSelectPaper(studentId, paperId);
    }

    public List<Announcement> listAnnouncement(String word) {
        return adminService.listAnnouncement(word);
    }

    public Announcement getAnnouncementById(String id) {
        return adminService.getAnnouncementById(id);
    }

    public String getFirstFileNameByStudentId(String id) {
        return studentMapper.getFirstFileNameByStudentId(id);
    }

    public String getFinalFileNameByStudentId(String id) {
        return studentMapper.getFinalFileNameByStudentId(id);
    }

    public int uploadFile(MultipartFile file, Student student, String time) throws IOException {
        if(time.equals("first")) {
            String FileName;
            if((FileName = fileService.upload(file, student, time)) == null) {
                return 0;
            }
            return studentMapper.uploadFirstFile(FileName, student.getId());
        }
        else if(time.equals("final")) {
            String FileName;
            if((FileName = fileService.upload(file, student, time)) == null) {
                return 0;
            }
            return studentMapper.uploadFinalFile(FileName, student.getId());
        }
        return 0;
    }

    public String getFirstEvaluationResultByStudentId(String id) {
        String result = studentMapper.getFirstEvaluationResultByStudentId(id);
        if(result == null || result.equals("")) {
            result = "教师未评阅";
        }
        return result;
    }

    public String getFinalEvaluationResultByStudentId(String id) {
        String result = studentMapper.getFinalEvaluationResultByStudentId(id);
        if(result == null || result.equals("")) {
            result = "教师未评阅";
        }
        return result;
    }

    public PaperForView viewPaperByStudentId(String id) {
        return teacherService.viewPaperByStudentId(id);
    }

    public String getFinalFileNameByPaperId(String id) {
        return teacherService.getFinalFileNameByPaperId(id);
    }

    public String getFirstFileNameByPaperId(String id) {
        return teacherService.getFirstFileNameByPaperId(id);
    }

}
