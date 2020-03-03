<%@ page import="com.bzh.project.model.teacher.Teacher" %>
<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        #pagination label {
            margin-right: 10px;
            display: inline;
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

<div class="span10" id="right" style="width: 70%; border: 1px solid #ccc; padding: 20px;">
    <form class="form-search" method="get" action="./query_excellent_papers_result">
        <div class="container-fluid" style="margin-top:1em;">
            <div class="row-fluid">
                <div class="span11" style="margin-left: 20%; /*ie7 hack*/+margin-left: 10%;/*ie6 hack*/_margin-left: 10%;">
                    <input type="text" placeholder="请输入要搜索的内容" style="width:50%; height: 30px;" id="thesisInfo" name="word" value="" autocomplete="off">
                    <button type="submit" class="btn btn-primary">查询优秀论文</button>
                </div>
            </div>
        </div>
    </form>
    <div>
        <legend style="border:none;">搜索结果:共有[${pageInfo.total}]条相关记录</legend>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th style="width:10%;">学号</th>
                    <th style="width:10%;">学生姓名</th>
                    <th style="width:10%;">专业方向</th>
                    <th style="width:22%;">论文题目</th>
                    <th style="width:20%;">论文关键字</th>
                    <th style="width:8%;">毕业年份</th>
                    <th style="width:10%;">指导老师</th>
                    <th style="width:10%;">等级</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${paperSearchResults}" var="paperSearchResult">
                <tr>
                    <td>${paperSearchResult.studentId}</td>
                    <td>${paperSearchResult.studentRealName}</td>
                    <td>${paperSearchResult.studentSubject}</td>
                    <td><a href="./view_paper?studentId=${paperSearchResult.studentId}">${paperSearchResult.paperTitle}</a></td>
                    <td>${paperSearchResult.paperKeyword}</td>
                    <td>${paperSearchResult.studentGraduateYear}</td>
                    <td>${paperSearchResult.teacherName}</td>
                    <td>${paperSearchResult.paperFinalEvaluationResult}</td>
                </tr>
                </c:forEach>

            </tbody>
        </table>
        <div class="pagination" id="pagination">
            <span>
                <label>当前第${pageInfo.pageNum}页，共${pageInfo.pages}页</label>
                <label><a href="./query_excellent_papers_result?word=${pageContext.request.getParameter("word")}">首页</a></label>
                <label><a href="./query_excellent_papers_result?word=${pageContext.request.getParameter("word")}&pageNum=${pageInfo.hasPreviousPage ? pageInfo.prePage : 1}">上一页</a></label>
                <label><a href="./query_excellent_papers_result?word=${pageContext.request.getParameter("word")}&pageNum=${pageInfo.hasNextPage ? pageInfo.nextPage : pageInfo.pages}">下一页</a></label>
                <label><a href="./query_excellent_papers_result?word=${pageContext.request.getParameter("word")}&pageNum=${pageInfo.pages}">尾页</a></label>
            </span>
        </div>
    </div>
</div>
</body>
</html>
