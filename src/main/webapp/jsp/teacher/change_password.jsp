<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<% request.setCharacterEncoding("utf-8");%>
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
        <li><a href="${pageContext.request.contextPath}/jsp/teacher/list_unevaluated_paper">论文评阅</a></li>
    </ul>
</div>

<div class="span10" id="right" style="width: 60%; border: 1px solid #ccc; padding: 20px;">
    <form action="./change_password" method="post">
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">原密码</label>
                <div class="controls">
                    <input type="password" name="oldPassword" id="oldPassword" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">新密码</label>
                <div class="controls">
                    <input type="password" name="newPassword" id="newPassword" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">确认密码</label>
                <div class="controls">
                    <input type="password" name="confirmPassword" id="confirmPassword" />
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label id="message" class="message" style="color: #ff250f">
                        ${message}
                    </label>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input id="update" type="button" onclick="checkPassword()" class="btn btn-primary" value="更改" style="height: 30px;" />
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
    function checkPassword() {
        var oldPassword = $("input[name='oldPassword']").val();
        var newPassword = $("input[name='newPassword']").val();
        var confirmPassword = $("input[name='confirmPassword']").val();
        if(oldPassword === "" || newPassword === "" || confirmPassword === "") {
            $("#message").html("密码不能为空");
            return false;
        }
        if(oldPassword === newPassword) {
            $("#message").html("新密码与原密码一样");
            return false;
        }
        if(newPassword !== confirmPassword) {
            $("#message").html("新密码与确认密码不一样");
            return false;
        }
        $("form").submit();
        return true;
    }
</script>
</html>
