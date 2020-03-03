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

<div class="span12" style="width:70%;margin-top: 40px;">
    <div class="alert alert-info">
<%--        每个老师至少出25个论文题目，您当前已经出了10个题目，--%>
<%--        还需要出15个题目&nbsp;&nbsp;&nbsp;&nbsp;--%>
        <a href="./add_paper.jsp" class="btn btn-primary">立即出题</a>
    </div>
    <div class="thesisTitleDiv">
        <div class="alert alert-info">
            你所出的论文题目<br>
        </div>
        <form action="" method="post">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th style="width:20%;">论文题目</th>
                        <th style="width:25%;">题目概述</th>
                        <th style="width:25%;">要求</th>
                        <th style="width:10%;">状态</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
<%--                        <td><a href="/oes2/teacher/getThesisTitleDetail-391.html">基于WEB的学生实习信息管理系统的设计与实现</a>--%>
<%--                        </td>--%>
<%--                        <td>针对学生毕业前实习工作信息繁杂，可通过此系统的实现使学生实习情况简明系统化，方便各系各专业学生实习情况的统计。</td>--%>
<%--                        <td>前端语言、技术及DBMS均不限</td>--%>
<%--                        <td>--%>
<%--                            <span style="color:blue">该论文题目已审核通过！</span>--%>
<%--                        </td>--%>
<%--                        <td style="text-align:center;">--%>
<%--                            <input type="checkbox" name="del_me" value="391">--%>
<%--                        </td>--%>
                        <!--<td>
                            <span style="color:#66ccff"></span>
                            <a href="#" onclick="doModal(391)" role="button" class="btn" data-toggle="modal">更改</a>
                        </td>-->
                    </tr>
                    <c:forEach items="${papers}" var="paper">
                    <tr>
                        <td>
                            <c:if test="${paper.status != 'checked'}">
                                <a href="./modify_paper?id=${paper.id}">
                            </c:if>
                                ${paper.title}
                            <c:if test="${paper.status != 'checked'}">
                                </a>
                            </c:if>
                        </td>
                        <td>${paper.overview}</td>
                        <td>${paper.demand}</td>
                        <td>${paper.status}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
