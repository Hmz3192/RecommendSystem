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

<body class="flat-blue" >
<div class="app-container" >
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
                <ul class="nav navbar-nav navbar-right">
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
                                        <li><a href="${path}/article" style="text-align: center">文章管理</a>
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
                                <span class="icon fa fa-table"></span><span class="title">广告管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="${path}/adver" style="text-align: center">广告管理</a>
                                        </li>
                                        <li><a href="#" style="text-align: center">新增广告</a>
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
                                        <li><a href="${path}/permission" style="text-align: center">权限分配</a>
                                        </li>
                                        <li><a href="${path}/role" style="text-align: center">角色分配</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li>
                            <a data-toggle="collapse" href="${path}/chart">
                                <span class="icon fa fa-slack"></span><span class="title">运营图表</span>
                            </a>
                        </li>
                        <!-- Dropdown-->
                        <li>
                            <a data-toggle="collapse" href="${path}/mesboard">
                                <span class="icon fa fa-archive"></span><span class="title">留言板</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>
        <!-- Main Content -->
        <div class="container-fluid" >
            <div class="side-body padding-top">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card red summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-inbox fa-4x"></i>
                                    <div class="content">
                                        <div class="title">50</div>
                                        <div class="sub-title">New Mails</div>
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
                                        <div class="sub-title">New Message</div>
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
                                        <div class="sub-title">Product View</div>
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
                                        <div class="sub-title">Share</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row  no-margin-bottom">
                    <div class="col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-line-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Profits</h4>
                                        <h2 class="float-right no-margin font-weight-300">$3200</h2>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="thumbnail no-margin-bottom">
                                    <img src="${path}/backResource/img/thumbnails/picjumbo.com_IMG_4566.jpg"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3 id="thumbnail-label">Thumbnail label<a class="anchorjs-link"
                                                                                   href="#thumbnail-label"><span
                                                class="anchorjs-icon"></span></a></h3>
                                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit
                                            non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
                                            vehicula ut id elit.</p>
                                        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#"
                                                                                                           class="btn btn-default"
                                                                                                           role="button">Button</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="thumbnail no-margin-bottom">
                                    <img src="${path}/backResource/img/thumbnails/picjumbo.com_IMG_3241.jpg"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3 id="thumbnail-label2">Thumbnail label<a class="anchorjs-link"
                                                                                    href="#thumbnail-label"><span
                                                class="anchorjs-icon"></span></a></h3>
                                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit
                                            non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
                                            vehicula ut id elit.</p>
                                        <p><a href="#" class="btn btn-success" role="button">Button</a> <a href="#"
                                                                                                           class="btn btn-default"
                                                                                                           role="button">Button</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-bar-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Orders</h4>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-line-2-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Pages view</h4>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-success">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><i class="fa fa-comments-o"></i> Last Message</div>
                                </div>
                                <div class="clear-both"></div>
                            </div>
                            <div class="card-body no-padding">
                                <ul class="message-list">
                                    <a href="#">
                                        <li>
                                            <img src="${path}/backResource/img/profile/profile-1.jpg"
                                                 class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span
                                                        class="message-datetime">12 min ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula
                                                    sodales.
                                                </div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="${path}/backResource/img/profile/profile-1.jpg"
                                                 class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span
                                                        class="message-datetime">15 min ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula
                                                    sodales.
                                                </div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="${path}/backResource/img/profile/profile-1.jpg"
                                                 class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span
                                                        class="message-datetime">2 hour ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula
                                                    sodales.
                                                </div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="${path}/backResource/img/profile/profile-1.jpg"
                                                 class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span
                                                        class="message-datetime">1 day ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula
                                                    sodales.
                                                </div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#" id="message-load-more">
                                        <li class="text-center load-more">
                                            <i class="fa fa-refresh"></i> load more..
                                        </li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="app-footer">
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
<script type="text/javascript" src="${path}/backResource/js/index.js"></script>
</body>

</html>
