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

<article class="page-container">
	<form action="./student-modify.do" class="form form-horizontal" id="form-article-add" onsubmit="return checkForm()">
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">学号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="id" value="${student.id}" id="id"/>
				<input type="hidden" name="password" value="${student.password}" />
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="realName" value="${student.realName}" id="realName"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="subject" value="${student.subject}" id="subject"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">毕业年份：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="graduationYear" value="${student.graduationYear}" id="graduationYear"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">指导老师工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="teacherId" value="${student.teacherId}" />
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">毕业论文编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="paperId" value="${student.paperId}" />
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 确认修改</button>
				<button onClick="window.history.back();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	<div class="row cl" style="margin-left: 15%; margin-top: 20px;">
		<form action="./reset_student_password.do" method="post">
			<input type="hidden" name="id" value="${student.id}" />
			<input type="submit" class="btn btn-warning" value="重置密码" style="color: #ffffff;"/>
		</form>
	</div>
</article>

<!--_footer 作为公共模版分离出去-->
<%@include file="public/_footer.html"%>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/admin/new/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	function checkForm() {
		var id = $("#id");
		var realName = $("#realName");
		var subject = $("#subject");
		var graduationYear = $("#graduationYear");


		if(id.val() === "" || realName.val() === "" || subject.val() === "" || graduationYear.val() === "") {
			layer.open({
				title: '提示信息',
				content: '请完善信息'
			});
			return false;
		}

		if(id.val().length !== 10) {
			layer.open({
				title: '提示信息',
				content: '学号长度为10'
			});
			return false;
		}
		return true;
	}

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>