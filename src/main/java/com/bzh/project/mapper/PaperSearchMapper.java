package com.bzh.project.mapper;

import com.bzh.project.model.paper.PaperSearchResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PaperSearchMapper {

    @Select("select " +
            "student.id as 'studentId', " +
            "student.realName as 'studentRealName', " +
            "student.subject as 'studentSubject', " +
            "paper.title as 'paperTitle', " +
            "paper.keyword as 'paperKeyword', " +
            "student.graduationYear as 'studentGraduateYear', " +
            "teacher.realName as 'teacherName', " +
            "paper.finalEvaluationResult as 'paperFinalEvaluationResult', " +
            "teacher.jobTitle as 'teacherJobTitle'" +
            "from " +
            "student,teacher,paper " +
            "where " +
            "student.paperId = paper.id and " +
            "student.teacherId = teacher.id and " +
            "paper.finalEvaluationResult = '优秀'")
    List<PaperSearchResult> searchExcellentPapers();

    @Select("select " +
           "student.id as 'studentId', " +
           "student.realName as 'studentRealName', " +
           "student.subject as 'studentSubject', " +
           "paper.title as 'paperTitle', " +
           "paper.keyword as 'paperKeyword', " +
           "student.graduationYear as 'studentGraduateYear', " +
           "teacher.realName as 'teacherName', " +
           "paper.finalEvaluationResult as 'paperFinalEvaluationResult', " +
           "teacher.jobTitle as 'teacherJobTitle'" +
           "from " +
           "student,teacher,paper " +
           "where " +
           "student.paperId = paper.id and " +
           "student.teacherId = teacher.id")
    List<PaperSearchResult> searchAnything();

    @Select("select " +
            "student.id as 'studentId', " +
            "student.realName as 'studentRealName', " +
            "student.subject as 'studentSubject', " +
            "paper.title as 'paperTitle', " +
            "paper.keyword as 'paperKeyword', " +
            "student.graduationYear as 'studentGraduateYear', " +
            "teacher.realName as 'teacherName', " +
            "paper.finalEvaluationResult as 'paperFinalEvaluationResult', " +
            "teacher.jobTitle as 'teacherJobTitle' " +
            "from " +
            "student,teacher,paper " +
            "where " +
            "student.paperId = paper.id and " +
            "student.teacherId = teacher.id and " +
            "paper.finalEvaluationResult = '优秀' and " +
            "(student.graduationYear like concat('%', #{word}, '%') or " +
            "student.id like concat('%', #{word}, '%') or " +
            "paper.title like concat('%', #{word}, '%') or " +
            "paper.keyword like concat('%', #{word},'%') or " +
            "teacher.realName like concat('%', #{word},'%') or " +
            "student.realName like concat('%', #{word},'%'))")
    List<PaperSearchResult> searchExcellentPapersByWord(String word);

    @Select("select " +
            "student.id as 'studentId', " +
            "student.realName as 'studentRealName', " +
            "student.subject as 'studentSubject', " +
            "paper.title as 'paperTitle', " +
            "paper.keyword as 'paperKeyword', " +
            "student.graduationYear as 'studentGraduateYear', " +
            "teacher.realName as 'teacherName', " +
            "paper.finalEvaluationResult as 'paperFinalEvaluationResult', " +
            "teacher.jobTitle as 'teacherJobTitle' " +
            "from " +
            "student,teacher,paper " +
            "where " +
            "student.paperId = paper.id and " +
            "student.teacherId = teacher.id and " +
            "(student.graduationYear like concat('%', #{word}, '%') or " +
            "student.id like concat('%', #{word}, '%') or " +
            "paper.title like concat('%', #{word}, '%') or " +
            "paper.keyword like concat('%', #{word},'%') or " +
            "teacher.realName like concat('%', #{word},'%') or " +
            "student.realName like concat('%', #{word},'%'))")
    List<PaperSearchResult> searchAnythingByWord(String word);

}
