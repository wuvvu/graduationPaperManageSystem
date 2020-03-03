<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" import="com.bzh.project.model.admin.Admin" %>
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
        tr td label * {
            width: 900px;
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
            <form action="./search_anything_result"	method="get" class="pl-5">
					<div class="input-group input-group-sm">
						<label><input type="text" name="word" id="keyword" class="form-control" placeholder="input something"></label>
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
                    <a href="./modify_admin?id=<%=admin.getId()%>>" class="nav-link"><%=admin.getRealName()%></a>
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
        <div class="">
            <form action="./modify_paper" method="get">
                <label>
                    <span>论文编号</span>
                </label>
                <label>
                    <input type="text" name="id" class="form-control" value="${paper.id}" placeholder="输入编号" />
                </label>
                <input type="submit" class="btn btn-info" value="搜索" />
                <h4 style="color: #bc0000">${message}</h4>
            </form>
            <c:if test="${paperIsExist}">
                <form action="./modify_paper.do" method="post">
                    <table>
                        <input type="hidden" name="id" value="${paper.id}" />
                        <tr>
                            <td>
                                <label>
                                    <span>题目</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="title" value="${paper.title}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>子题目</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="subTitle" value="${paper.subtitle}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>关键字</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="keyword" value="${paper.keyword}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>概述</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <textarea type="text" rows="4" name="overview">${paper.overview}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>要求</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <textarea type="text" rows="2" name="demand">${paper.demand}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>功能模块</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <textarea type="text" rows="2" name="module">${paper.module}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>备注</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <textarea type="text" rows="4" name="remark">${paper.remark}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>出题教师工号</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="teacherId" value="${paper.teacherId}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>选题学生学号</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="studentId" value="${paper.studentId}"/>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>评审等级</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="grade" value="${paper.finalEvaluationResult}"/>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <span>题目审核状态</span>
                                </label>
                            </td>
                            <td>
                                <label>
                                    <input type="text" name="status" value="${paper.status}" readonly="readonly"/>
                                </label>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" class="btn btn-primary" value="确定修改" />
                </form>
                <c:if test="${paperUncheck}">
                    <div style="margin-top: 10px;">
                        <form action="./check_paper" method="post">
                            <input type="hidden" name="id" value="${paper.id}">
                            <input type="submit" class="btn btn-primary" value="审核通过" />
                        </form>
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../bootstrap/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</html>