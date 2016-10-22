<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Software Testing and Assurance Project - Commission">
<s:set value="#request.get('javax.servlet.forward.context_path')"
	var="path" scope="page" />
<link rel="shortcut icon" href="${path}/img/favicon.png">

<title>Salesman Management</title>

<!-- Bootstrap CSS -->
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="${path}/css/bootstrap-theme.css" rel="stylesheet">
<!-- font icon -->
<link href="${path}/css/elegant-icons-style.css" rel="stylesheet" />
<!-- hint style -->
<link href="${path}/css/jquery.gritter.css" rel="stylesheet">
<!-- Custom styles -->
<link href="${path}/css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
    <script src="${path}/js/html5shiv.js"></script>
    <script src="${path}/js/respond.min.js"></script>
    <script src="${path}/js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>

			<!--logo start-->
			<a href="bossInfoBrief.action" class="logo">Gunsmith <span
				class="lite">Admin</span>
			</a>
			<!--logo end-->

			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">
					<!-- user login dropdown start-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="username">${sessionScope.boss.name}</span>
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<!-- gunsmith只能登出-->
							<!--<li class="eborder-top">-->
							<!--<a href="myProfile.html"><i class="icon_profile"></i> My Profile</a>-->
							<!--</li>-->
							<!--<li>-->
							<!--<a href="resetPassword.html"><i class="icon_key_alt"></i> Reset Password</a>-->
							<!--</li>-->
							<li><a href="login.jsp"><i class="icon_clock_alt"></i>
									Log Out</a></li>
						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin dropdown end-->
			</div>
		</header>
		<!--header end-->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">
					<li class="sub-menu"><a class="" href="bossInfoBrief.action">
							<i class="icon_house_alt"></i> <span>Home</span>
					</a></li>

					<li class="sub-menu"><a class=""
						href="bossCurrentReport.action"> <i class="icon_document_alt"></i>
							<span>Monthly Report</span>
					</a></li>

					<li class="sub-menu"><a class=""
						href="bossHistoryReport.action"> <i class="icon_documents_alt"></i>
							<span>History Report</span>
					</a></li>

					<li class="active"><a class=""
						href="bossManageSalesman.action"> <i class="icon_genius"></i>
							<span>Salesman Manage</span>
					</a></li>
				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="icon_table"></i> SalesmanList
						</h3>
					</div>
				</div>

				<div class="row col-sm-12">
					<button class="btn btn-lg btn-warning pull-right m-b-20"
						data-toggle="modal" data-target="#editUser">Add new
						salesman</button>
				</div>

				<div class="row">
					<div class="col-lg-12">

						<section class="panel">
							<table id="table"
								class="table table-striped table-advance table-hover">
								<thead>
									<tr>
										<th><i class="icon_genius"></i> Num</th>
										<th><i class="icon_profile"></i> Full Name</th>
										<th><i class="icon_document_alt"></i> Linkman</th>
										<th><i class="icon_mail_alt"></i> Email</th>
										<th><i class="icon_mobile"></i> Mobile</th>
										<th><i class="icon_pin_alt"></i> Address</th>
										<th><i class="icon_cogs"></i> Action</th>
									</tr>
								<thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>zz</td>
										<td>zhao</td>
										<td>10000000@hotmail.com</td>
										<td>15000000000</td>
										<td>Chinaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="#" data-toggle="tootip"
													title="Edit" onclick="showEditModal()"> <i
													class="icon_pencil-edit_alt"></i>
												</a> <a class="btn btn-danger" href="#" data-toggle="tootip"
													title="Delete" onclick="removed()"> <i
													class="icon_close_alt"></i>
												</a>
											</div>
										</td>
									</tr>
								</tbody>
								<tfoot class="hidden">
									<tr>
										<td>
											<ul class="pagination" active="active" disabled="disabled">
												<li class="previous"><span aria-hidden="true">Pre</span></li>
												<li class="page"><a></a></li>
												<li class="next"><span aria-hidden="true">Next</span></li>
											</ul>
										</td>
									</tr>
								</tfoot>
							</table>
						</section>

					</div>
				</div>

			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section end -->

	<!-- Edit / Add salesman -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
		id="editUser">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">&times;</button>
					<h4 class="modal-title">Details</h4>
				</div>
				<div class="modal-body">
					<form id="form-user" class="form-horizontal">

						<div class="form-group">
							<label class="control-label col-sm-4">Name</label>

							<div class="col-sm-6">
								<input type="text" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Password</label>

							<div class="col-sm-6">
								<input type="password" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Repassword</label>

							<div class="col-sm-6">
								<input type="password" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Mobile</label>

							<div class="col-sm-6">
								<input type="text" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Email</label>

							<div class="col-sm-6">
								<input type="text" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Linkman</label>

							<div class="col-sm-6">
								<input type="text" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4">Address</label>

							<div class="col-sm-6">
								<input type="text" class="form-control">
							</div>
						</div>

					</form>
				</div>

				<div class="modal-footer">
					<button class="btn btn-primary">Save</button>
					<button class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Delete salesman -->
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-delete-header">
					<i class="icon_error-circle_alt"></i>&nbsp;&nbsp;Pay Attention
				</div>
				<div class="modal-body f-size-24">Are you sure to delete this
					saleman ?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Let
						me think about it</button>
					<a class="btn btn-danger btn-ok">DELETE</a>
				</div>
			</div>
		</div>
	</div>

	<!-- javascripts -->
	<script src="${path}/js/jquery.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
	<!-- nicescroll -->
	<script src="${path}/js/jquery.nicescroll.js" type="text/javascript"></script>
	<!--custome script for all page-->
	<script src="${path}/js/scripts.js"></script>

	<script src="${path}/js/jquery.gritter.min.js"></script>
	<script src="${path}/js/hint.js"></script>
	<script src="${path}/js/Validform_v5.3.2.js"></script>

	<script>
		function showEditModal() {
			$('#editUser').modal('show');
		}
		/**
		 * 删除
		 */
		function removed() {
			$('#confirm-delete').modal('show');
		}
	</script>
	<!--<script>-->

	<!-- -->


	<!--$(function () {-->
	<!--/**-->
	<!--* 名称和路径映射-->
	<!--*/-->
	<!--$.model = "salesman";-->
	<!--$.controller = "subaccount";-->
	<!--$.getPath = $.controller + "/getSubAccount";-->
	<!--$.listPath = $.controller + '/getSubAccountList';-->
	<!--$.addPath = $.controller + '/addSubAccount';-->
	<!--$.deletePath = $.controller + '/deleteSubAccount';-->
	<!--$.updatePath = $.controller + '/updateSubAccount';-->
	<!--/**-->
	<!--* 字段相关-->
	<!--*/-->
	<!--$.fields = ['userID', 'address', 'createTime', 'description', 'email',-->
	<!--'linkman', 'name', 'password', 'phone', 'qq', 'role', 'topUserID',-->
	<!--'trade', 'updateTime', 'username'];-->
	<!--$.fieldRequireds = ['username', 'password', 'name', 'role', 'linkman', 'phone'];-->
	<!--$.namedRequireds = ['账户', '密码', '名称', '角色', '联系人', '手机'];-->
	<!--/**-->
	<!--* 模态框相关-->
	<!--*/-->
	<!--$.modal_add = $("#editUser");-->
	<!--$.modal_edit = $("#editUser");-->
	<!--/**-->
	<!--* 列表相关-->
	<!--*/-->
	<!--$.listbody = $("tbody");-->
	<!--$.itemnode = $.listbody.attr("item") || $.listbody.html();-->
	<!--$.listbody.attr('item', $.itemnode);-->
	<!--$.Tiptype = function (msg, o, cssctl) {-->
	<!--//o.type指示提示的状态，值为1、2、3、4，-->
	<!--//1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态-->
	<!--if (!o.obj.is("form")) {//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;-->
	<!--var form_group = o.obj.closest('.form-group');-->
	<!--var infoObj = form_group.find("label.error");-->
	<!--if (infoObj.size() == 0) {-->
	<!--infoObj = $('<label class="error"></label >');-->
	<!--form_group.append(infoObj);-->
	<!--}-->
	<!--if (o.type == 2 || msg == "") {-->
	<!--form_group.addClass('has-success').removeClass('has-error');-->

	<!--infoObj.fadeOut(200);-->
	<!--} else {-->
	<!--form_group.removeClass('has-success').addClass('has-error');-->

	<!--infoObj.html(msg);-->
	<!--if (infoObj.is(":visible")) {-->
	<!--return;-->
	<!--}-->
	<!--infoObj.show().animate({-->
	<!--top: top - 35-->
	<!--}, 200);-->
	<!--}-->
	<!--}-->
	<!--};-->
	<!--$.Validform = $("#form-user").Validform({-->
	<!--tiptype: function (msg, o, cssctl) {-->
	<!--//o.type指示提示的状态，值为1、2、3、4，-->
	<!--//1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态-->
	<!--if (!o.obj.is("form")) {//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;-->
	<!--var form_group = o.obj.closest('.form-group');-->
	<!--var infoObj = form_group.find("label.error");-->
	<!--if (infoObj.size() == 0) {-->
	<!--infoObj = $('<label class="error"></label >');-->
	<!--form_group.append(infoObj);-->
	<!--}-->
	<!--if (o.type == 2) {-->
	<!--form_group.addClass('has-success').removeClass('has-error');-->

	<!--infoObj.fadeOut(200);-->
	<!--} else {-->
	<!--form_group.removeClass('has-success').addClass('has-error');-->

	<!--infoObj.html(msg);-->
	<!--if (infoObj.is(":visible")) {-->
	<!--return;-->
	<!--}-->
	<!--infoObj.show().animate({-->
	<!--top: top - 35-->
	<!--}, 200);-->
	<!--}-->
	<!--}-->
	<!--//$(element).closest('.form-group').removeClass('has-success').addClass('has-error');-->
	<!--},-->
	<!--beforeSubmit: function (curform) {-->
	<!--//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。-->
	<!--//这里明确return false的话表单将不会提交;-->
	<!--return $.Validform.beforeSubmit(curform);-->
	<!--},-->
	<!--});-->
	<!--$.ValidformPassword = $("#form-password").Validform({-->
	<!--tiptype: function (msg, o) {-->
	<!--//o.type指示提示的状态，值为1、2、3、4，-->
	<!--//1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态-->
	<!--if (o.type == 2) {-->
	<!--hint("S", msg);-->
	<!--} else {-->
	<!--hint("D", msg);-->
	<!--}-->
	<!--},-->
	<!--beforeSubmit: function (curform) {-->
	<!--//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。-->
	<!--//这里明确return false的话表单将不会提交;-->
	<!--return $.ValidformPassword.beforeSubmit(curform);-->
	<!--},-->
	<!--});-->

	<!--/**-->
	<!--* 添加按钮事件绑定-->
	<!--*/-->
	<!--$(".panel-heading>.btn-success").on('click', showAddModal);-->

	<!--query(10,0);-->
	<!--});-->

	<!--// function loading() {-->
	<!--//     $("table").table({state: "loading"});-->
	<!--// }-->
	<!--//-->
	<!--// function notDat() {-->
	<!--//     $("table").table({state: "nodata"});-->
	<!--// }-->

	<!--/**-->
	<!--* 显示添加对话框之前-->
	<!--*/-->
	<!--function preShowAddModal() {-->
	<!--$.modal_add.find("#username").removeAttr("readonly");-->
	<!--$.modal_add.find("#password").removeAttr("ignore").parent().parent().show();-->
	<!--$.modal_add.find("#password-c").removeAttr("ignore").parent().parent().show();-->
	<!--$.modal_add_btnadd.attr("onclick", "$('#form-user').submit()");-->
	<!--$.Validform.beforeSubmit = function (curform) {-->
	<!--add();-->
	<!--return false;-->
	<!--};-->
	<!--}-->
	<!--/**-->
	<!--* 显示编辑对话框之前-->
	<!--*/-->
	<!--function preShowEditModal(Id) {-->
	<!--$.modal_edit.find("#username").attr("readonly", "readonly");-->
	<!--$.modal_edit.find("#password").attr("ignore", "ignore").parent().parent().hide();-->
	<!--$.modal_edit.find("#password-c").attr("ignore", "ignore").parent().parent().hide();-->
	<!--$.modal_edit_btnupdate.attr("onclick", "$('#form-user').submit()");-->
	<!--$.Validform.beforeSubmit = function (curform) {-->
	<!--update(Id);-->
	<!--return false;-->
	<!--};-->
	<!--}-->
	<!--/**-->
	<!--* 点击修改密码-->
	<!--* @param Id-->
	<!--*/-->
	<!--function cpassword(Id) {-->
	<!--$("#editPassword").modal("show");-->
	<!--$("#editPassword").find("input").val("");-->
	<!--$("#editPassword").find(".modal-footer>.btn-primary").attr("onclick", "$('#form-password').submit()");-->
	<!--$.ValidformPassword.beforeSubmit = function (curform) {-->
	<!--$.ajax({-->
	<!--type: "POST",-->
	<!--url: $.updatePath,-->
	<!--dataType: "json",-->
	<!--contentType: "application/json",-->
	<!--data: JSON.stringify({-->
	<!--userID: Id,-->
	<!--password: $("#editPassword").find("#password").val(),-->
	<!--}),-->
	<!--async: false, cache: false,-->
	<!--success: function (data) {-->
	<!--sunncess = data.result;-->
	<!--if (data.status) {-->
	<!--//关闭弹出框-->
	<!--$("#editPassword").modal('hide');-->
	<!--query(10,0);-->
	<!--hint("S", data.result);-->
	<!--} else {-->
	<!--hint("D", data.result);-->
	<!--}-->
	<!--}-->
	<!--});-->
	<!--return false;-->
	<!--};-->
	<!--}-->
	<!--/**-->
	<!--* 检查模态框 $modal 的必须字段-->
	<!--* @param $modal-->
	<!--* @returns-->
	<!--*/-->
	<!--function check($modal) {-->
	<!--var msg = null;-->
	<!--$.each($.fieldRequireds, function (i, field) {-->
	<!--$field = $modal.find("#" + field);-->
	<!--if ($field.val() == null-->
	<!--|| $field.val().length == 0) {-->
	<!--msg = "请完善" + $.namedRequireds[i];-->
	<!--return false;-->
	<!--}-->
	<!--});-->
	<!--return msg;-->
	<!--}-->

	<!--/**-->
	<!--* 清除模态框的 输入内容-->
	<!--* @param $modal-->
	<!--*/-->
	<!--function clearall($modal) {-->
	<!--//	$modal.find("form select").val("");-->
	<!--$modal.find("input").val("");-->
	<!--$modal.find("textarea").val("");-->
	<!--$modal.find("input:checkbox").removeAttr("checked");-->
	<!--}-->
	<!--/**-->
	<!--* 绑定数据data 到模态框 $modal-->
	<!--* @param $modal-->
	<!--* @param data-->
	<!--*/-->
	<!--function binddata($modal, data) {-->
	<!--$.each($.fields, function (i, field) {-->
	<!--$field = $modal.find("#" + field);-->
	<!--if ($field.is('select')) {-->
	<!--$field.val(data[field]);-->
	<!--//			$field.selectpicker('val', ""+data[field]);-->
	<!--} else {-->
	<!--$field.val(data[field]);-->
	<!--}-->
	<!--});-->
	<!--}-->
	<!--/**-->
	<!--* 添加-->
	<!--*/-->
	<!--function add() {-->
	<!--var msg = check($.modal_add);-->
	<!--if (msg) {-->
	<!--hint("D", msg);-->
	<!--return;-->
	<!--}-->
	<!--formSubmit($.addPath);-->
	<!--}-->

	<!--/**-->
	<!--* 查询数据-->
	<!--*/-->
	<!--function query(size,current) {-->
	<!--//	var tip = loadingTip("正在加载...");-->
	<!--// $.listbody.html(loading());-->
	<!--$.listbody.html();-->
	<!--$.ajax({-->
	<!--type: "POST",-->
	<!--url: $.listPath + "/" + size + "/" + current,-->
	<!--dataType: "json",-->
	<!--async: true,-->
	<!--cache: false,-->
	<!--success: function (data) {-->
	<!--//			tip.close();-->
	<!--var obj = data.result;-->
	<!--if (data.status) {-->
	<!--if (obj.totalRecord > 0) {-->
	<!--table(obj.datas);-->
	<!--$("table").table({-->
	<!--state: "data",-->
	<!--pageNum: obj.totalPage,-->
	<!--currentPage: current,-->
	<!--jumpTo: function(currentPage){-->
	<!--query(size,currentPage);-->
	<!--}-->
	<!--});-->
	<!--} else {-->
	<!--$("tbody").html(notDat());-->
	<!--}-->
	<!--} else {-->
	<!--// 没有数据-->
	<!--hint("D", obj);-->
	<!--$("tbody").html(notDat());-->
	<!--}-->
	<!--}-->

	<!--});-->
	<!--}-->

	<!--/**-->
	<!--* 创建表格-->
	<!--* @param data-->
	<!--*/-->
	<!--function table(datas) {-->
	<!--$.listbody.html("");-->
	<!--$.each(datas, function (index, item) {-->
	<!--var titemnode = $.itemnode;-->
	<!--titemnode = titemnode.replace('{index}', '' + (1 + index/* + getStart()*/));-->
	<!--titemnode = titemnode.replace('{edit}', "editor('" + item[$.fields[0]] + "')");-->
	<!--titemnode = titemnode.replace('{remove}', "removed('" + item[$.fields[0]] + "')");-->
	<!--titemnode = titemnode.replace('{password}', "cpassword('" + item[$.fields[0]] + "')");-->
	<!--$.each($.fields, function (i, field) {-->
	<!--titemnode = titemnode.replace('{' + field + '}', function (field) {-->
	<!--return item[field];-->
	<!--}(field) || "");-->
	<!--});-->
	<!--$.listbody.append(titemnode);-->
	<!--});-->
	<!--}-->
	<!--/**-->
	<!--* 删除-->
	<!--*/-->
	<!--function removed(Id) {-->
	<!--//  $('#confirm-delete').modal('show');-->
	<!--confirmDelete("确定删除该" + $.model + "?", "", function (result) {-->
	<!--if (result) {-->
	<!--$.ajax({-->
	<!--type: "POST",-->
	<!--url: $.deletePath + "/" + Id,-->
	<!--dataType: "json",-->
	<!--async: false,-->
	<!--cache: false,-->
	<!--success: function (data) {-->
	<!--if (result = data.status) {-->
	<!--query(10,0);-->
	<!--hint("S", data.result);-->
	<!--} else {-->
	<!--hint("D", data.result);-->
	<!--}-->
	<!--}-->
	<!--});-->
	<!--return result;-->
	<!--} else {-->
	<!--hint("S", '已取消删除');-->
	<!--}-->
	<!--;-->
	<!--});-->
	<!--}-->
	<!--/**-->
	<!--* 显示添加对话框之前-->
	<!--*/-->
	<!--function showAddModal() {-->
	<!--preShowAddModal();-->
	<!--clearall($.modal_add);-->
	<!--$.modal_add_title.html("添加" + $.model);-->
	<!--//	$.modal_add_btnadd.attr("onclick","add(this)");-->
	<!--//	$.modal_add.modal('show');-->
	<!--}-->
	<!--/**-->
	<!--* 显示编辑对话框-->
	<!--*/-->
	<!--function showEditModal(Id) {-->
	<!--preShowEditModal(Id);-->
	<!--$.modal_edit.modal('show');-->
	<!--$.modal_edit_title.html("编辑" + $.model);-->
	<!--//	$.modal_edit_btnupdate.attr("onclick","update('"+Id+"')");-->
	<!--}-->
	<!--/**-->
	<!--* 编辑-->
	<!--* @param Id-->
	<!--*/-->
	<!--function editor(Id) {-->

	<!--showEditModal(Id);-->

	<!--clearall($.modal_edit);-->

	<!--$.ajax({-->
	<!--type: "POST",-->
	<!--url: $.getPath + "/" + Id,-->
	<!--dataType: "json",-->
	<!--async: false,//async: false先执行完ajax，在执行ajax后面的语句，(async: true，分两个线程走，执行ajax的同时，回调去执行后面的语句)-->
	<!--cache: false,//不对结果进行缓存-->
	<!--success: function (data) {-->
	<!--if (data.status) {-->
	<!--binddata($.modal_edit, data.result);-->
	<!--} else {-->
	<!--hint("D", data.result);-->
	<!--}-->
	<!--}-->
	<!--});-->
	<!--}-->
	<!--/**-->
	<!--* 更新节点-->
	<!--*/-->
	<!--function update(Id) {-->
	<!--var msg = check($.modal_edit);-->
	<!--if (msg) {-->
	<!--hint("D", msg);-->
	<!--return;-->
	<!--}-->
	<!--formSubmit($.updatePath, Id);-->
	<!--}-->

	<!--function assembly(Id) {-->
	<!--var model = new Object();-->
	<!--$.each($.fields, function (i, field) {-->
	<!--model[field] = $("#" + field).val();-->
	<!--});-->
	<!--if (Id) {-->
	<!--model[$.fields[0]] = Id;-->
	<!--}-->
	<!--return JSON.stringify(model);-->
	<!--}-->


	<!--/**-->
	<!--* 表单提交-->
	<!--* @param path-->
	<!--* @param Id-->
	<!--*/-->
	<!--function formSubmit(path, Id) {-->
	<!--var sunncess = false;-->
	<!--$.ajax({-->
	<!--type: "POST",-->
	<!--url: path,-->
	<!--dataType: "json",-->
	<!--contentType: "application/json",-->
	<!--data: assembly(Id),-->
	<!--async: false, cache: false,-->
	<!--success: function (data) {-->
	<!--sunncess = data.result;-->
	<!--if (data.status) {-->
	<!--//关闭弹出框-->
	<!--$.modal_edit.modal('hide');-->
	<!--query(10,0);-->
	<!--hint("S", data.result);-->
	<!--} else {-->
	<!--hint("D", data.result);-->
	<!--}-->
	<!--}-->
	<!--});-->
	<!--return sunncess;-->
	<!--}-->

	<!--</script>-->

</body>
</html>
