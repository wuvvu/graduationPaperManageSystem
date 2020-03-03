<%@ page import="com.bzh.project.model.teacher.Teacher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<% request.setCharacterEncoding("utf-8");%>
<%
    Teacher teacher = (Teacher)session.getAttribute("teacher");
%>
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

<div class="span10" style="width:70%;border: solid #ccc 1px;padding:20px;margin-top: 40px;">
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>论文题目</th>
                <th>论文关键字</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${studentAndPapers}" var="sap">
            <tr>
                <td>${sap.studentId}</td>
                <td>${sap.studentRealName}</td>
                <td><a href="./view_paper?studentId=${sap.studentId}">${sap.paperTitle}</a></td>
                <td>${sap.paperKeyword}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
