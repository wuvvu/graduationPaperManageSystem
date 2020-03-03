<%@ page import="com.bzh.project.model.teacher.Teacher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            margin-top: 10px;
            margin-left: 20px;
        }
        tr td {
             /* for IE */
             text-overflow: ellipsis;
             /* for Firefox,mozilla */
             -moz-text-overflow: ellipsis;
             overflow: hidden;
             white-space: nowrap;
             text-align: left;
             max-width:200px;
         }
        #pagination label {
            margin-right: 10px;
            display: inline;
        }
        table {
            table-layout: fixed;
        }
        table td {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
            <span>欢迎<label class="label label-info" style="margin-left: 2px;">${student.realName}</label></span>
            <%
                Teacher teacher = (Teacher)session.getAttribute("teacher");
                if (teacher != null) {
                    out.print("<span>指导老师<label class=\"label label-info\" style=\"margin-left: 2px;\">" + teacher.getRealName() + "</label></span>");
                }
            %>
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

<div class="span10" id="right" style="width: 80%; border: 1px solid #ccc; padding: 20px;">
    <div>
        <legend style="border:none;">搜索结果:共有[${pageInfo.total}]条相关公告</legend>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th style="width:5%;">编号</th>
                    <th style="width:10%;">公告标题</th>
                    <th style="width:30%;">公告内容</th>
                    <th style="width:10%;">备注</th>
                    <th style="width:10%;">发布人</th>
                    <th style="width:10%;">最后一次编辑人</th>
                    <th style="width:12%;">发布时间</th>
                    <th style="width:12%;">最后一次编辑时间</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${announcementSearchResults}" var="announcementSearchResult">
                <tr>
                    <td>${announcementSearchResult.id}</td>
                    <td>
                        <a href="./view_announcement?id=${announcementSearchResult.id}">
                                ${announcementSearchResult.title}
                        </a>
                    </td>
                    <td>${announcementSearchResult.content}</td>
                    <td>${announcementSearchResult.remark}</td>
                    <td>${announcementSearchResult.createAdmin.realName}</td>
                    <td>${announcementSearchResult.lastModifyAdmin.realName}</td>
                    <td>${announcementSearchResult.createTime}</td>
                    <td>${announcementSearchResult.lastModifyTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination" id="pagination">
            <span>
                <label>当前第${pageInfo.pageNum}页，共${pageInfo.pages}页</label>
                <label><a href="./list_announcement">首页</a></label>
                <label><a href="./list_announcement?pageNum=${pageInfo.hasPreviousPage ? pageInfo.prePage : 1}">上一页</a></label>
                <label><a href="./list_announcement?pageNum=${pageInfo.hasNextPage ? pageInfo.nextPage : pageInfo.pages}">下一页</a></label>
                <label><a href="./list_announcement?pageNum=${pageInfo.pages}">尾页</a></label>
            </span>
        </div>
    </div>
</div>
</body>
</html>
