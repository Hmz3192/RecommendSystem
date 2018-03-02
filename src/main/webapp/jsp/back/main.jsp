<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/3/1
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>

<head>
    <title>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/style.css">
    <link rel="stylesheet" type="text/css" href="${path}/backResource/css/themes/flat-blue.css">
</head>

<body class="flat-blue" style="height: auto">
<div class="app-container">
    <div class="row content-container">
        <!--titleBar-->
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li class="active">首页</li>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right" >
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-times icon"></i>
                    </button>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="title">
                                消息 <span class="badge pull-right">0</span>
                            </li>
                            <li class="message">
                                暂无更多消息
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown danger">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                        <ul class="dropdown-menu danger  animated fadeInDown">
                            <li class="title">
                                Notification <span class="badge pull-right">4</span>
                            </li>
                            <li>
                                <ul class="list-group notifications">
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i>
                                            new registration
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge success">1</span> <i class="fa fa-check icon"></i> new
                                            orders
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge danger">2</span> <i class="fa fa-comments icon"></i>
                                            customers messages
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item message">
                                            view all
                                        </li>
                                    </a>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown profile">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emily
                            Hart <span class="caret"></span></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="profile-img">
                                <img src="${path}/backResource/img/profile/picjumbo.com_HNCK4153_resize.jpg"
                                     class="profile-img">
                            </li>
                            <li>
                                <div class="profile-info">
                                    <h4 class="username">Emily Hart</h4>
                                    <p>emily_hart@email.com</p>
                                    <div class="btn-group margin-bottom-2x" role="group">
                                        <button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile
                                        </button>
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i>
                                            Logout
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--sideBar-->
        <div class="side-menu sidebar-inverse" style="overflow: scroll;overflow-y: hidden;">
            <nav class="navbar navbar-default" role="navigation">
                <div class="side-menu-container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <div class="icon glyphicon glyphicon-fire"></div>
                            <div class="title">后台管理</div>
                        </a>
                        <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="${path}/b">
                                <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                            </a>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-element">
                                <span class="icon glyphicon glyphicon-list-alt"></span><span class="title">文章管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="${path}/article" style="text-align: center">文章审核</a>
                                        </li>
                                        <li><a href="${path}/articleKind" style="text-align: center">类型管理</a>
                                        </li>
                                        <li><a href="${path}/articleComments" style="text-align: center">评论管理</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-table">
                                <span class="icon fa fa-table"></span><span class="title">媒体管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="${path}/adver" style="text-align: center">广告管理</a>
                                        </li>
                                        <li><a href="${path}/addAdver" style="text-align: center">新增广告</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-form">
                                <span class="icon glyphicon glyphicon-user"></span><span class="title">用户管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-form" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="${path}/vip" style="text-align: center">会员管理</a>
                                        </li>
                                        <li><a href="${path}/user" style="text-align: center">普通用户管理</a>
                                        </li>
                                        <li><a href="${path}/manager" style="text-align: center">管理员管理</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                        <!-- Dropdown-->
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#component-example">
                                <span class="icon fa fa-cubes"></span><span class="title">权限管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="component-example" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="${path}/role" style="text-align: center">角色管理</a>
                                        </li>
                                        <li><a href="${path}/permission" style="text-align: center">权限分配</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li>
                            <a href="${path}/chart">
                                <span class="icon fa fa-slack"></span><span class="title">网站流量</span>

                            </a>
                        </li>
                        <!-- Dropdown-->
                        <li>
                            <a href="${path}/mesboard">
                                <span class="icon fa fa-archive"></span><span class="title">留言板</span>
                            </a>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body padding-top">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card red summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-inbox fa-4x"></i>
                                    <div class="content">
                                        <div class="title">50</div>
                                        <div class="sub-title">APP下载量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card yellow summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-comments fa-4x"></i>
                                    <div class="content">
                                        <div class="title">23</div>
                                        <div class="sub-title">评论量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card green summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-tags fa-4x"></i>
                                    <div class="content">
                                        <div class="title">280</div>
                                        <div class="sub-title">用户量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card blue summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-share-alt fa-4x"></i>
                                    <div class="content">
                                        <div class="title">16</div>
                                        <div class="sub-title">分享量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <div class="sub-title" style="font-size: 18px;">客户意见板</div>
                            <hr>
                            <div>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">14</span> APP新闻推荐的真棒！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">1</span> APP新闻推荐的真棒！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> APP新闻推荐的真棒！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> APP新闻推荐的真棒！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> APP新闻推荐的真棒！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> APP新闻推荐的真棒！
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="app-footer" style="margin-left: 60%;">
</footer>
<!-- Javascript Libs -->
<script type="text/javascript" src="${path}/backResource/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/Chart.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/select2.full.min.js"></script>
<script type="text/javascript" src="${path}/backResource/js/ace/ace.js"></script>
<script type="text/javascript" src="${path}/backResource/js/ace/mode-html.js"></script>
<script type="text/javascript" src="${path}/backResource/js/ace/theme-github.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="${path}/backResource/js/app.js"></script>

<script type="text/javascript">
    window.onload = function(){
        $(".app-footer").hide()
        Toast();
    }

    function Toast() {
        var html = '<div><div class="alert alert-success alert-dismissible fade in" role="alert">' +
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
        '<span aria-hidden="true">×</span></button>' +
        '<h4 id="oh-snap!-you-got-an-error!">系统提醒' +
        '<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!">' +
        '<span class="anchorjs-icon"></span></a></h4>' +
        '<p>发现新的未完成任务.</p>' +
        '</div></div>'
        $(".app-footer").append(html);
        $(".app-footer").fadeIn("slow");
        $('.app-footer').delay(3000).fadeOut("slow",Toast2());
    }

    function Toast2() {
        var html = '<div><div class="alert alert-warning alert-dismissible fade in" role="alert">' +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
            '<span aria-hidden="true">×</span></button>' +
            '<h4 id="oh-snap!-you-got-an-error!">系统提醒' +
            '<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!">' +
            '<span class="anchorjs-icon"></span></a></h4>' +
            '<p>请尽快完成手头任务，保证网站的正常运营，今日下午正常开例会.</p>' +
            '<p><button type="button" class="btn btn-danger">收到</button>' +
            '</p></div></div>'
        $(".app-footer").append(html);
        $(".app-footer").fadeIn("slow");
        $('.app-footer').delay(3000).fadeOut("slow");
    }


</script>
</body>

</html>

