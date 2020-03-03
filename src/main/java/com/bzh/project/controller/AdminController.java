package com.bzh.project.controller;

import com.bzh.project.model.admin.Admin;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.admin.PaperResult;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.UncheckedPaper;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.service.AdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    private HttpSession session;
    private Admin admin;

    public AdminController(AdminService adminService) {
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
                mav.setViewName("redirect:/admin/index");
                this.session = session;
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
    public String index() {
        return "admin/index";
    }

    @RequestMapping("/search_anything")
    public String searchStudent() {
        return "admin/search_anything";
    }

    @RequestMapping("/search_anything_result")
    public ModelAndView doSearchStudent(@RequestParam(value = "word") @Nullable String word) {
        ModelAndView mav = new ModelAndView("admin/search_anything");
        List<PaperResult> paperSearchResults = adminService.searchAnything(word);
        mav.addObject("paperSearchResults", paperSearchResults);
        mav.addObject("paperSearchResultsCount", paperSearchResults.size());
        return mav;
    }
    
    @RequestMapping("/add_student")
    public String addStudent() {
        return "admin/add_student";
    }

    @RequestMapping("/add_student.do")
    public ModelAndView doAddStudent(Student student) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        student.setPassword(student.getId());
        if(adminService.addStudent(student) == 1) {
            mav.setViewName("admin/add_student");
        }
        return mav;
    }
    
    @RequestMapping("/modify_student")
    public ModelAndView modifyStudent(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("admin/modify_student");
        if(id == null || id.equals("")) {
            return mav;
        }
        Student student = adminService.getStudentById(id);
        mav.addObject("student", student);
        return mav;
    }

    @RequestMapping("/modify_student.do")
    public ModelAndView doModifyStudent(Student student) {
        ModelAndView mav = new ModelAndView("admin/index");// TODO modify error
        if(adminService.modifyStudent(student) == 1) {
            mav.setViewName("admin/index");
        }
        return mav;
    }

    @RequestMapping("/reset_student_password.do")
    public ModelAndView doResetStudentPassword(Student student) {
        ModelAndView mav = new ModelAndView("admin/index");
        if (adminService.resetStudentPassword(student) == 1) {
            mav.setViewName("admin/modify_student?id=" + student.getId());
        }
        return mav;
    }

    @RequestMapping("/list_student_havenot_teacher")
    public ModelAndView listStudentHavenotTeacher(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("admin/list_student_havenot_teacher");
        PageHelper.startPage(pageNum, 10);
        List<Student> studentSearchResults = adminService.listStudentHavenotTeacher();
        PageInfo<Student> pageInfo = new PageInfo<>(studentSearchResults);
        mav.addObject("studentSearchResults", studentSearchResults);
        mav.addObject("studentSearchResultsCount", studentSearchResults.size());
        mav.addObject("pageInfo", pageInfo);
        return mav;
    }

    @RequestMapping("/add_teacher")
    public String addTeacher() {
        return "admin/add_teacher";
    }

    @RequestMapping("/add_teacher.do")
    public ModelAndView doAddTeacher(Teacher teacher) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index"); // TODO add error
        teacher.setPassword(teacher.getId());
        if(adminService.addTeacher(teacher) == 1) {
            mav.setViewName("admin/add_teacher");
        }
        return mav;
    }

    @RequestMapping("/modify_teacher")
    public ModelAndView modifyTeacher(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("admin/modify_teacher");
        if(id == null || id.equals("")) {
            return mav;
        }
        Teacher teacher = adminService.getTeacherById(id);
        mav.addObject("teacher", teacher);
        return mav;
    }
    
    @RequestMapping("/modify_teacher.do")
    public ModelAndView doModifyTeacher(Teacher teacher) {
        ModelAndView mav = new ModelAndView("admin/index");// TODO modify error
        if(adminService.modifyTeacher(teacher) == 1) {
            mav.setViewName("redirect:/admin/modify_teacher?id=" + teacher.getId());
        }
        return mav;
    }

    @RequestMapping("/reset_teacher_password.do")
    public ModelAndView doResetTeacherPassword(Teacher teacher) {
        ModelAndView mav = new ModelAndView("admin/index");
        if (adminService.resetTeacherPassword(teacher) == 1) {
            mav.setViewName("admin/modify_teacher?id=" + teacher.getId());
        }
        return mav;
    }

    @RequestMapping("/add_paper")
    public String addPaper() {
        return "admin/add_paper";
    }

    @RequestMapping("/add_paper.do")
    public ModelAndView doAddPaper(Paper paper) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        if(adminService.addPaper(paper) == 1) {
            mav.setViewName("admin/add_paper");
        }
        return mav;
    }

    @RequestMapping("/modify_paper")
    public ModelAndView modifyPaper(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("admin/modify_paper");
        if(id == null || id.equals("")) {
            return mav;
        }
        Paper paper = adminService.getPaperById(id);
        if(paper == null) {
            mav.addObject("paperIsExist", false);
            mav.addObject("message", "该论文不存在");
            return mav;
        }
        if(paper.getStatus() == null || paper.getStatus().equals("")) {
            mav.addObject("paperUncheck", true);
        }
        mav.addObject("paperIsExist", true);
        mav.addObject("paper", paper);
        return mav;
    }

    @RequestMapping("/modify_paper.do")
    public ModelAndView doModifyPaper(Paper paper) {
        ModelAndView mav = new ModelAndView("admin/index");// TODO modify error
        if(adminService.modifyPaper(paper) == 1) {
            mav.setViewName("redirect:/admin/modify_paper?id=" + paper.getId());
        }
        return mav;
    }

    @RequestMapping("/list_unchecked_paper")
    public ModelAndView listUncheckedPaper(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("admin/list_unchecked_paper");
        PageHelper.startPage(pageNum, 10);
        List<UncheckedPaper> uncheckedPapers = adminService.listUncheckedPaper();
        mav.addObject("uncheckedPapers", uncheckedPapers);
        mav.addObject("uncheckedPapersCount", uncheckedPapers.size());
        mav.addObject("pageInfo", new PageInfo<>(uncheckedPapers));
        return mav;
    }

    @RequestMapping("/check_paper")
    public ModelAndView checkPaper(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/admin/list_unchecked_paper");
        if(id == null || id.equals("")) {
            return mav;
        }
        adminService.checkPaper(id);
        return mav;
    }

    @RequestMapping("/view_paper")
    public ModelAndView viewPaper(@RequestParam("studentId") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/admin/search_anything");
        PaperForView paperView;
        if(id == null || id.equals("") || (paperView = adminService.viewPaperByStudentId(id)) == null) {
            return mav;
        }
        mav.setViewName("admin/view_paper");
        mav.addObject("paperView", paperView);
        return mav;
    }
    
    @RequestMapping("/add_admin")
    public String addAdmin() {
        return "admin/add_admin";
    }

    @RequestMapping("/add_admin.do")
    public ModelAndView doAddAdmin(Admin admin) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        if(adminService.addAdmin(admin) == 1) {
            mav.setViewName("admin/add_admin");
        }
        return mav;
    }

    @RequestMapping("/modify_admin")
    public ModelAndView modifyAdmin(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("admin/modify_admin");
        if(id == null || id.equals("")) {
            return mav;
        }
        Admin admin = adminService.getAdminById(id);
        mav.addObject("admin", admin);
        return mav;
    }

    @RequestMapping("/modify_admin.do")
    public ModelAndView doModifyAdmin(Admin admin) {
        ModelAndView mav = new ModelAndView("admin/index");// TODO modify error
        if(adminService.modifyAdmin(admin) == 1) {
            mav.setViewName("redirect:/admin/modify_admin?id=" + admin.getId());
        }
        return mav;
    }

    @RequestMapping("/list_announcement")
    public ModelAndView listAnnouncement(@RequestParam("word") @Nullable String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("admin/list_announcement");
        PageHelper.startPage(pageNum, 10);
        List<Announcement> announcementSearchResults = adminService.listAnnouncement(word);
        mav.addObject("announcementSearchResults", announcementSearchResults);
        mav.addObject("announcementSearchResultsCount", announcementSearchResults.size());
        mav.addObject("pageInfo", new PageInfo<>(announcementSearchResults));
        return mav;
    }

    @RequestMapping("/view_announcement")
    public ModelAndView viewAnnouncement(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/admin/list_announcement");
        Announcement announcement;
        if (id == null || id.equals("") || (announcement = adminService.getAnnouncementById(id)) == null) {
            return mav;
        }
        mav.setViewName("admin/view_announcement");
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping("/add_announcement")
    public String addAnnouncement() {
        return "admin/add_announcement";
    }

    @RequestMapping("/add_announcement.do")
    public ModelAndView doAddAnnouncement(Announcement announcement) {
        ModelAndView mav = new ModelAndView("redirect:/admin/list_announcement"); //TODO add error
        if((adminService.addAnnouncement(announcement, (Admin)this.session.getAttribute("admin"))) == 1) {
            mav.setViewName("redirect:/admin/list_announcement");
        }
        return mav;
    }

    @RequestMapping("/modify_announcement")
    public ModelAndView modifyAnnouncement(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("admin/list_announcement");
        Announcement announcement;
        if(id == null || id.equals("") || (announcement = adminService.getAnnouncementById(id)) == null) {
            return mav;
        }
        mav.setViewName("admin/modify_announcement");
        mav.addObject("announcement", announcement);
        return mav;
    }

    @RequestMapping("/modify_announcement.do")
    public ModelAndView doModifyAnnouncement(Announcement announcement) {
        ModelAndView mav = new ModelAndView("redirect:/admin/list_announcement");
        adminService.updateAnnouncement(announcement, admin);
        return mav;
    }

    @RequestMapping("/assign_student")
    public ModelAndView assignStudent() {
        ModelAndView mav = new ModelAndView("redirect:/admin/list_student_havenot_teacher");
        adminService.assignStudent();
        return mav;
    }

    @RequestMapping(value = "/add_student_from_csv", method = RequestMethod.POST)
    public ModelAndView addStudentFromCSV(@RequestParam MultipartFile file) throws IOException {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
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
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        if(file == null || file.isEmpty()) {
            return mav;
        }
        if(adminService.addTeacherFromCSV(file) == 0) {
            System.out.println(0);
        }
        return mav;
    }

    @RequestMapping("/delete_student")
    @ResponseBody
    public int deleteStudent(@RequestParam("id") @Nullable String id) {
        return adminService.deleteStudentById(id);
    }

    @RequestMapping("/delete_teacher")
    @ResponseBody
    public int deleteTeacher(@RequestParam("id") @Nullable String id) {
        return adminService.deleteTeacherById(id);
    }

    @RequestMapping("/delete_admin")
    public ModelAndView deleteAdmin(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        Admin admin = new Admin();
        admin.setId(id);
        adminService.deleteAdmin(admin);
        return mav;
    }

    @RequestMapping("/delete_announcement")
    public ModelAndView deleteAnnouncement(@RequestParam("id") @Nullable String id) {
        ModelAndView mav = new ModelAndView("redirect:/admin/index");
        Announcement announcement = new Announcement();
        announcement.setId(id);
        adminService.deleteAnnouncement(announcement);
        return mav;
    }

}
