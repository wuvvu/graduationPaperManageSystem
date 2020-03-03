package com.bzh.project.controller;

import com.bzh.project.model.admin.Admin;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.admin.PaperResult;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.UncheckedPaper;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/newAdmin")
public class AdminNewController {

    private final AdminService adminService;

    private Admin admin;

    @Autowired
    public AdminNewController(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/loginCheck")
    public ModelAndView adminLogin(Admin adminInput, HttpSession session) {
        // TODO user not exist
        ModelAndView mav = new ModelAndView("redirect:/admin/login");
        String adminInputUsername;
        if(adminInput == null || (adminInputUsername = adminInput.getUsername()) == null || adminInputUsername.equals("")) {
            return mav;
        }
        Admin adminCheck = adminService.getAdminByUsername(adminInputUsername);
        if(adminCheck != null) {
            if(adminCheck.getPassword().equals(adminInput.getPassword())) {
                mav.setViewName("redirect:/newAdmin/index");
                //mav.addObject("admin", adminCheck);
                session.setAttribute("admin", adminCheck);
                this.admin = (Admin) session.getAttribute("admin");
            }
            else { //password not correct
                mav.setViewName("redirect:/admin/login");
            }
        }
        return mav;
    }

    @RequestMapping("/index")
    public String newIndex() {
        return "admin/new/index";
    }

    @RequestMapping("/announcement-list")
    public ModelAndView listAnnouncement(@RequestParam("word") @Nullable String word) {
        ModelAndView mav = new ModelAndView("admin/new/announcement-list");
        List<Announcement> announcementSearchResults = adminService.listAnnouncement(word);
        mav.addObject("announcementSearchResults", announcementSearchResults);
        return mav;
    }

    @RequestMapping("/announcement-add")
    public String addAnnouncement() {
        return "admin/new/announcement-add";
    }

    @RequestMapping("/announcement-add.do")
    public ModelAndView doAddAnnouncement(Announcement announcement) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/announcement-list"); //TODO add error
        if((adminService.addAnnouncement(announcement, this.admin)) == 1) {
            mav.setViewName("redirect:/newAdmin/announcement-list");
        }
        return mav;
    }

    @RequestMapping("/announcement-modify")
    public ModelAndView modifyAnnouncement(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/new/announcement-modify");
        Announcement announcement = adminService.getAnnouncementById(id);
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping("/announcement-modify.do")
    public ModelAndView doModifyAnnouncement(Announcement announcement) {
        ModelAndView mav = new ModelAndView("redirect:/admin/new/announcement-list");
        adminService.updateAnnouncement(announcement, this.admin);
        return mav;
    }

    @RequestMapping("/student-list")
    public ModelAndView listStudent() {
        ModelAndView mav = new ModelAndView("admin/new/student-list");
        List<Student> students = adminService.listStudent();
        mav.addObject("students", students);
        return mav;
    }

    @RequestMapping("/student-add")
    public String addStudent() {
        return "admin/new/student-add";
    }

    @RequestMapping("/student-add.do")
    public ModelAndView doAddStudent(Student student) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/student-list");
        adminService.addStudent(student);
        return mav;
    }

    @RequestMapping("/student-modify")
    public ModelAndView modifyStudent(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/student-list");
        if(id == null || id.equals("")) {
            return mav;
        }
        Student student = adminService.getStudentById(id);
        if(student == null) {
            return mav;
        }
        mav.setViewName("admin/new/student-modify");
        mav.addObject("student", student);
        return mav;
    }

