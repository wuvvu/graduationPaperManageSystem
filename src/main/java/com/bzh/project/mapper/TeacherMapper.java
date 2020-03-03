package com.bzh.project.mapper;

import com.bzh.project.model.teacher.Teacher;
import com.bzh.project.model.paper.Paper;
import com.bzh.project.model.paper.PaperForView;
import com.bzh.project.model.paper.PaperSearchResult;
import com.bzh.project.model.student.StudentAndPaper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TeacherMapper {

    Teacher getTeacherById(String id);

    List<StudentAndPaper> listStudentByTeacherId(String id);

    List<Paper> listPaperByTeacherId(String id);

    int addPaper(Paper paper);

    PaperForView viewPaperByStudentId(String id);

    List<PaperSearchResult> listUnevaluatedPaper(String id);

    int updateFirstEvaluation(@Param("evaluation") String evaluation, @Param("paperId") String paperId);

    int updateFinalEvaluation(@Param("evaluation") String evaluation, @Param("paperId") String paperId);

    String getFirstFileNameByPaperId(String id);

    String getFinalFileNameByPaperId(String id);
}
