<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${webTitle }-订单信息</title>
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
                        订单信息
                        <small><i class="ace-icon fa fa-angle-double-right"></i> 新增订单信息
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="column">
                    <div class="col-xs-12">
                        <form id="moduleForm" name="moduleForm" class="form-horizontal" action="add.htm" method="post">
                            <input type="hidden" name="backUrl" value="${backUrl }">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订单内容：</label>
                                <div class="col-sm-9">
                                    <input id="order_name" name="order_name" type="text" class="col-xs-10 col-sm-5"
                                           placeholder=""
                                           value="" maxlength="40"> <label id="order_nameTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订单金额：</label>
                                <div class="col-sm-9">
                                    <input id="amount" name="amount" type="text" class="col-xs-10 col-sm-5"
                                           placeholder=""
                                           value="" maxlength="40"> <label id="amountTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订单时间：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="order_time" class="col-xs-10 col-sm-5"
                                           placeholder=""><label id="order_timeTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订单状态：</label>
                                <div class="col-sm-9">
                                    <select id="status" class="col-xs-10 col-sm-5">
                                        <option value="0">进行中</option>
                                        <option value="1">已结案</option>
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
        </div>
    </div>
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
