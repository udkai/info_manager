<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${webTitle }-订单信息管理</title>
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
                <!-- /.breadcrumb -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box widget-color-blue">
                            <!-- #section:custom/widget-box.options -->
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 操作面板
                                </h5>
                            </div>

                            <!-- /section:custom/widget-box.options -->
                            <div class="widget-body">
                                <div class="widget-main">
                                    <table class="searchField" style="margin: 4px; padding: 4px;">
                                        <tr>
                                            <td>订单内容：</td>
                                            <td><input type="text" id="order_name" class="form-control "
                                                       placeholder=""
                                                       value="${orderInfoSearchVO.order_name }"></td>
                                            <td>订单时间：</td>
                                            <td><input type="text" id="order_time_start" class="form-control "
                                                       placeholder=""
                                                       value="${orderInfoSearchVO.order_time_start }"></td>
                                            <td>至</td>
                                            <td><input type="text" id="order_time_end" class="form-control "
                                                       placeholder=""
                                                       value="${orderInfoSearchVO.order_time_end }">

                                            <td>订单状态：</td>
                                            <td>
                                                <select id="status" value="${orderInfoSearchVO.status}">
                                                    <option value=" ">全部</option>
                                                    <option value="0"<c:if test="${orderInfoSearchVO.status=='0'}">selected</c:if>>进行中</option>
                                                    <option value="1" <c:if test="${orderInfoSearchVO.status=='1'}">selected</c:if>>已结案</option>
                                                </select>

                                            </td>
                                            <td>
                                            <button class="btn btn-primary btn-sm" id="btnSearch">
                                                <i class="ace-icon fa fa-search"></i> 查询
                                            </button>

                                                <button type="button" class="btn btn-success btn-sm" id="btnAdd">
                                                    <i class="ace-icon fa fa-plus bigger-110"></i>新增
                                                </button>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="treeTable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width=60>序号</th>
                                <th width=80>订单内容</th>
                                <th width=180>金额</th>
                                <th width=180>订单时间</th>
                                <th width=180>订单状态</th>
                                <th width="241">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderInfoList }" var="order" varStatus="st">
                                <tr>
                                    <td width=40>${st.index+1}</td>
                                    <td>${order.order_name}</td>
                                    <td>${order.amount}</td>
                                    <td>${order.order_time}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.order_time}==0">进行中</c:when>
                                            <c:otherwise>已结案</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="toUpdate.htm?id=${order.id}&backUrl=${backUrl}"> 修改</i>
                                        </a>

                                        <a href="javascript:delModule(${order.id });"> 删除 </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.span -->
                </div>

                <div class="row">
                    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
                </div>
            </div>
            <!-- /.main-content -->


        <!-- /.main-container -->

        <%@ include file="../common/js.jsp" %>

        <script type="text/javascript">
            $(function () {

                $('#order_time_start').datetimepicker({
                    lang: 'ch',
                    timepicker: false,
                    format: 'Y-m-d',
                    formatDate: 'Y-m-d'
                });
                $('#order_time_end').datetimepicker({
                    lang: 'ch',
                    timepicker: false,
                    format: 'Y-m-d',
                    formatDate: 'Y-m-d'
                });
                $("#btnSearch").bind('click', searchModule);
                $("#btnAdd").bind('click', addUser);
            })

            // 查询方法
            var searchModule = function () {
                var url = "index.htm?___=_";

                if ($("#order_name").val() != '')
                    url += "&order_name=" + $("#order_name").val();
                if ($("#order_time_start").val() != '')
                    url += "&order_time_start=" + $("#order_time_start").val();
                if ($("#order_time_end").val() != '')
                    url += "&order_time_end=" + $("#order_time_end").val();
                if ($("#status").val() != '')
                    url += "&status=" + $("#status").val();

                window.location = encodeURI(url);
            }
            // 删除
            var delModule = function (id) {
                bootbox.confirm("<h4 class='red'>你确定要删除该用户吗？</h4>", function (result) {
                    if (result) {
                        window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                    }
                })
            }
            //新增
            var addUser = function (id) {
                window.location = 'toAdd.htm?backUrl=${backUrl }';
            }
        </script>
</body>
</html>
