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
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>学生管理
		<span class="c-gray en">&gt;</span>学生列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <%--<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                        <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
                    </a>--%>
                    <a class="btn btn-primary radius" data-title="录入教师" href="${pageContext.request.contextPath}/newAdmin/student-add">
						<i class="Hui-iconfont"></i> 录入教师
					</a>
                    <a class="btn btn-primary radius" data-title="自动分配" href="${pageContext.request.contextPath}/newAdmin/student-assign.do">
						<i class="Hui-iconfont"></i> 自动分配
					</a>
                </span>
                <span class="r">共有数据：${students.size()} 条</span>
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
					<thead>
						<tr class="text-c">
							<th>学号</th>
							<th>姓名</th>
							<th>专业</th>
							<th>毕业年份</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${students}" var="student">
						<tr class="text-c">
							<td>${student.id}</td>
							<td>${student.realName}</td>
							<td>${student.subject}</td>
							<td>${student.graduationYear}</td>
							<td class="f-14 td-manage">
								<a style="text-decoration:none" class="ml-5" href="./student-modify?id=${student.id}" title="编辑">
									<i class="Hui-iconfont">&#xe6df;</i>
								</a>
								<a style="text-decoration:none" class="ml-5" href="javascript:;" title="删除">
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
$('.table-sort').dataTable({
	"aaSorting": [[ 0, "aes" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
		    "orderable":false,
            "aTargets":[4] // 不参与排序的列
		}
	]
});

/*资讯-添加*/
function announcement_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}
</script>
</body>
</html>