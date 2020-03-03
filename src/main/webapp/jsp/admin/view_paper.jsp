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
            <span><img style="width: 450px; height: 70px; " src="../img/main_top_logo.png" alt=""></span>
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
                    <tr>
                        <td>论文等级</td>
                        <td>${paperView.paperFinalEvaluationResult}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="float:left;width:15%;margin:20px;">
                <table>
                    <tbody>
                    <tr>
                        <th>
                            <a href="https://wuvvu.cn:8443/2333/aaa.pdf" target="_blank">
                                <img src="../../img/download.jpg" alt="点击下载完整论文" />
                            </a>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <a href="https://wuvvu.cn:8443/2333/aaa.pdf" target="_blank">点击下载完整论文</a>
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style=" width: 100%; margin-top: 20px; float: left; ">
                <h4>论文摘要</h4>
                <object type="application/pdf" style="margin:5px auto; width:900px; height:1000px; display:block;"
                        data="https://wuvvu.cn:8443/2333/aaa.pdf">
                </object>
            </div>

        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../bootstrap/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</html>