    @RequestMapping("/student-modify.do")
    public ModelAndView doModifyStudent(Student student) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/student-list");
        adminService.modifyStudent(student);
        return mav;
    }

    @RequestMapping("/student-assign")
    public ModelAndView assignStudent() {
        ModelAndView mav = new ModelAndView("admin/new/student-assign");
        List<Student> students = adminService.listStudentHavenotTeacher();
        mav.addObject("students", students);
        return mav;
    }

    @RequestMapping("/student-assign.do")
    public String autoAssignStudent() {
        adminService.assignStudent();
        return "redirect:/newAdmin/student-assign";
    }

    @RequestMapping("/teacher-list")
    public ModelAndView listTeacher() {
        ModelAndView mav = new ModelAndView("admin/new/teacher-list");
        List<Teacher> teachers = adminService.listTeacher();
        mav.addObject("teachers", teachers);
        return mav;
    }
    
    @RequestMapping("/teacher-add")
    public String addTeacher() {
        return "admin/new/teacher-add";
    }

    @RequestMapping("/teacher-add.do")
    public ModelAndView doAddTeacher(Teacher teacher) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/teacher-list");
        adminService.addTeacher(teacher);
        return mav;
    }

    @RequestMapping("/teacher-modify")
    public ModelAndView modifyTeacher(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/teacher-list");
        if(id == null || id.equals("")) {
            return mav;
        }
        Teacher teacher = adminService.getTeacherById(id);
        if(teacher == null) {
            return mav;
        }
        mav.setViewName("admin/new/teacher-modify");
        mav.addObject("teacher", teacher);
        return mav;
    }
    
    @RequestMapping("/teacher-modify.do")
    public ModelAndView doModifyTeacher(Teacher teacher) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/teacher-list");
        adminService.modifyTeacher(teacher);
        return mav;
    }

    @RequestMapping("/paper-list")
    public ModelAndView listPaper() {
        ModelAndView mav = new ModelAndView("admin/new/paper-list");
        List<PaperResult> papers = adminService.listPaper();
        mav.addObject("papers", papers);
        return mav;
    }

    @RequestMapping("/paper-add")
    public String addPaper() {
        return "admin/new/paper-add";
    }

    @RequestMapping("/paper-add.do")
    public ModelAndView doAddPaper(Paper paper) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/paper-list");
        adminService.addPaper(paper);
        return mav;
    }

    @RequestMapping("/paper-modify")
    public ModelAndView modifyPaper(@RequestParam("id") @Nullable String paperId) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/paper-list");
        if(paperId == null|| paperId.equals("")) {
            return mav;
        }
        Paper paper = adminService.getPaperById(paperId);
        if(paper == null) {
            return mav;
        }
        if(paper.getStatus() == null || paper.getStatus().equals("") || !paper.getStatus().equals("checked")) {
            mav.addObject("paperUncheck", true);
        }
        mav.setViewName("admin/new/paper-modify");
        mav.addObject("paper", paper);
        return mav;
    }

    @RequestMapping("/paper-modify.do")
    public ModelAndView doModifyPaper(Paper paper) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/paper-list");
        adminService.modifyPaper(paper);
        return mav;
    }

    @RequestMapping("/paper-list-unchecked")
    public ModelAndView listUncheckedPaper() {
        ModelAndView mav = new ModelAndView("admin/new/paper-list-unchecked");
        List<UncheckedPaper> uncheckedPapers = adminService.listUncheckedPaper();
        mav.addObject("papers", uncheckedPapers);
        return mav;
    }

    @RequestMapping("/check_paper")
    public ModelAndView checkPaper(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/paper-list-unchecked");
        if(id == null || id.equals("")) {
            return mav;
        }
        adminService.checkPaper(id);
        return mav;
    }

    @RequestMapping("/admin-list")
    public ModelAndView listAdmin() {
        ModelAndView mav = new ModelAndView("admin/new/admin-list");
        List<Admin> admins = adminService.listAdmin();
        mav.addObject("admins", admins);
        return mav;
    }

    @RequestMapping("/admin-add")
    public String addAdmin() {
        return "admin/new/admin-add";
    }

    @RequestMapping("/admin-add.do")
    public ModelAndView doAddAdmin(Admin admin) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/admin-list");
        adminService.addAdmin(admin);
        return mav;
    }

    @RequestMapping("/admin-modify")
    public ModelAndView modifyAdmin(@RequestParam("id") @Nullable String adminId) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/admin-list");
        if(adminId == null|| adminId.equals("")) {
            return mav;
        }
        Admin admin = adminService.getAdminById(adminId);
        if(admin == null) {
            return mav;
        }
        mav.setViewName("admin/new/admin-modify");
        mav.addObject("admin", admin);
        return mav;
    }

    @RequestMapping("/admin-modify.do")
    public ModelAndView doModifyAdmin(Admin admin) {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/admin-list");
        adminService.modifyAdmin(admin);
        return mav;
    }

    @RequestMapping("/view-announcement")
    public ModelAndView viewAnnouncement(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/new/view-announcement");
        Announcement announcement = adminService.getAnnouncementById(id);
        if(announcement == null) {
            mav.setViewName("redirect:/newAdmin/announcement-list");
            return mav;
        }
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping(value = "/add_student_from_csv", method = RequestMethod.POST)
    public ModelAndView addStudentFromCSV(@RequestParam MultipartFile file) throws IOException {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/student-list");
        if(file == null || file.isEmpty()) {
            return mav;
        }
        if(adminService.addStudentFromCSV(file) == 0) {
            System.out.println(0);
        }
        return mav;
    }

    @RequestMapping(value = "/add_teacher_from_csv", method = RequestMethod.POST)
    public ModelAndView addTeacherFromCSV(@RequestParam MultipartFile file) throws IOException {
        ModelAndView mav = new ModelAndView("redirect:/newAdmin/student-list");
        if(file == null || file.isEmpty()) {
            return mav;
        }
        if(adminService.addTeacherFromCSV(file) == 0) {
            System.out.println(0);
        }
        return mav;
    }

    @RequestMapping("/downloadTemplate")
    public void downloadTemplate(@RequestParam("type") String type, HttpServletResponse response) throws UnsupportedEncodingException {
        adminService.makeCSV(type, response);
    }
}
