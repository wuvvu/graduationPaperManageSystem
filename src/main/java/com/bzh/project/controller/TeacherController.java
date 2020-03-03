package com.bzh.project.controller;

import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.PaperSearchResult;
import com.bzh.project.model.student.StudentAndPaper;
import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {

    private TeacherService teacherService;

    private Teacher teacher;

    public TeacherController( TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping("/teacher/main")
    public ModelAndView teacherMainPage(Teacher teacherInput, HttpSession session){
        System.out.println("class LoginController teacherMainPage method");
        ModelAndView mav = new ModelAndView("redirect:/login?state=userNotExists");
        String teacherInputId;
        if(teacherInput == null || (teacherInputId = teacherInput.getId()) == null || "".equals(teacherInputId)) {
            System.out.println("teacherInput.getId().equal(\"\")");
            mav.setViewName("redirect:/login");
            return mav;
        }
        Teacher teacherCheck;
        if((teacherCheck = teacherService.getTeacherById(teacherInputId)) != null) {
            if(teacherCheck.getPassword().equals(teacherInput.getPassword())) {
                mav.setViewName("redirect:/jsp/teacher/personal_information.jsp");
                session.setAttribute("teacher", teacherCheck);
                this.teacher = teacherCheck;
            }
            else {
                mav.setViewName("redirect:/login?state=wrongPassword");
            }
        }
        return mav;
    }

    @RequestMapping("/jsp/teacher/change_password")
    public ModelAndView doChangePassword(@RequestParam("oldPassword") @Nullable String oldPassword,
                                         @RequestParam("newPassword") @Nullable String newPassword,
                                         @RequestParam("confirmPassword") @Nullable String confirmPassword) {
        ModelAndView mav = new ModelAndView("teacher/change_password");
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
        if(teacherService.changePassword(this.teacher, oldPassword, newPassword) == -1) {
            mav.addObject("message", "原密码不正确");
            return mav;
        }
        mav.setViewName("redirect:/jsp/teacher/personal_information.jsp");
        return mav;
    }

    @RequestMapping("/jsp/teacher/student_manage")
    public ModelAndView listStudentAndPaper(HttpSession session) {
        ModelAndView mav = new ModelAndView("teacher/student_manage");
        List<StudentAndPaper> studentAndPapers = teacherService.listStudentByTeacherId(teacher.getId());
        mav.addObject("studentAndPapers", studentAndPapers);
        return mav;
    }

    @RequestMapping("/jsp/teacher/paper_manage")
    public ModelAndView listPaper() {
        ModelAndView mav = new ModelAndView("teacher/paper_manage");
        List<Paper> papers = teacherService.listPaperByTeacherId(this.teacher.getId());
        mav.addObject("papers", papers);
        return mav;
    }

    @RequestMapping("/jsp/teacher/modify_paper")
    public ModelAndView modifyPaper(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/paper_manage");
        if(id == null || id.equals("")) {
            return mav;
        }
        mav.setViewName("teacher/modify_paper");
        Paper paper = teacherService.getPaperById(id);
        mav.addObject("paper", paper);
        return mav;
    }

    @RequestMapping("/jsp/teacher/modify_paper.do")
    public ModelAndView doModifyPaper(Paper paper) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/paper_manage");
        teacherService.modifyPaper(paper);
        return mav;
    }

    @RequestMapping("/jsp/teacher/do_add_paper")
    public ModelAndView addPaper(Paper paper, HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/paper_manage");
        Teacher currentTeacher = (Teacher)session.getAttribute("teacher");
        paper.setTeacherId(currentTeacher.getId());
        teacherService.addPaper(paper);
        return mav;
    }

    @RequestMapping("/jsp/teacher/list_announcement")
    public ModelAndView listAnnouncement(@RequestParam("word") @Nullable String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("teacher/list_announcement");
        List<Announcement> announcementSearchResults = teacherService.listAnnouncement(word);
        PageHelper.startPage(pageNum, 10);
        mav.addObject("announcementSearchResults", announcementSearchResults);
        mav.addObject("announcementSearchResultsCount", announcementSearchResults.size());
        mav.addObject("pageInfo", new PageInfo<>(announcementSearchResults));
        return mav;
    }

    @RequestMapping("/jsp/teacher/view_announcement")
    public ModelAndView viewAnnouncement(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/list_announcement");
        Announcement announcement;
        if (id == null || id.equals("") || (announcement = teacherService.getAnnouncementById(id)) == null) {
            return mav;
        }
        mav.setViewName("teacher/view_announcement");
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping("/jsp/teacher/view_paper")
    public ModelAndView viewPaper(@RequestParam("studentId") String id) {
        ModelAndView mav = new ModelAndView("teacher/view_paper");
        PaperForView paperView = teacherService.viewPaperByStudentId(id);
        String firstFileName = teacherService.getFirstFileNameByPaperId(paperView.getPaperId());
        String finalFileName = teacherService.getFinalFileNameByPaperId(paperView.getPaperId());
        String fileName = finalFileName;
        if(finalFileName == null || finalFileName.equals("")) {
            fileName = firstFileName;
        }
        mav.addObject("fileName", fileName);
        mav.addObject("paperView", paperView);
        return mav;
    }

    @RequestMapping("/jsp/teacher/list_unevaluated_paper")
    public ModelAndView listUnevaluatedPaper(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("teacher/list_unevaluated_paper");
        PageHelper.startPage(pageNum, 10);
        List<PaperSearchResult> paperSearchResults = teacherService.listUnevaluatedPaper(this.teacher);
        mav.addObject("paperSearchResults", paperSearchResults);
        mav.addObject("pageInfo", new PageInfo<>(paperSearchResults));
        return mav;
    }

    @RequestMapping("/jsp/teacher/paper_evaluation")
    public ModelAndView evaluatePaper(@RequestParam("studentId") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/list_unevaluated_paper");
        if(id == null || id.equals("")) {
            return mav;
        }
        mav.setViewName("teacher/paper_evaluation");
        PaperForView paperForView = teacherService.viewPaperByStudentId(id);
        Map<String, Object> evaluationStatus = teacherService.getEvaluationStatusByPaper(paperForView);
        String fileName = (String) evaluationStatus.get("fileName");
        boolean firstIsEvaluated = (boolean) evaluationStatus.get("firstIsEvaluated");
        boolean finalFileIsUpload = (boolean) evaluationStatus.get("finalFileIsUpload");
        boolean finalIsEvaluated = (boolean) evaluationStatus.get("finalIsEvaluated");
        System.out.println("firstIsEvaluated = " + firstIsEvaluated);
        System.out.println("finalFileIsUpload = " + finalFileIsUpload);
        System.out.println("finalIsEvaluated = " + finalIsEvaluated);
        System.out.println("fileName = " + fileName);
        mav.addObject("paperView", paperForView);
        mav.addObject("fileName", fileName);
        mav.addObject("firstIsEvaluated", firstIsEvaluated);
        mav.addObject("finalFileIsUpload", finalFileIsUpload);
        mav.addObject("finalIsEvaluated", finalIsEvaluated);
        return mav;
    }

    @RequestMapping("/jsp/teacher/paper_evaluation.do")
    public ModelAndView doEvaluatePaper(@RequestParam("paperId") String paperId,
                                        @RequestParam("evaluation") String evaluation,
                                        @RequestParam("time") String time) {
        ModelAndView mav = new ModelAndView("redirect:/jsp/teacher/list_unevaluated_paper");
        if(time == null || time.equals("")) {
            return mav;
        }
        if(time.equals("first")) {
            if(teacherService.updateFirstEvaluation(evaluation, paperId) == 1) {
                mav.setViewName("redirect:/jsp/teacher/paper_evaluation");
            }
        }
        else if(time.equals("final")) {
            if(teacherService.updateFinalEvaluation(evaluation, paperId) == 1) {
                mav.setViewName("redirect:/jsp/teacher/paper_evaluation");
            }
        }
        return mav;
    }

}
