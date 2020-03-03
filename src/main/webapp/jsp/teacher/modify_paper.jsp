<%@ page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<% request.setCharacterEncoding("utf-8");%>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8" />
    <title>毕业设计（论文）数字化管理平台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/fontawesome-free-5.8.2-web/css/all.css">
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
        #right label{
            width: 100px;
            display: block;
        }
        #right input{
            height: 30px;
            width: 540px;
        }

        #right textarea{
            height: 60px;
            width: 540px;
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

<div class="span10" id="right">
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
                        <input type="text" class="form-control" name="title" value="${paper.title}" />
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
                        <input type="text" class="form-control" name="subtitle" value="${paper.subtitle}" />
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
                        <input type="text" class="form-control" name="keyword" value="${paper.keyword}" />
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
                        <textarea type="text" class="form-control" rows="4" name="overview">${paper.overview}</textarea>
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
                        <textarea type="text" class="form-control" rows="2" name="demand">${paper.demand}</textarea>
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
                        <input type="text" class="form-control" name="module" value="${paper.module}" />
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
                        <textarea type="text" class="form-control" rows="4" name="remark">${paper.remark}</textarea>
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
                        <input type="text" class="form-control" name="teacherId" value="${paper.teacherId}" readonly/>
                    </label>
                </td>
            </tr>
        </table>
        <input type="submit" class="btn btn-primary" value="确定修改" />
    </form>
</div>
</body>
</html>
