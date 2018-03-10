<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>兴趣网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2"/>
    <meta name="author" content="兴趣网">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/activity.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">
    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>

    <style>
        .search-sort-wrap {
            margin: 24px 0 18px;
            height: 26px;
            width: 121px;
            border: 1px solid #43a7f3;
            line-height: 27px;
            display: flex;
            font-size: 0
        }

        .search-sort-wrap a {
            display: inline-block;
            font-size: 14px;
            color: #43a7f3;
            width: 50%;
            text-align: center
        }

        .search-sort-wrap a.active {
            background: #43a7f3;
            color: #fff
        }

        .search-wrap-list-ul h2 {
            font-size: 18px;
            line-height: 28px
        }

        .search-list-warp .no-relevant-info {
            text-align: center;
            margin-left: 0
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="placeholder-height"></div>

<div class="container" id="index">
    <div class="wrap-left pull-left">

        <form role="search" method="get" action="#">
            <input class="search-input-list" name="s" value="mele">
            <button type="submit" class="search-btn transition"><i class="icon icon-search-list"></i></button>
        </form>
        <div class="search-sort-wrap">
            <a class="js-search-sort active" href="#">相关度</a>
            <a class="js-search-sort" href="#">最新</a>
        </div>
        <!-- <div class="search-list-warp">
             <div class="no-relevant-info">
                 暂无相关内容
             </div>
         </div>-->

        <div class="search-list-warp">
            <ul class="search-wrap-list-ul">
                <li>
                    <h2>蓝牙耳机第二春：<em>苹果</em>抢跑，亚马逊BAT跟风</h2>
                    <div class="mob-summay">通过对比，我们发现<em>苹果</em>AirPods在2016年，就实现了通过耳机触控唤醒手机中语音助手Siri的功能，AirPods的流行推动了无线耳机的发展，再加上耳机市场庞大的体量（2015年全球耳机出货量则在2.5亿副），不少硬件厂商、...
                    </div>
                    <div class="mob-author"><span class="name">国仁</span>
                        <span class="time">2018-03-08 07:53</span>
                    </div>
                </li>
                <li>
                    <h2>蓝牙耳机第二春：<em>苹果</em>抢跑，亚马逊BAT跟风</h2>
                    <div class="mob-summay">通过对比，我们发现<em>苹果</em>AirPods在2016年，就实现了通过耳机触控唤醒手机中语音助手Siri的功能，AirPods的流行推动了无线耳机的发展，再加上耳机市场庞大的体量（2015年全球耳机出货量则在2.5亿副），不少硬件厂商、...
                    </div>
                    <div class="mob-author"><span class="name">国仁</span>
                        <span class="time">2018-03-08 07:53</span>
                    </div>
                </li>
                <li>
                    <h2>蓝牙耳机第二春：<em>苹果</em>抢跑，亚马逊BAT跟风</h2>
                    <div class="mob-summay">通过对比，我们发现<em>苹果</em>AirPods在2016年，就实现了通过耳机触控唤醒手机中语音助手Siri的功能，AirPods的流行推动了无线耳机的发展，再加上耳机市场庞大的体量（2015年全球耳机出货量则在2.5亿副），不少硬件厂商、...
                    </div>
                    <div class="mob-author"><span class="name">国仁</span>
                        <span class="time">2018-03-08 07:53</span>
                    </div>
                </li>
                <li>
                    <h2>蓝牙耳机第二春：<em>苹果</em>抢跑，亚马逊BAT跟风</h2>
                    <div class="mob-summay">通过对比，我们发现<em>苹果</em>AirPods在2016年，就实现了通过耳机触控唤醒手机中语音助手Siri的功能，AirPods的流行推动了无线耳机的发展，再加上耳机市场庞大的体量（2015年全球耳机出货量则在2.5亿副），不少硬件厂商、...
                    </div>
                    <div class="mob-author"><span class="name">国仁</span>
                        <span class="time">2018-03-08 07:53</span>
                    </div>
                </li>
                <li>
                    <h2>蓝牙耳机第二春：<em>苹果</em>抢跑，亚马逊BAT跟风</h2>
                    <div class="mob-summay">通过对比，我们发现<em>苹果</em>AirPods在2016年，就实现了通过耳机触控唤醒手机中语音助手Siri的功能，AirPods的流行推动了无线耳机的发展，再加上耳机市场庞大的体量（2015年全球耳机出货量则在2.5亿副），不少硬件厂商、...
                    </div>
                    <div class="mob-author"><span class="name">国仁</span>
                        <span class="time">2018-03-08 07:53</span>
                    </div>
                </li>
            </ul>
            <nav class="page-nav">
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                            class="icon icon-first"></i></span></a></li>
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                            class="icon icon-lt"></i></span></a></li>
                    <li class="active"><a>1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#"><i
                            class="icon icon-gt"></i></a></li>
                    <li><a href="#"><i
                            class="icon icon-last"></i></a></li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="wrap-right pull-right">
        <div class="box-moder moder-project-list moder-user-list">
            <h3><b>相关用户</b></h3>
            <span class="span-mark"></span>
            <div class="no-relevant-info">
                暂无相关用户
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
</body>
</html>
