<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
    String message="";
    if(request.getParameter("state")!=null) {
        String state=request.getParameter("state");
        if(state.equals("userNotExists")) {
            message="用户名不存在";
        }
        else if(state.equals("wrongPassword")) {
            message="密码错误";
        }
        else {
            message="登陆错误";
        }
    }
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8" />
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<div class="form">
    <ul class="tab-group">
        <li class="tab active"><a href="#user">学生</a></li>
        <li class="tab"><a href="#admin">教师</a></li>
    </ul>
    <div class="tab-content">
        <div id="user">
            <h1>学生登录</h1>
            <h4 style="margin-top:-30px;color:#bc0000;"><%=message %></h4>
            <form action="student/main" method="post">
                <div class="field-wrap">
                    <label>
                        学号:<span class="req"></span>
                    </label>
                    <input type="text" name="id" />
                </div>
                <div class="field-wrap">
                    <label>
                        密码:<span class="req"></span>
                    </label>
                    <input type="password" name="password" />
                </div>
                <p class="forgot"><a href="${pageContext.request.contextPath}/admin/login">管理员登录</a></p>
                <input type="hidden" name="userType" value="student" />
                <input class="login_button" type="submit" name="submit" value="登录" />
            </form>
        </div><!--student-->
        <div id="admin">
            <h1>教师登录</h1>
            <form action="teacher/main" method="post">
                <div class="field-wrap">
                    <label>
                        帐号:<span class="req"></span>
                    </label>
                    <input type="text" name="id" />
                </div>
                <div class="field-wrap">
                    <label>
                        密码:<span class="req"></span>
                    </label>
                    <input type="password" name="password" />
                </div>
                <p class="forgot"><a href="${pageContext.request.contextPath}/admin/login">管理员登录</a></p>
                <input type="hidden" name="userType" value="teacher" />
                <input class="login_button" type="submit" name="submit" value="登录" />
            </form><!--teacher-->
        </div><!--teacher-->
    </div><!-- tab-content -->
</div> <!-- /form -->
<script src="../js/jquery.js"></script>
<script src="js/login.js"></script>
</body>
</html>

