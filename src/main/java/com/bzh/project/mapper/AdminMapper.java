package com.bzh.project.mapper;

import com.bzh.project.model.admin.Admin;
import com.bzh.project.model.admin.Announcement;
import com.bzh.project.model.admin.AnnouncementSearchResult;
import com.bzh.project.model.admin.PaperResult;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.UncheckedPaper;
import com.bzh.project.model.student.Student;
import com.bzh.project.model.teacher.StudentCountsOfTeacher;
import com.bzh.project.model.teacher.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AdminMapper {

    Admin getAdminByUsername(String username);

    List<PaperResult> searchAnything(String word);

    Student getStudentById(String id);

    int setStudentPassword(Student student);

    int addStudent(Student student);

    int modifyStudent(Student student);

    int resetStudentPassword(Student student);

    List<Student> listStudentHavenotTeacher();

    int deleteStudent(Student student);

    Teacher getTeacherById(String id);

    int setTeacherPassword(Teacher teacher);

    int addTeacher(Teacher teacher);

    int modifyTeacher(Teacher teacher);

    int resetTeacherPassword(Teacher teacher);

    int deleteTeacher(Teacher teacher);

    Paper getPaperById(String id);

    int addPaper(Paper paper);

    int modifyPaper(Paper paper);

    List<UncheckedPaper> listUncheckedPaper();

    int checkPaper(String id);

    PaperForView viewPaperByStudentId(String id);

    Admin getAdminById(String id);

    int addAdmin(Admin admin);

    int modifyAdmin(Admin admin);

    List<AnnouncementSearchResult> listAnnouncement(String word);

    int addAnnouncement(Announcement announcement);

    AnnouncementSearchResult getAnnouncementById(String id);

    int updateAnnouncement(Announcement announcement);

    List<Teacher> listTeachersWithoutTenStudents();

    List<StudentCountsOfTeacher> listStudentCountsOfTeachers();

    int setTeachersStudentCounts(@Param("studentCounts") int studentCounts, @Param("id") int teacherId);

    int addStudentFromList(List<Student> students);

    int addTeacherFromList(List<Teacher> teachers);

    List<Student> listStudent();

    List<Teacher> listTeacher();

    List<PaperResult> listPaper();

    List<Admin> listAdmin();

    Paper getPaperByStudentId(String id);

    int deleteAdmin(Admin admin);

    int deleteAnnouncementByCreateAdmin(Admin admin);

    int deleteAnnouncement(Announcement announcement);

    int deletePaper(Paper paper);

    int deletePaperByTeacherId(String id);

}
