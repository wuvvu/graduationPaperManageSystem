package com.bzh.project.service;

import cn.hutool.core.text.csv.CsvUtil;
import cn.hutool.core.text.csv.CsvWriter;
import cn.hutool.core.util.CharsetUtil;
import com.bzh.project.Util.DateUtil;
import com.bzh.project.mapper.AdminMapper;
import com.bzh.project.model.admin.Admin;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.admin.AnnouncementSearchResult;
import com.bzh.project.model.admin.PaperResult;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.UncheckedPaper;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.Teacher;
import de.siegmar.fastcsv.reader.CsvContainer;
import de.siegmar.fastcsv.reader.CsvReader;
import de.siegmar.fastcsv.reader.CsvRow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdminService {

    private AdminMapper adminMapper;

    private FileService fileService;

    @Autowired
    public AdminService(AdminMapper adminMapper, FileService fileService) {
        this.adminMapper = adminMapper;
        this.fileService = fileService;
    }

    public Admin getAdminByUsername(String username) {
        return adminMapper.getAdminByUsername(username);
    }

    public List<PaperResult> searchAnything(String word) {
        return adminMapper.searchAnything(word);
    }

    public Student getStudentById(String id) {
        return adminMapper.getStudentById(id);
    }

    public void setStudentPassword(Student student) {
        adminMapper.setStudentPassword(student);
    }

    public int addStudent(Student student) {
        student.setPassword(student.getId());
        return adminMapper.addStudent(student);
    }

    public int modifyStudent(Student student) {
        return adminMapper.modifyStudent(student);
    }

    public int resetStudentPassword(Student student) {
        return adminMapper.resetStudentPassword(student);
    }

    public List<Student> listStudentHavenotTeacher() {
        return adminMapper.listStudentHavenotTeacher();
    }

    public Teacher getTeacherById(String id) {
        return adminMapper.getTeacherById(id);
    }

    public int setTeacherPassword(Teacher teacher) {
        return adminMapper.setTeacherPassword(teacher);
    }

    public int addTeacher(Teacher teacher) {
        teacher.setPassword(teacher.getId());
        return adminMapper.addTeacher(teacher);
    }

    public int modifyTeacher(Teacher teacher) {
        return adminMapper.modifyTeacher(teacher);
    }

    public int resetTeacherPassword(Teacher teacher) {
        return adminMapper.resetTeacherPassword(teacher);
    }

    public Paper getPaperById(String id) {
        return adminMapper.getPaperById(id);
    }

    public int addPaper(Paper paper) {
        return adminMapper.addPaper(paper);
    }

    public int modifyPaper(Paper paper) {
        return adminMapper.modifyPaper(paper);
    }

    public List<UncheckedPaper> listUncheckedPaper() {
        List<UncheckedPaper> uncheckedPapers = adminMapper.listUncheckedPaper();
        for (UncheckedPaper up : uncheckedPapers) {
            up.setTeacher(this.getTeacherById(up.getTeacherId()));
        }
        return uncheckedPapers;
    }

    public int checkPaper(String id) {
        return adminMapper.checkPaper(id);
    }

    public PaperForView viewPaperByStudentId(String id) {
        return adminMapper.viewPaperByStudentId(id);
    }

    public Admin getAdminById(String id) {
        return adminMapper.getAdminById(id);
    }

    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    public int modifyAdmin(Admin admin) {
        return adminMapper.modifyAdmin(admin);
    }

    public List<Announcement> listAnnouncement(String word) {
        List<AnnouncementSearchResult> announcementSearchResults = adminMapper.listAnnouncement(word);
        List<Announcement> announcements = new ArrayList<>();
        for (AnnouncementSearchResult announcementSearchResult : announcementSearchResults) {
            announcements.add(new Announcement(
                    announcementSearchResult.getId(),
                    announcementSearchResult.getTitle(),
                    announcementSearchResult.getContent(),
                    announcementSearchResult.getRemark(),
                    announcementSearchResult.getCreateAdminId(),
                    this.getAdminById(announcementSearchResult.getCreateAdminId()),
                    announcementSearchResult.getLastModifyAdminId(),
                    this.getAdminById(announcementSearchResult.getLastModifyAdminId()),
                    announcementSearchResult.getCreateTime(),
                    announcementSearchResult.getLastModifyTime()));
        }
        return announcements;
    }

    public int addAnnouncement(Announcement announcement, Admin admin) {
        announcement.setCreateAdmin(admin);
        announcement.setCreateAdminId(admin.getId());
        announcement.setCreateTime(new DateUtil().getDate());
        return adminMapper.addAnnouncement(announcement);
    }

    public Announcement getAnnouncementById(String id) {
        AnnouncementSearchResult announcementSearchResult = adminMapper.getAnnouncementById(id);
        if(announcementSearchResult == null) {
            return null;
        }
        return new Announcement(announcementSearchResult.getId(),
                announcementSearchResult.getTitle(),
                announcementSearchResult.getContent(),
                announcementSearchResult.getRemark(),
                announcementSearchResult.getCreateAdminId(),
                this.getAdminById(announcementSearchResult.getCreateAdminId()),
                announcementSearchResult.getLastModifyAdminId(),
                this.getAdminById(announcementSearchResult.getLastModifyAdminId()),
                announcementSearchResult.getCreateTime(),
                announcementSearchResult.getLastModifyTime());
    }

    public int updateAnnouncement(Announcement announcement, Admin admin) {
        //announcement.setLastModifyAdminId(admin.getId());
        announcement.setLastModifyAdmin(admin);
        announcement.setLastModifyTime(new DateUtil().getDate());
        return adminMapper.updateAnnouncement(announcement);
    }

    public void assignStudent() {
        //列出未满10个学生的老师
        List<Teacher> teachers = adminMapper.listTeachersWithoutTenStudents();
        if (teachers.isEmpty()) {
            return;
        }
        for (Teacher teacher : teachers) {
            //列出未分配老师的学生
            List<Student> students = this.listStudentHavenotTeacher();
            if (students.isEmpty()) {
                break;
            }
            System.out.print(teacher.getId() + " ");

            int count = teacher.getStudentCounts();
            System.out.println(count);
            for (Student student : students) {
                if (count < 10) {
                    student.setTeacherId(teacher.getId());
                    this.modifyStudent(student);
                    count++;
                }
            }
            adminMapper.setTeachersStudentCounts(count, Integer.parseInt(teacher.getId()));
        }
    }

    public int addStudentFromCSV(MultipartFile multipartFile) throws IOException {
        if (multipartFile == null || multipartFile.isEmpty()) {
            return -1;
        }
        File file = new File(System.getenv("temp") + "\\temp_insert.csv");
        System.out.println("file.getName() = " + file.getName());
        multipartFile.transferTo(file);

        CsvReader csvReader = new CsvReader();
        csvReader.setContainsHeader(true);

        CsvContainer csv = csvReader.read(file, CharsetUtil.CHARSET_GBK);
        if (!csv.getHeader().get(0).equals("学号")) {
            return -10;
        }
        List<Student> students = new ArrayList<>();
        for (CsvRow row : csv.getRows()) {
            students.add(new Student(
                    row.getField("学号"),
                    row.getField("学号"),
                    row.getField("姓名"),
                    row.getField("专业"),
                    row.getField("毕业年份")
            ));
        }
        if(students.isEmpty()) {
            file.delete();
            return -2;
        }
        adminMapper.addStudentFromList(students);
        file.delete();
        return 0;
    }

    public int addTeacherFromCSV(MultipartFile multipartFile) throws IOException {
        if (multipartFile == null || multipartFile.isEmpty()) {
            return -1;
        }
        File file = new File(System.getenv("temp") + "\\temp_insert.csv");
        System.out.println("file.getName() = " + file.getName());
        multipartFile.transferTo(file);

        CsvReader csvReader = new CsvReader();
        csvReader.setContainsHeader(true);

        CsvContainer csv = csvReader.read(file, CharsetUtil.CHARSET_GBK);
        if (!csv.getHeader().get(0).equals("工号")) { //\uFEFF
            return -10;
        }
        List<Teacher> teachers = new ArrayList<>();
        for (CsvRow row : csv.getRows()) {
            teachers.add(new Teacher(
                    row.getField("工号"),
                    row.getField("工号"),
                    row.getField("姓名"),
                    row.getField("职称"),
                    row.getField("办公电话"),
                    row.getField("个人电话")
            ));
        }
        if(teachers.isEmpty()) {
            file.delete();
            return -2;
        }
        adminMapper.addTeacherFromList(teachers);
        file.delete();
        return 0;
    }

    public List<Student> listStudent() {
        return adminMapper.listStudent();
    }

    public List<Teacher> listTeacher() {
        return adminMapper.listTeacher();
    }

    public List<PaperResult> listPaper() {
        return adminMapper.listPaper();
    }

    public List<Admin> listAdmin() {
        return adminMapper.listAdmin();
    }

    public Paper getPaperByStudentId(String id) {
        return adminMapper.getPaperByStudentId(id);
    }

    public int deleteAdmin(Admin admin) {
        adminMapper.deleteAnnouncementByCreateAdmin(admin);
        return adminMapper.deleteAdmin(admin);
    }

    public int deleteAnnouncement(Announcement announcement) {
        return adminMapper.deleteAnnouncement(announcement);
    }

    public int deleteStudentById(String id) {
        Student student = getStudentById(id);
        if(student == null) {
            return 0;
        }
        if(student.getTeacherId() == null || student.getTeacherId().equals("")) { //未分配教师
            return adminMapper.deleteStudent(student);
        }
        Teacher teacher = getTeacherById(student.getTeacherId());
        if(student.getPaperId() == null || student.getPaperId().equals("")) { //已分配教师未选题
            adminMapper.setTeachersStudentCounts(teacher.getStudentCounts() - 1, Integer.parseInt(teacher.getId()));
            return adminMapper.deleteStudent(student);
        }
        //已选题
        Paper paper = getPaperById(student.getPaperId());
        adminMapper.setTeachersStudentCounts(teacher.getStudentCounts() - 1, Integer.parseInt(teacher.getId()));
        adminMapper.deletePaper(paper);
        return adminMapper.deleteStudent(student);
    }

    public int deleteTeacherById(String id) {
        Teacher teacher = getTeacherById(id);
        if(teacher == null) {
            return 0;
        }
        if(teacher.getStudentCounts() == 0) { //未分配学生
            adminMapper.deletePaperByTeacherId(teacher.getId());
            return adminMapper.deleteTeacher(teacher);
        }
        //有分配学生
        return 0;
    }

    public int makeCSV(String type, HttpServletResponse response) throws UnsupportedEncodingException {
        File file = new File(System.getenv("temp") + "\\template_" + type + ".csv");
        CsvWriter writer = CsvUtil.getWriter(file, CharsetUtil.CHARSET_GBK);
        if(type.equals("student")) {
            writer.write(new String[] {"学号", "姓名", "专业", "毕业年份"});
        } else if(type.equals("teacher")) {
            writer.write(new String[] {"工号", "姓名", "职称", "办公电话", "个人电话"});
        }
        if (file.exists()) {
            response.setContentType("application/force-download;charset=utf-8");// 设置强制下载不打开
            response.setCharacterEncoding("utf-8");
            response.addHeader("Content-Disposition", "attachment;fileName=" + java.net.URLEncoder.encode(file.getName(),"GBK"));// 设置文件名
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
                return 0;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            return -2;
        }
        return -10;
    }

}
