<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>${webTitle }-客户信息管理</title>
	<%@ include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css"
		  href="${staticServer }/assets/datetimepicker/jquery.datetimepicker.css?version=${versionNo}"/>
</head>

<body class="no-skin">
<%@ include file="../common/top.jsp" %>
<script src="${staticServer }/assets/datetimepicker/jquery.datetimepicker.js" type="text/javascript"></script>
<div class="main-container" id="main-container">
	<%@ include file="../common/menu.jsp" %>
	<div class="main-content">
		<div class="main-content-inner">
			<!-- #section:basics/content.breadcrumbs -->
			<div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
					<li class="active">订单信息管理</li>
					<li class="active">订单信息</li>
				</ul>
			</div>

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<div class="page-header">
					<h1>
						客户信息
						<small><i class="ace-icon fa fa-angle-double-right"></i> 修改订单信息
						</small>
					</h1>
				</div>
				<!-- /.page-header -->

				<div class="column">
					<div class="col-xs-12">
						<form id="moduleForm" name="moduleForm" class="form-horizontal" action="update.htm"
							  method="post">
							<input type="hidden" name="backUrl" value="${backUrl }">
							<input type="hidden" name="id" value="${orderInfo.id }">
							<div class="form-group">
								<label class="col-sm-3 control-label">订单id：</label>
								<div class="col-sm-9">
									<input id="id" type="text" class="col-xs-10 col-sm-5" placeholder=""
										   value="${orderInfo.id}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">订单内容：</label>
								<div class="col-sm-9">
									<input id="order_name" name="order_name" type="text" class="col-xs-10 col-sm-5" placeholder=""
										   value="${orderInfo.order_name}"
										   maxlength="20"> <label id="nameTip"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">订单金额：</label>
								<div class="col-sm-9">
									<input type="text" id="amount" class=" col-xs-10 col-sm-5"
										   placeholder="" value="${orderInfo.amount}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">订单时间：</label>
								<div class="col-sm-9">
									<input id="order_time" name="order_time" type="text" class="col-xs-10 col-sm-5" placeholder=""
										   value="${orderInfo.order_time}"
										   maxlength="20"> <label id="telTip"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">订单状态：</label>
								<div class="col-sm-9">
									<select>
										<option value="1" <c:if test="${orderInfoSearchVO.status=='0'}">selected</c:if>>进行中</option>
										<option value="2" <c:if test="${orderInfoSearchVO.status=='1'}">selected</c:if>>已结案</option>
									</select>
								</div>
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<button class="btn btn-primary" type="submit">
										<i class="ace-icon fa fa-save bigger-110"></i> 保存
									</button>
									<button class="btn" type="button" onclick="history.back(-1)">
										<i class="ace-icon fa fa-undo bigger-110"></i> 取消
									</button>
								</div>
							</div>
						</form>

					</div>
				</div>
				<!-- /.main-content -->
			</div>

			<!-- /.main-container -->
			<%@ include file="../common/js.jsp" %>

			<script type="text/javascript">
                $(document).ready(function () {
                    $('#order_time').datetimepicker({
                        lang: 'ch',
                        timepicker: false,
                        format: 'Y-m-d',
                        formatDate: 'Y-m-d'
                    });
                    $("#moduleForm").validate({
                        debug: true,
                        errorElement: "label",
                        errorClass: "valiError",
                        errorPlacement: function (error, element) {
                            error.appendTo($("#" + element.attr('id') + "Tip"));
                        },
                        rules: {
                            order_name: {
                                required: true,
                                maxlength: 40
                            },
                            amount: {
                                number:true,
                                maxlength: 20
                            },
                            order_time: {
                                date:true

                            }
                        },
                        messages: {},
                        submitHandler: function (form) {
                            form.submit();
                        }
                    });
                });
			</script>
</body>
</html>
