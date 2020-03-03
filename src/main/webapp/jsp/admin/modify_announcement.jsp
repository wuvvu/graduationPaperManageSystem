<%@ page import="com.bzh.project.model.admin.Admin" %>
<%@ page contentType="text/html; charset=utf-8"%>
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
            <form method="post" action="./modify_announcement.do">
                <input type="hidden" name="id" value="${announcement.id}" />
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td colspan="2">标题:<br>
                                <label style="width: 900px;">
                                    <input type="text" style="width:100%;" name="title" value="${announcement.title}"/>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">内容：<br>
                                <label style="width: 900px;">
                                    <textarea rows="8" style="width:100%;" name="content">${announcement.content}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">备注：<br>
                                <label style="width: 900px;">
                                    <textarea rows="4" style="width:100%;" name="remark">${announcement.remark}</textarea>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                编号:${announcement.id}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                发布人:${announcement.createAdmin.realName}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                发布时间:${announcement.createTime}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                最后一次编辑人:${announcement.lastModifyAdmin.realName}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                最后一次编辑时间:${announcement.lastModifyTime}
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_div">
                    <input class="btn btn-large btn-primary" type="submit" value="确定修改">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../bootstrap/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</html>