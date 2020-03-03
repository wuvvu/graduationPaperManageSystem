<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="public/_meta.html"%>
<body>
<%@include file="public/_header.jsp"%>
<%@include file="public/_menu.html"%>

<article class="page-container">
	<form action="./teacher-modify.do" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="id" readonly value="${teacher.id}" id="id"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="realName" value="${teacher.realName}" />
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">职称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="jobTitle" value="${teacher.jobTitle}"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">办公电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="officePhone" value="${teacher.officePhone}"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="personalPhone" value="${teacher.personalPhone}"/>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="window.history.back();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	<div class="row cl" style="margin-left: 15%; margin-top: 20px;">
		<form action="./reset_teacher_password.do" method="post">
			<input type="hidden" name="id" value="${teacher.id}" />
			<input type="submit" class="btn btn-warning" value="重置密码" style="color: #ffffff;"/>
		</form>
	</div>
</article>

<%@include file="public/_footer.html"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

</body>
</html>