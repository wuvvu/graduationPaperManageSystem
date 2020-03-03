<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="com.bzh.project.model.admin.Admin" isELIgnored="false" %>
<%request.setCharacterEncoding("utf-8"); %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/fontawesome-free-5.8.2-web/css/all.css">
    <style type="text/css">
        a:hover {
            text-decoration: none;
            cursor: pointer;
        }
        #button {
            width: 200px;
            height: 200px;
            font-size: 24px;
        }
        img {
            width: 450px;
            height: 70px;
        }
        .dropdown-toggle {
            margin: 20px;
        }
        #click {
            width: 200px;
            height: 200px;
            font-size: 24px;
            border-radius: 100px;
        }
        #pagination label {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-dark navbar-expand-md bg-primary" style="padding-top: 0;padding-bottom: 0;">
    <div class="container-fluid">
        <h1>
            <span><img src="../img/main_top_logo.png" alt=""></span>
        </h1>
        <div class="navbar-collapse pl-5">
            <form class="form-search" method="get" action="./search_anything_result">
                <div class="input-group input-group-sm">
                    <label for="keyword"></label><input type="text" name="word" id="keyword" class="form-control">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-info">搜索</button>
                    </div>
                </div>
            </form>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <i class="fas fa-user pt-2 mt-1" style="color: #fff"></i>
                </li>
                <li class="nav-item">
                    <a href="./modify_admin?id=${admin.id}" class="nav-link"><%=admin.getRealName()%></a>
                </li>
                <li class="nav-item">
                    <i class="fas fa-sign-out-alt pt-2 mt-1 ml-2" style="color: #fff"></i>
                </li>
                <li class="nav-item pr-4">
                    <a href="${pageContext.request.contextPath}/logout" class="nav-link">登出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 主体 -->
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-2 page-sidebar">
            <ul class="nav flex-column">
                <li class="nav-item dropdown dropright">
                    <button class="nav-link dropdown-toggle btn btn-outline-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">学生信息管理</button>
                    <div class="dropdown-menu">
                        <a href="./add_student" class="dropdown-item">录入学生信息</a>
                        <a href="./modify_student" class="dropdown-item">编辑学生信息</a>
                        <a href="./list_student_havenot_teacher" class="dropdown-item">未分配老师的学生</a>
                    </div>
                </li>
                <li class="nav-item dropdown dropright">
                    <button class="nav-link dropdown-toggle btn btn-outline-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">教师信息管理</button>
                    <div class="dropdown-menu">
                        <a href="./add_teacher" class="dropdown-item">录入教师信息</a>
                        <a href="./modify_teacher" class="dropdown-item">编辑教师信息</a>
                    </div>
                </li>
                <li class="nav-item dropdown dropright">
                    <button class="nav-link dropdown-toggle btn btn-outline-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">论文题目管理</button>
                    <div class="dropdown-menu">
                        <a href="./add_paper" class="dropdown-item">添加论文题目</a>
                        <a href="./modify_paper" class="dropdown-item">编辑论文题目</a>
                        <a href="./list_unchecked_paper" class="dropdown-item">查看未审核论文题目</a>
                    </div>
                </li>
                <li class="nav-item dropdown dropright">
                    <button class="nav-link dropdown-toggle btn btn-outline-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理员信息管理</button>
                    <div class="dropdown-menu" id="dropdown-menu">
                        <a href="./add_admin" class="dropdown-item">添加管理员</a>
                        <a href="./modify_admin" class="dropdown-item">编辑管理员信息</a>
                        <a href="./list_announcement" class="dropdown-item">公告管理</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="span10" id="right" style="width: 70%; border: 1px solid #ccc; padding: 20px;">
            <div>
                <legend style="border:none;">搜索结果:共有[${pageInfo.total}]条相关记录</legend>
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th style="width:5%;">编号</th>
                            <th style="width:10%;">题目</th>
                            <th style="width:10%;">子题目</th>
                            <th style="width:10%;">概述</th>
                            <th style="width:10%;">关键字</th>
                            <th style="width:20%;">要求</th>
                            <th style="width:15%;">模块</th>
                            <th style="width:10%;">备注</th>
                            <th style="width:10%;">出题老师</th>
                        </tr>
                        </thead>
                    <tbody>

                    <c:forEach items="${uncheckedPapers}" var="uncheckedPaper">
                        <tr>
                            <td>${uncheckedPaper.id}</td>
                            <td>
                                <a href="./modify_paper?id=${uncheckedPaper.id}">
                                    ${uncheckedPaper.title}
                                </a>
                            </td>
                            <td>${uncheckedPaper.subtitle}</td>
                            <td>${uncheckedPaper.overview}</td>
                            <td>${uncheckedPaper.keyword}</td>
                            <td>${uncheckedPaper.demand}</td>
                            <td>${uncheckedPaper.module}</td>
                            <td>${uncheckedPaper.remark}</td>
                            <td>${uncheckedPaper.teacher.realName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination" id="pagination">
                    <span>
                        <label>当前第${pageInfo.pageNum}页，共${pageInfo.pages}页</label>
                        <label><a href="./list_unchecked_paper">首页</a></label>
                        <label><a href="./list_unchecked_paper?pageNum=${pageInfo.hasPreviousPage ? pageInfo.prePage : 1}">上一页</a></label>
                        <label><a href="./list_unchecked_paper?pageNum=${pageInfo.hasNextPage ? pageInfo.nextPage : pageInfo.pages}">下一页</a></label>
                        <label><a href="./list_unchecked_paper?pageNum=${pageInfo.pages}">尾页</a></label>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../bootstrap/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</html>