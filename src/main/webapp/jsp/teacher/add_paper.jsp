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
            <span>欢迎<label class="label label-info" style="margin-left: 2px;">${teacher.realName}</label></span>
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

<div class="span10" style="width:70%;">
    <div class="alert alert-info">
        注意：老师出题之后，在题目还未审核通过前，都可以对自己所出题目进行修改，在题目被审核通过后，则不能修改。
    </div>

    <form method="post" action="./do_add_paper">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td width="50%">题目：
                        <label>
                            <input type="text" name="title" style="width:70%;height:28px;">
                        </label>
                    </td>
                    <td width="50%"> 限选人数：
                        <input type="hidden" name="number" style="width:70%;height:28px;" value="1">1
                    </td>
                </tr>
                <tr>
                    <td width="50%" colspan="2">小标题：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="subtitle"></textarea>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" colspan="2">关键字：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="keyword"></textarea>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td width="90%" colspan="2">题目概述：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="overview"></textarea>
                        </label></td>
                </tr>
                <tr>
                    <td width="50%" colspan="2">要求：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="demand"></textarea>
                        </label></td>
                </tr>
                <tr>
                    <td width="50%" colspan="2">功能模块：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="module"></textarea>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" colspan="2">备注：<br>
                        <label>
                            <textarea rows="4" style="width:90%;" name="remark"></textarea>
                        </label>
                    </td>
                </tr>
                </tbody>
        </table>

        <div class="btn_div">
            <input class="btn btn-large btn-primary" type="submit" value="确定">
        </div>
    </form>
</div>
</body>
</html>
