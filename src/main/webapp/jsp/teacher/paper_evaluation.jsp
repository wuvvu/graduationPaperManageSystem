<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bzh.project.model.teacher.Teacher" %>
<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<% request.setCharacterEncoding("utf-8");%>
<%
    Teacher teacher = (Teacher)session.getAttribute("teacher");
%>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8"/>
    <title>毕业设计（论文）数字化管理平台</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <style type="text/css">
        * {
            margin: 0;
        }

        #top {
            width: 100%;
            height: 115px;
            background-color: #008ae5;
        }

        #top_logo {
            padding-top: 10px;
            margin-left: 100px;
            width: 640px;
        }

        #top_logo img {
            height: auto;
            max-width: 100%;
            vertical-align: middle;
        }

        #top_information {
            height: 32px;
            width: 100%;
            background-color: #f5f5f5

        }

        #top_information div {
            float: right;
            margin-top: 1px;
            margin-right: 100px;
        }

        #left {
            margin-top: 40px;
            margin-left: 30px;
            height: 900px;
            width: 120px;
        }

        #right {
            margin-top: 40px;
            margin-left: 100px;

        }
    </style>
</head>
<body>

<div id="top">
    <div id="top_logo">
        <img src="../../img/main_top_logo.png" alt="毕业设计（论文）数字化管理平台"/>
    </div>
    <div id="top_information">
        <div>
            <span>欢迎<label class="label label-info" style="margin-left: 2px;"><%= teacher.getRealName()%></label></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">注销</a>
        </div>
    </div>
</div>

<div class="span2 leftSide" id="left">
    <ul class="nav nav-tabs nav-stacked" style="list-style-type: none">
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/query_anything.jsp">查询页面</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/query_excellent_papers.jsp">查询优秀论文</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/student_manage">学生管理</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/personal_information.jsp">个人信息</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/paper_manage">题目管理</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/list_announcement">查看公告</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/list_unevaluated_paper">论文评阅</a></li>
    </ul>
</div>

<div class="span12" style="width:70%; padding:20px; border:1px solid #ccc; margin-top: 40px; ">
    <div style="float:left;width:75%; margin-right:20px;">
        <table class="table">
            <thead>
                <tr>
                    <th>论文题目：${paperView.paperTitle}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>学生学号</td>
                    <td>${paperView.studentId}</td>
                </tr>
                <tr>
                    <td>学生姓名</td>
                    <td>${paperView.studentRealName}</td>
                </tr>
                <tr>
                    <td>学生毕业年份</td>
                    <td>${paperView.studentGraduationYear}</td>
                </tr>
                <tr>
                    <td>指导老师</td>
                    <td>${paperView.teacherRealName}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <c:choose>
        <c:when  test="${fileName == null || fileName.equals(\"\")}">
            <div class="alert alert-info">
                还未上传论文，请学生上传论文再进行评阅
            </div>
        </c:when>
        <c:otherwise>
            <div style="float:left;width:15%;margin:20px;">
                <table>
                    <tbody>
                    <tr>
                        <th>
                            <a href="${pageContext.request.contextPath}/paper/download?fileName=${fileName}" target="_blank">点击下载完整论文</a>
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <div class="span12" style="width:70%; margin-top: 10px; ">
                    <form action="./paper_evaluation.do" method="post">
                        <input type="hidden" name="paperId" value="${paperView.paperId}" />
                        <input type="hidden" name="time" value="first" />
                        <h4>初审</h4>
                        <label>
                            <textarea type="text" rows="6" name="evaluation" style="width: 100%;" <c:if test="${firstIsEvaluated}">readonly</c:if>>${paperView.paperFirstEvaluationResult}</textarea>
                        </label>
                        <span>
                        <c:if test="${!firstIsEvaluated}">
                            <input class="btn btn-primary" type="submit" value="初审提交" />
                        </c:if>
                        </span>
                    </form>
                </div>
                <c:if test="${firstIsEvaluated}">
                    <form action="./paper_evaluation.do" method="post">
                        <input type="hidden" name="paperId" value="${paperView.paperId}">
                        <input type="hidden" name="time" value="final" />
                        <div class="span12" style="width:70%; margin-top: 10px; ">
                            <h4>终审</h4>
                            <span>
                                <input type="radio" name="evaluation" value="优秀"> 优
                                <input type="radio" name="evaluation" value="良"> 良
                                <input type="radio" name="evaluation" value="差"> 差
                            </span>
                            <c:if test="${!finalIsEvaluated}">
                            <span>
                                <input class="btn btn-primary" type="submit" value="终审提交" />
                            </span>
                            </c:if>
                        </div>
                    </form>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
