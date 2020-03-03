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

<div class="span10" id="right" style="width: 70%; border: 1px solid #ccc; padding: 20px; margin-left:15%; margin-top:2%;">
    <table class="table table-striped">
        <tbody>
        <tr>
            <td colspan="2">
                编号:${announcement.id}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                标题:<br>
                ${announcement.title}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                内容：<br>
                ${announcement.content}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                备注：<br>
                ${announcement.remark}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                发布人：${announcement.createAdmin.realName}
                &nbsp;&nbsp;&nbsp;&nbsp;
                最后编辑人：${announcement.lastModifyAdmin.realName}
            </td>
        </tr>
        <tr>
            <td colspan="2">
                发布时间:${announcement.createTime}
                &nbsp;&nbsp;&nbsp;&nbsp;
                最后一次编辑时间:${announcement.lastModifyTime}
            </td>
        </tr>
        </tbody>
    </table>
</div>

<!--_footer 作为公共模版分离出去-->
<%@include file="public/_footer.html"%>
<!--/_footer /作为公共模版分离出去-->

</body>
</html>
