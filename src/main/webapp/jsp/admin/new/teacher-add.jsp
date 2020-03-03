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
	<form action="./teacher-add.do" method="post" class="form form-horizontal" id="form-article-add" onsubmit="return checkForm()">
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="id" id="id"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="realName" id="realName"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">职称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="jobTitle" id="jobTitle"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">办公电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="officePhone" id="officePhone"/>
			</div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="personalPhone" id="personalPhone"/>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="window.history.back();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	<div class="row cl" style="margin-left: 15%;">
		<form action="./add_teacher_from_csv" method="post" enctype="multipart/form-data" style="margin-top: 10px;">
			<h3>批量录入教师信息</h3>
			<a class="btn btn-success" href="${pageContext.request.contextPath}/newAdmin/downloadTemplate?type=teacher">下载模版</a>
			<input type="file" name="file" accept="text/csv"/>
			<input type="submit" class="btn btn-primary" value="确定上传" />
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
		var jobTitle = $("#jobTitle");
		var officePhone = $("#officePhone");
		var personalPhone = $("#personalPhone");

		if(id.val() === "" || realName.val() === "" || jobTitle.val() === "" || officePhone.val() === "" || personalPhone.val() === "") {
			layer.open({
				title: '提示信息',
				content: '请完善信息'
			});
			return false;
		}

		if(officePhone.val().length !== 11 || personalPhone.val().length !== 11) {
			layer.open({
				title: '提示信息',
				content: '电话号码为11位'
			});
			return false;
		}
		return true;
	}


	function announcement_submit() {
		$.ajax({
			type: "post",
			url: "/newAdmin/add_announcement.do",
			data: $("#form-article-add").serialize(),
			success: function(data) {
				alert("111111")
				window.location.href('http://localhost:8080/newAdmin/announcement-list');
			}
		})
	}

$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box">' +
					'<span class="progress-bar radius">' +
					'<span class="sr-only" style="width:0"></span>' +
					'</span>' +
					'</div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>