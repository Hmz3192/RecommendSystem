<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/1/22
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>虎嗅网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2" />
    <meta name="author" content="虎嗅网">
    <meta name="keywords" content="科技资讯,商业评论,明星公司,动态,宏观,趋势,创业,精选,有料,干货,有用,细节,内幕">
    <meta name="description" content="聚合优质的创新信息与人群，捕获精选|深度|犀利的商业科技资讯。在虎嗅，不错过互联网的每个重要时刻。">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/ground.css">
    <link href="${pageContext.request.contextPath}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resource/js/main.js"></script>
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resource/js/popwin.js"></script>
</head>

<body>
<%@include file="header.jsp" %>

<div class="placeholder-height"></div>
<div class="ground-banner">
    <div class="container ground-container">
        <div class="app-vip-logo-box">
            <img class="app-vip-logo" src="${pageContext.request.contextPath}/resource/images/v_logo.png">
            <div class="app-vip-title app-vip-title1">聚合优质的</div>
            <div class="app-vip-title app-vip-title2">创新信息和人群</div>
        </div>
        <img class="pic-ground-box" src="${pageContext.request.contextPath}/resource/images/vip_bg_pic.png">
        <div class="left-info">
            <div class="qr-pic-box">
                <a href="#" target="_blank" class="ios"><i class="app_icon app_ios"></i><br>iOS版</a>
                <a href="#" target="_blank" class="android"><i class="app_icon app_android"></i><br>Android版</a>
                <img class="app-qr-pic" src="${pageContext.request.contextPath}/resource/images/150943753529.png">
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="product-introduce">
        <ul class="introduce-ul">
            <li>
                <a href="#" target="_blank" class="transition">
                    <i class="g_icon icon-article "></i>
                    <div class="name">资讯</div>
                    <p>有视角，个性化商业资讯<br>给你有价值的内容</p>
                </a>
            </li>
            <li>
                <a class="transition">
                    <i class="g_icon icon-hy"></i>
                    <div class="name">视频</div>
                    <p>移动化短视频时代，虎嗅打造<br>全新形态的商业资讯</p>
                </a>
            </li>
            <li>
                <a href="#" target="_blank" class="transition">
                    <i class="g_icon icon-activity"></i>
                    <div class="name">会员</div>
                    <p>专属内容服务，早知道一点<br>多知道一点</p>
                </a>
            </li>
            <li>
                <a href="#" target="_blank" class="transition">
                    <i class="g_icon icon-topic"></i>
                    <div class="name">活动</div>
                    <p>虎嗅网打造的品牌活动<br>&nbsp;聚合创新创业人群</p>
                </a>
            </li>
        </ul>
    </div>
</div>

<%@include file="footer.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/mouse.js"></script>
</body>
</html>