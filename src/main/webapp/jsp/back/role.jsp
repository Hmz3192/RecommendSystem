<!--
Created by IntelliJ IDEA.
User: ThinKPad
Date: 2018/3/1
Time: 20:27
To change this template use File | Settings | File Templates.
-->
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

<body class="flat-blue">
<div class="app-container">
    <div class="row content-container">
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li>权限管理</li>
                        <li class="active">角色管理</li>
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
                        <li>
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
                        <li class="active panel panel-default dropdown">
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
            <div class="side-body">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title">角色管理</div>
                                    <hr>
                                    <div>
                                        <!-- 新增角色 -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#addRole">
                                            新增角色
                                        </button>
                                        <!-- 新增角色 -->
                                        <div class="modal fade" id="addRole" tabindex="-1" role="dialog"
                                             aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">新增角色</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">关闭
                                                        </button>
                                                        <button type="button" class="btn btn-primary">发布</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>角色名称</th>
                                            <th>角色权限</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>系统管理员</td>
                                            <td>后台所有功能</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#setPermission">设置权限</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>人员管理员</td>
                                            <td>会员管理，普通用户管理，管理员管理</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#setPermission">设置权限</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>文章管理员</td>
                                            <td>文章审核，类型管理，评论管理</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#setPermission">设置权限</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>媒体管理</td>
                                            <td>广告管理，新增广告</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#setPermission">设置权限</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <div>
                                        <nav>
                                            <ul class="pagination pagination-lg"
                                                style="margin-left: 40%;margin-top: 5%">
                                                <li>
                                                    <a href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li>
                                                    <a href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--setPermission-->
<div class="modal fade" id="setPermission" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">设置权限</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>
</div>

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
</body>

</html>
