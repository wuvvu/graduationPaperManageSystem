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
            <span>欢迎
                <label class="label label-info" style="margin-left: 2px;">${student.realName}</label>
            </span>
            <span>指导老师
                <label class="label label-info" style="margin-left: 2px;">${teacher.realName}</label>
            </span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">注销</a>
        </div>
    </div>
</div>

<div class="span2 leftSide" id="left">
    <ul class="nav nav-tabs nav-stacked" style="list-style-type: none">
        <li><a href="${pageContext.request.contextPath}/jsp/student/personal_information.jsp">个人信息</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/query_excellent_papers.jsp">查询优秀论文</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/show_paper">选题管理</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/paper_upload">论文提交</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/paper_evaluation">评审结果</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/student/list_announcement">查看公告</a></li>
    </ul>
</div>

<div class="span10" id="right" style="width:70%; border:1px #dededc solid; padding:20px; text-align:left;">
    <div class="">
        <h4>你已经选择以下题目</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>题目</th>
                    <th>${paper.title}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>题目概述</td>
                    <td>${paper.overview}</td>
                </tr>
                <tr>
                    <td>题目要求</td>
                    <td>${paper.demand}</td>
                </tr>
                <tr>
                    <td>题目的功能模块</td>
                    <td>${paper.module}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td>${paper.remark}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
