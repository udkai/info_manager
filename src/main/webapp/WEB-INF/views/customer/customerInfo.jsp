<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${webTitle }-客户信息管理</title>
    <%@ include file="../common/header.jsp"%>
</head>

<body class="no-skin">
<%@ include file="../common/top.jsp"%>
<div class="main-container" id="main-container">
    <%@ include file="../common/menu.jsp"%>
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
                    <li class="active">客户信息管理</li>
                    <li class="active">客户信息</li>
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
                                            <td>姓名：</td>
                                            <td><input type="text" id="txtName" class="form-control input-small"
                                                       placeholder=""
                                                       value="${customerInfoSearchVO.name }"></td>
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
                                <th width=80>姓名</th>
                                <th width=180>联系方式</th>
                                <th width=180>地址</th>
                                <th width="241">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customerInfoList }" var="customer" varStatus="st">
                                <tr>
                                    <td width=40>${st.index+1}</td>
                                    <td>${customer.name}</td>
                                    <td>${customer.tel}</td>
                                    <td>${customer.address}</td>
                                    <td>
                                        <a href="toUpdate.htm?id=${customer.id}&backUrl=${backUrl}"> 修改</i>
                                        </a>

                                        <a href="javascript:delModule(${customer.id });"> 删除 </a>
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
        </div>
        <!-- /.main-container -->
        <%@ include file="../common/js.jsp"%>

        <script type="text/javascript">
            $(function() {
                $("#btnSearch").bind('click', searchModule);
                $("#btnAdd").bind('click', addUser);
            })

            // 查询方法
            var searchModule = function() {
                var url = "index.htm?___=_";

                if ($("#txtName").val() != '')
                    url += "&name=" + $("#txtName").val();

                window.location = encodeURI(url);
            }
            // 删除
            var delModule = function(id) {
                bootbox.confirm("<h4 class='red'>你确定要删除该用户吗？</h4>", function(result) {
                    if (result) {
                        window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                    }
                })
            }
            //新增
            var addUser = function(id) {
                window.location = 'toAdd.htm?backUrl=${backUrl }';
            }
        </script>
</body>
</html>
