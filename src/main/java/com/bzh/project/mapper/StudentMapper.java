package com.bzh.project.mapper;

import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.student.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StudentMapper {

    Student getStudentById(String id);

    Teacher getTeacherByStudentId(String id);

    Paper getPaperByStudentId(String id);

    List<Paper> listUnselectedPaperByTeacherId(String id);

    void studentSelectPaper(@Param("studentId") String studentId, @Param("paperId") String paperId);

    String getFirstFileNameByStudentId(String id);

    String getFinalFileNameByStudentId(String id);

    int uploadFirstFile(@Param("FileName") String FileName, @Param("studentId") String studentId);

    int uploadFinalFile(@Param("FileName") String FileName, @Param("studentId") String studentId);

    String getFirstEvaluationResultByStudentId(String id);

    String getFinalEvaluationResultByStudentId(String id);

}
