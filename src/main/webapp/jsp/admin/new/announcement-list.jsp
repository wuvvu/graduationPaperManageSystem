<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="public/_meta.html"%>
<body>
<!--_header 作为公共模版分离出去-->
<%@include file="public/_header.jsp"%>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<%@include file="public/_menu.html"%>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        公告管理
        <span class="c-gray en">&gt;</span>
        公告列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a class="btn btn-primary radius" data-title="发布公告" href="${pageContext.request.contextPath}/newAdmin/announcement-add">
						<i class="Hui-iconfont"></i> 发布公告
					</a>
                </span>
                <span class="r">共有数据：${announcementSearchResults.size()} 条</span>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
                    <thead>
                        <tr class="text-c">
                            <th>ID</th>
                            <th>标题</th>
                            <th>内容</th>
                            <th>备注</th>
                            <th>发布人</th>
                            <th>最后编辑人</th>
                            <th>发布时间</th>
                            <th>最后编辑时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${announcementSearchResults}" var="announcementSearchResult">
                        <tr class="text-c">
                            <td>${announcementSearchResult.id}</td>
                            <td>
                                <a href="./view-announcement?id=${announcementSearchResult.id}">
                                        ${announcementSearchResult.title}
                                </a>
                            </td>
                            <td>${announcementSearchResult.content}</td>
                            <td>${announcementSearchResult.remark}</td>
                            <td>${announcementSearchResult.createAdmin.realName}</td>
                            <td>${announcementSearchResult.lastModifyAdmin.realName}</td>
                            <td>${announcementSearchResult.createTime}</td>
                            <td>${announcementSearchResult.lastModifyTime}</td>
                            <td class="f-14 td-manage">
                                <a style="text-decoration:none" class="ml-5" href="./announcement-modify?id=${announcementSearchResult.id}" title="编辑">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a style="text-decoration:none" class="ml-5" href="javascript:" onclick="deleteAnnouncement(${announcementSearchResult.id})" title="删除">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<%@include file="public/_footer.html"%>
<!--/_footer /作为公共模版分离出去-->

<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    function deleteAnnouncement(id) {
        layer.confirm(
            '确认删除该公告?',
            {
                icon: 2,
                title:'提示'
            },
            function(index){
                $.ajax({
                    type: "POST",
                    url: "/admin/delete_announcement",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        location.reload();
                    }
                });
                layer.close(index);
            }
        );
    }

    $('.table-sort').dataTable({
        "aaSorting": [[ 0, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {
                "orderable":false,
                "aTargets":[8] // 不参与排序的列
            }
        ]
    });

</script>
</body>
</html>