<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>${webTitle}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <%@ include file="common/header.jsp" %>
    <script src="${staticServer }/assets/js/userBrower.js"></script>
    <script src="${staticServer }/assets/js/jCookie.js"></script>
    <style>
        .login-container{
            width: 675px;
        }
        .widget-main{
            background: -webkit-gradient(linear, 0 100, 0 bottom, from(#017DBB), to(white)) !important;
            background: -ms-linear-gradient(top, #017DBB 45%, #ffffff 100%) !important;
            filter:progid:DXImageTransform.Microsoft.gradient( startcolorstr=#017DBB, endcolorstr=white,gradientType=0 );
        }
    </style>
</head>

<body class="login-layout">
<div class="main-container login-main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" style="border: none;" class="login-box visible widget-box no-border no-padding">
                            <div class="widget-body" style="border-radius: 0px;">
                                <div class="widget-main" style="border-radius: 0px;">
                                    <h4 class="header blue lighter bigger">
                                        <img src="<c:url value="/assets/images/haijun.png"/>" width="100px"/>
                                        <b style="padding-left: 12px;font-size: 24px;color: white">信息管理系统</b>
                                    </h4>
                                    <div class="space-6"></div>
                                    <form id="loginForm" action="checkLogin.htm" method="post" style="padding: 0 105px;">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" maxlength="7" class="form-control" name="username"
                                                           id="username" placeholder="军官证号"/>
                                                    <i class="ace-icon fa fa-user"></i>
												</span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" name="password"
                                                           id="password" placeholder="密码"/>
                                                    <i class="ace-icon fa fa-lock"></i>
												</span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <span id="lblMessage" class="errMsg" style="display: none"> 账号号或密码输入错误！ </span>
												</span>
                                            <div class="space"></div>
                                            <div class="clearfix">
                                                <label class="inline"> <input type="checkbox" class="ace" id="chk"/>
                                                    <span class="lbl"> 记住我</span>
                                                </label>
                                                <button type="submit"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-unlock-alt"></i> <span class="bigger-110">登录</span>
                                                </button>
                                            </div>
                                            <div class="space-4"></div>
                                            <br/>
                                            <label class="clearfix" style="width: 100%;text-align: center">
                                                <span class="block input-icon">
                                                    <span class="inline input-icon input-icon-right">版权所有 北京京航计算通讯研究所© 2017</span>
                                                </span>
                                            </label>
                                        </fieldset>
                                    </form>
                                </div>
                                <!-- /.widget-main -->
                            </div>
                            <!-- /.widget-body -->
                        </div>
                        <!-- /.login-box -->
                    </div>
                    <!-- /.position-relative -->

                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->


<%@ include file="common/js.jsp" %>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    var isNeedVerifyCode = false;
    jQuery(function ($) {
        $("#divVerifyCode").hide();
        $("#username").bind("blur", checkNeedVerifyCode);

        $("#loginForm").validate({
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
            },
            rules: {
                username: {
                    required: true,
                    maxlength: 7
                },
                password: {
                    required: true
                },
                verifyCode: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: ""
                },
                password: {
                    required: ""
                },
                verifyCode: {
                    required: ""
                }
            },
            submitHandler: function (form) {
                checkLogin();
            }
        });

        var cookie_chk = jQuery.jCookie('bls_chk');
        if (cookie_chk != '' && cookie_chk != null && cookie_chk == '1') {
            $('#chk').prop("checked", true);
            $('#username').val(jQuery.jCookie('bls_username'));
        }

        //$("#username").val("admin");
        //$("#password").val("123456");
        //$("#loginForm").submit();
    });
    // 点击验证码图片
    function changeCode() {
        var username = $('#username').val();
        if (null != username && "" != username) {
            $('#verifyCodeImg').attr('src', "${dynamicServer}/generateVerifyCode.htm?username=" + username + "&random=" + Math.random());
            $("#verifyCode").val("")
        }
    }

    /**
     * 输入完用户名后检测该用户名是否需要验证码
     */
    function checkNeedVerifyCode() {
        $("#lblMessage").hide();
        var url = '${dynamicServer}/isNeedVerifyCode.htm';
        $.ajax({
            url: url,
            type: "post",
            dataType: "json",
            async: true,
            data: {
                username: $('#username').val()
            },
            timeout: 3000,
            success: function (data) {
                if (data.success) {
                    changeCode();
                    $("#divVerifyCode").show();
                    isNeedVerifyCode = true;
                    $("#lblMessage").hide();
                } else {
                    $("#divVerifyCode").hide();
                    isNeedVerifyCode = false;
                }
            },
            error: function () {
            }
        });
    }

    function checkLogin() {
        if ($('#chk').is(':checked')) {
            jQuery.jCookie('bls_chk', '1', 30);
            jQuery.jCookie('bls_username', $('#username').val(), 30);
        } else {
            jQuery.jCookie('bls_chk', '0', 30);
        }

        var username = $("#username").val();
        var password = $("#password").val();
        var verifyCode = $("#verifyCode").val()
        $.ajax({
            type: "post",
            url: "${dynamicServer}/checkLogin.htm",
            data: {
                username: username,
                password: password,
                verifyCode: verifyCode,
                terminal: getUserTerminalType(),
                explorerType: getExplorerInfo().browser,
                explorerVersion: getExplorerInfo().version
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $("#lblMessage").hide();
                    window.location.href = "${dynamicServer}/index.htm";
                } else {
                    $("#lblMessage").html(data.msgText);
                    $("#lblMessage").show();
                    if (data.isNeedVerifyCode) {
                        $("#divVerifyCode").show();
                        changeCode();
                        isNeedVerifyCode = true;
                    }
                }
            },
            error: function (data) {
                $("#lblMessage").html('登录失败');
                $("#lblMessage").show();
            }
        });
    }
</script>
</body>
</html>