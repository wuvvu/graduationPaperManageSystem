package com.bzh.project.controller;

import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class StudentController {

    private StudentService studentService;

    private HttpSession session;
    private Student student;
    private Teacher teacher;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping("/student/main")
    public ModelAndView studentMainPage(Student studentInput, HttpSession session) {
        System.out.println("class StudentController studentMainPage method");
        ModelAndView mav = new ModelAndView("redirect:/login?state=userNotExists");
        String studentInputId;
        if(studentInput == null || (studentInputId = studentInput.getId()) == null || studentInputId.equals("")) {
            System.out.println("studentInput.getId().equals(\"\")");
            mav.setViewName("redirect:/login");
            return mav;
        }
        Student studentCheck;
        if((studentCheck = studentService.getStudentById(studentInputId)) != null) {
            if(studentCheck.getPassword().equals(studentInput.getPassword())) {
                Teacher teacher = studentService.getTeacherByStudentId(studentInputId);
                Paper paper = studentService.getPaperByStudentId(studentInputId);
                /*mav.addObject("student", studentCheck);
                mav.addObject("teacher", teacher);
                mav.addObject("project", project);*/
                //mav.setViewName("/student/personal_information");
                mav.setViewName("redirect:/jsp/student/personal_information.jsp");
                session.setAttribute("student", studentCheck);
                session.setAttribute("teacher", teacher);
                session.setAttribute("paper", paper);
                this.session = session;
                this.student = studentCheck;
                this.teacher = teacher;
            }
            else {
                mav.setViewName("redirect:/login?state=wrongPassword");
            }
        }
        return mav;
    }

    @RequestMapping("/jsp/student/change_password")
    public ModelAndView doChangePassword(@RequestParam("oldPassword") @Nullable String oldPassword,
                                       @RequestParam("newPassword") @Nullable String newPassword,
                                       @RequestParam("confirmPassword") @Nullable String confirmPassword) {
        ModelAndView mav = new ModelAndView("student/change_password");
        if(oldPassword == null || newPassword == null || confirmPassword == null) {
            return mav;
        }
        if(oldPassword.equals("") || newPassword.equals("") || confirmPassword.equals("")) {
            mav.addObject("message", "密码不能为空");
            return mav;
        }
        if(!newPassword.equals(confirmPassword)) {
            mav.addObject("message", "新密码与确认密码不一致");
            return mav;
        }
        if(studentService.changePassword(this.student, oldPassword, newPassword) == -1) {
            mav.addObject("message", "原密码不正确");
            return mav;
        }
        mav.setViewName("redirect:/jsp/student/personal_information.jsp");
        return mav;
    }


    @RequestMapping("/jsp/student/show_paper")
    public ModelAndView showPaper() {
        ModelAndView mav = new ModelAndView("student/paper_information");
        if(this.teacher == null) {
            mav.setViewName("student/paper_select");
            return mav;
        }
        Paper paper = studentService.getPaperByStudentId(this.student.getId());
        if (paper == null || paper.getId().equals("")) {
            mav.setViewName("student/paper_select");
            List<Paper> papers = studentService.listUnselectedPaperByTeacherId(teacher.getId());
            mav.addObject("papers", papers);
            return mav;
        }
        mav.addObject("paper", paper);
        return mav;
    }

    @RequestMapping("/jsp/student/do_select_paper")
    public ModelAndView selectPaper(@RequestParam("id") String paperId) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/student/show_paper");
        studentService.studentSelectPaper(student.getId(), paperId);
        return mav;
    }

    @RequestMapping("/jsp/student/paper_upload")
    public ModelAndView paperUpload() {
        ModelAndView mav = new ModelAndView("student/paper_upload");
        boolean noPaperAssigned = false;
        if(this.student.getPaperId() == null || this.student.getPaperId().equals("")) {
            noPaperAssigned = true;
        }
        mav.addObject("noPaperAssigned", noPaperAssigned);
        String firstUploadDisabled = "disabled",
                finalUploadDisabled = "disabled",
                firstUploadMessage = null,
                finalUploadMessage = null;
        String firstFileName = studentService.getFirstFileNameByStudentId(this.student.getId());
        String finalFileName = studentService.getFinalFileNameByStudentId(this.student.getId());
        if(firstFileName == null || firstFileName.equals("")) { //未上传初审
            firstUploadDisabled = "enabled";
            finalUploadMessage = "初审未上传，不能上传终审";
        } else if (finalFileName == null || finalFileName.equals("")) { //已上传初审，未上传终审
            finalUploadDisabled = "enabled";
            firstUploadMessage = firstFileName; //显示文件名
        } else { //初审和终审都已上传
            firstUploadMessage = firstFileName;
            finalUploadMessage = finalFileName;
        }
        mav.addObject("firstUploadDisabled", firstUploadDisabled);
        mav.addObject("finalUploadDisabled", finalUploadDisabled);
        mav.addObject("firstUploadMessage", firstUploadMessage);
        mav.addObject("finalUploadMessage", finalUploadMessage);
        return mav;
    }

    @RequestMapping(value = "/jsp/student/doUploadFile", method = RequestMethod.POST)
    public ModelAndView doUploadFile(@RequestParam MultipartFile file, @RequestParam String time) throws IOException {
        ModelAndView mav = new ModelAndView("redirect:/jsp/student/paper_upload");
        if(file == null || file.isEmpty() || time == null || time.equals("")) {
            return mav;
        }
        if(studentService.uploadFile(file, this.student, time) != 1) {
            System.out.println("class StudentController doUploadFile error");
            //TODO upload error
        }
        return mav;
    }


    @RequestMapping("/jsp/student/list_announcement")
    public ModelAndView listAnnouncement(@RequestParam("word") @Nullable String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("student/list_announcement");
        PageHelper.startPage(pageNum, 10);
        List<Announcement> announcementSearchResults = studentService.listAnnouncement(word);
        mav.addObject("announcementSearchResults", announcementSearchResults);
        mav.addObject("pageInfo", new PageInfo<>(announcementSearchResults));
        return mav;
    }

    @RequestMapping("/jsp/student/view_announcement")
    public ModelAndView viewAnnouncement(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/student/list_announcement");
        Announcement announcement;
        if (id == null || id.equals("") || (announcement = studentService.getAnnouncementById(id)) == null) {
            return mav;
        }
        mav.setViewName("student/view_announcement");
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping("/jsp/student/paper_evaluation")
    public ModelAndView evaluationResult() {
        ModelAndView mav = new ModelAndView("student/paper_evaluation");
        String firstEvaluationResult = studentService.getFirstEvaluationResultByStudentId(this.student.getId());
        String finalEvaluationResult = studentService.getFinalEvaluationResultByStudentId(this.student.getId());
        mav.addObject("firstEvaluationResult", firstEvaluationResult);
        mav.addObject("finalEvaluationResult", finalEvaluationResult);
        return mav;
    }

    @RequestMapping("/jsp/student/view_paper")
    public ModelAndView viewPaper(@RequestParam("studentId") @Nullable String id) {
        ModelAndView mav = new ModelAndView("student/view_paper");
        if(id == null || id.equals("")) {
            mav.setViewName("redirect:/jsp/student/query_excellent_papers_result");
            return mav;
        }
        PaperForView paperView = studentService.viewPaperByStudentId(id);
        String firstFileName = studentService.getFirstFileNameByPaperId(paperView.getPaperId());
        String finalFileName = studentService.getFinalFileNameByPaperId(paperView.getPaperId());
        String fileName = finalFileName;
        if(finalFileName == null || finalFileName.equals("")) {
            fileName = firstFileName;
        }
        mav.addObject("fileName", fileName);
        mav.addObject("paperView", paperView);
        return mav;
    }

}
