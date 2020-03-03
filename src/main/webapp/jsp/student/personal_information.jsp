<%@ page import="com.bzh.project.model.teacher.Teacher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<% request.setCharacterEncoding("utf-8");%>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8" />
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
            <span>欢迎<label class="label label-info" style="margin-left: 2px;">${student.realName}</label></span>
            <%
                Teacher teacher = (Teacher)session.getAttribute("teacher");
                if (teacher != null) {
                    out.print("<span>指导老师<label class=\"label label-info\" style=\"margin-left: 2px;\">" + teacher.getRealName() + "</label></span>");
                }
            %>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">注销</a>
        </div>
    </div>
</div>

<div class="span2 leftSide" id="left">
    <ul class="nav nav-tabs nav-stacked" style="list-style-type: none">
        <li><a href="${pageContext.request.contextPath}/jsp/student/personal_information.jsp">个人信息</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/query_excellent_papers.jsp">查询优秀论文</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/show_paper">选题管理</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/paper_upload">论文提交</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/paper_evaluation">评审结果</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/list_announcement">查看公告</a></li>
    </ul>
</div>

<div class="span10" id="right" style="width: 60%; border: 1px solid #ccc; padding: 20px;">
    <a class="btn btn-primary" href="./change_password">修改密码</a>
    <table class="table table-hover table-striped">
        <tr>
            <td>学号</td>
            <td>${student.id}</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>${student.realName}</td>
        </tr>
        <tr>
            <td>专业</td>
            <td>${student.subject}</td>
        </tr>
        <tr>
            <td>指导老师</td>
            <td>${teacher.realName}</td>
        </tr>
        <tr>
            <td>指导老师职称</td>
            <td>${teacher.jobTitle}</td>
        </tr>
        <tr>
            <td>毕业年份</td>
            <td>${student.graduationYear}</td>
        </tr>
        <tr>
            <td>已选论文题目</td>
            <td>${paper.title}</td>
        </tr>
        <tr>
            <td>论文关键字</td>
            <td>${paper.keyword}</td>
        </tr>
        <tr>
            <td>评审等级</td>
            <td>${paper.finalEvaluationResult}</td>
        </tr>
    </table>
</div>
</body>
</html>
