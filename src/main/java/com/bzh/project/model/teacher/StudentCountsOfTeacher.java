package com.bzh.project.model.teacher;

public class StudentCountsOfTeacher {

    private Teacher teacher;
    private Integer count;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public StudentCountsOfTeacher(Teacher teacher, Integer count) {
        this.teacher = teacher;
        this.count = count;
    }

    public StudentCountsOfTeacher() {

    }

    @Override
    public String toString() {
        return "StudentCountsOfTeacher{" +
                "teacher=" + teacher +
                ", count=" + count +
                '}';
    }
}
