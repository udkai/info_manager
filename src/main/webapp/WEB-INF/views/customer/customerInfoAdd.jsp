<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${webTitle }-客户信息</title>
    <%@ include file="../common/header.jsp" %>
    <link href="${staticServer }/assets/zTree/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
</head>

<body class="no-skin">
<%@ include file="../common/top.jsp" %>

<div class="main-container" id="main-container">
    <%@ include file="../common/menu.jsp" %>
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
                    <li class="active">客户信息管理</li>
                    <li class="active">客户信息</li>
                </ul>
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        客户信息
                        <small><i class="ace-icon fa fa-angle-double-right"></i> 新增客户信息
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="column">
                    <div class="col-xs-12">
                        <form id="moduleForm" name="moduleForm" class="form-horizontal" action="add.htm" method="post">
                            <input type="hidden" name="backUrl" value="${backUrl }">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-9">
                                    <input id="name" name="name" type="text" class="col-xs-10 col-sm-5" placeholder=""
                                           value="" maxlength="40"> <label id="nameTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系方式：</label>
                                <div class="col-sm-9">
                                    <input id="tel" name="tel" type="text" class="col-xs-10 col-sm-5" placeholder=""
                                           value="" maxlength="40"> <label id="telTip"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">地址：</label>
                                <div class="col-sm-9">
                                    <textarea id="address" name="address" type="text" class="col-xs-10 col-sm-5"
                                              placeholder="" maxlength="400"></textarea>
                                    <label id="addressTip"></label>
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
                    $("#moduleForm").validate({
                        debug: true,
                        errorElement: "label",
                        errorClass: "valiError",
                        errorPlacement: function (error, element) {
                            error.appendTo($("#" + element.attr('id') + "Tip"));
                        },
                        rules: {
                            name: {
                                required: true,
                                maxlength: 40
                            },
                            tel: {
                                required: false,
                                maxlength: 20
                            },
                            address: {
                                required: false,
                                maxlength: 400
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
