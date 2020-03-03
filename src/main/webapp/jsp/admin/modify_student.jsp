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
            <form action="./search_anything.do"	method="post" class="pl-5">
                <div class="input-group input-group-sm">
                    <label for="keyword"></label><input type="text" name="keyword" id="keyword" class="form-control">
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
        <div class="">
            <form action="./modify_student" method="get">
                <label>
                    <span>学号</span>
                </label>
                <label>
                    <input type="text" name="id" class="form-control" value="${student.id}" placeholder="输入学号" />
                </label>
                <input type="submit" class="btn btn-info" value="搜索" />
            </form>
            <form action="./reset_student_password.do" method="post">
                <input type="hidden" name="id" value="${student.id}" />
                <input type="submit" class="btn btn-warning" value="重置密码" style="color: #ffffff;"/>
            </form>
            <form action="./modify_student.do" method="post">
                <input type="hidden" name="id" value="${student.id}">
                <table>
                    <tr>
                        <td>
                            <label>
                                <span>姓名</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="text" name="realName"  class="form-control"  value="${student.realName}"/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <span>专业</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="text" name="subject"  class="form-control"  value="${student.subject}"/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <span>毕业年份</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="text" name="graduationYear" class="form-control"  value="${student.graduationYear}"/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <span>指导老师工号</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="text" name="teacherId"  class="form-control" value="${student.teacherId}" readonly/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <span>论文题目编号</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="text" name="paperId" class="form-control"  value="${student.paperId}" readonly/>
                            </label>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="btn btn-primary" value="确定修改" />
            </form>
            <form action="./delete_student" method="post" style="margin-top: 10px;">
                <input type="hidden" name="id" value="${student.id}">
                <input type="submit" class="btn btn-danger" value="删除学生" />
            </form>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../bootstrap/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</html>
