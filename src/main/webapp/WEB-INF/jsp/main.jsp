<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/1/22
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
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
    <%--<script language="javascript" type="text/javascript" src="${path}/resource/js/jquery-1.11.1.min.js"/>--%>

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            //请求数据接口
            var url = "${path}/json";
            //渲染数据集合dom
            var list = $("#list");
            //加载更多dom
            var loadingBtn = $("#loading");
            //是否需要加载
            var isLoad = true;
            //当前查询第几页
            var currentPage = 1;
            //每页数量
            var rows = 10;
            //没有更多数据
            var nomore_Text = '没有更多数据';
            /*
             请求数据接口
             */
            function loadData() {
                //发送ajax
                $.ajax({
                    //url
                    url: url,
                    //请求方式
                    type: 'POST',
                    //参数
                    data: {currentPage: currentPage, rows: rows},
                    //成功回调
                    success: sucessCallback,
                    //失败回调
                    error: function (e, e2, e3) {
                        //
                        alert('请求失败，原因：' + e3);
                    }
                });
            }

            /*
             成功回调函数
             */
            function sucessCallback(data) {
                //当前页自增
                currentPage++;
                var html = '', result = data.amounts, len = result.length, i = 0;
                var path = '${path}';
                //循环数据
                for (; i < len; i++) {

                    var rs = result[i],
                        id = rs.articleId,
                        pic = "http://localhost:8111/" + rs.articleAvatar,
                        title = rs.articleTitle,
                        summary = rs.articleSummary,
                        collection = rs.articleCollection,
                        articleBig = rs.articleBig;
//                    html+='<li data-id="'+id+'">'+title+'</li>';

                    if (articleBig > 0) {
                        html += '<div class="mod-b mod-art mod-b-push ">' +
                            '<a class="transition" href="#" target="_blank" title="' + title + '">' +
                            '<div class="mod-thumb ">' +
                            '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                            '</div></a>' +
                            '<div class="column-link-box column-link-big-box">' +
                            '<a href="#" class="column-link" target="_blank">车与出行</a>' +
                            '</div><div class="mob-ctt">' +
                            '<h2><a href="#" class="transition msubstr-row5" target="_blank">' + title + '</a></h2>' +
                            '<div class="mob-author"><div class="author-face">' +
                            '<a href="#" target="_blank"><img class="lazy" src="/resource/sy-img/59_1502432173.jpg"></a>' +
                            '</div><a href="#" target="_blank">' +
                            '<span class="author-name">autocarweekly</span>' +
                            '</a><a href="#" target="_blank"></a>' +
                            '<span class="time">5小时前</span></div>' +
                            '<div class="mob-sub">' + summary + '</div>' +
                            '</div></div>'
                    } else {
                        html += '<div class="mod-info-flow">' +
                            '<div class="mod-b mod-art">' +
                                /*state*/
                            '<div class="mod-angle">' + id + '</div>' +
                            '<div class="mod-thumb "><a class="transition" title="' + title + '" href="#" target="_blank">' +
                                /*pic1*/
                            '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                            '</a></div><div class="column-link-box">' +
                                /*tag1*/
                            '<a href="#" class="column-link" target="_blank">娱乐淘金</a></div>' +
                            '<div class="mob-ctt">' +
                                /*title*/
                            '<h2><a href="#" class="transition msubstr-row2" target="_blank">' + title + '</a></h2>' +
                            '<div class="mob-author"><div class="author-face">' +
                                /*user-avatar*/
                            '<a href="#" target="_blank"><img src="/resource/sy-img/59_1502432173.jpg"></a></div>' +
                                /*user-name*/
                            '<a href="#" target="_blank"><span class="author-name ">量子位</span></a>' +
                                /*release-time*/
                            '<a href="#" target="_blank" title="购买VIP会员"></a><span class="time">1小时前</span>' +
                                /*comment-number*/
                            '<i class="icon icon-cmt"></i><em>0</em>' +
                                /*collection-number*/
                            '<i class="icon icon-fvr"></i><em>' + collection + '</em>' +
                                /*summary*/
                            '</div><div class="mob-sub">' + summary + '</div>' +
                            '</div></div></div>'
                    }
                }
                //渲染数据
                list.append(html);
                //接口是否查询完毕
                if (data.total == data.currentPage || currentPage > data.total) {
                    //数据全部加载完毕
                    isLoad = false;
                    //
                    loadingBtn.html(nomore_Text);
                }
            }

            /*
             判断是否要加载接口
             */
            /* function isScrollLoad(){
             //加载更多距离
             var btn_top = loadingBtn.offset().top;
             //窗体高度
             var window_height = $(window).height();
             //滚动距离
             var scroll_Top = $(window).scrollTop();
             //加载更多高度
             var loading_height = loadingBtn.height();
             //是否需要加载(底部距离是否小于窗口高度+滚动的距离)
             return btn_top < scroll_Top + window_height - (loading_height - 5) ? true : false;
             }*/
            /*
             滚动事件监听
             */
            /*   $(window).scroll(function(){
             //是否滚动到底部
             var _needload = isScrollLoad();
             //
             if(_needload && isLoad){
             //加载数据
             loadData();
             }
             });*/

            /*
             页面加载完毕执行一次查询
             */
            window.onload = function () {
                //加载数据
                loadData();
            };

            /*
             点击加载更多
             */
            loadingBtn.click(function () {
                //是否加载数据
                if (isLoad)
                    loadData();
            });
        });
    </script>

</head>

<body>

<%@include file="header.jsp" %>

<div class="placeholder-height"></div>
<div class="container" id="index">
    <div class="wrap-left pull-left">
        <div class="big-pic-box">
            <div class="big-pic">
                <a href="#" target="_blank" class="transition" title="醒醒吧，腾讯、网易称霸的游戏行业，谁都没机会成为第三">
                    <div class="back-img"><img src="${path}/resource/sy-img/061708387437.jpg"
                                               alt="醒醒吧，腾讯、网易称霸的游戏行业，谁都没机会成为第三"></div>
                    <div class="big-pic-content">
                        <h1 class="t-h1">醒醒吧，腾讯、网易称霸的游戏行业，谁都没机会成为第三</h1>
                    </div>
                </a>
            </div>
            <div class="big2-pic big2-pic-index big2-pic-index-top">
                <a href="#" class="back-img transition" target="_blank" title="嘘！Facebook 正在上海悄悄寻找办公室">
                    <img class="lazy" src="${path}/resource/sy-img/142618969973.jpg" alt="嘘！Facebook 正在上海悄悄寻找办公室">
                </a>
                <a href="#" target="_blank" title="嘘！Facebook 正在上海悄悄寻找办公室">
                    <div class="big2-pic-content">
                        <h2 class="t-h1">嘘！Facebook 正在上海悄悄寻找办公室</h2>
                    </div>
                </a>
            </div>
            <div class="big2-pic big2-pic-index big2-pic-index-bottom">
                <a href="#" class="back-img transition" target="_blank" title="马云在人生最艰难时去了延安，在革命根据地决定建立淘宝">
                    <img class="lazy" src="${path}/resource/sy-img/093433055013.jpg" alt="马云在人生最艰难时去了延安，在革命根据地决定建立淘宝">
                </a>
                <a href="#" target="_blank" 马云在人生最艰难时去了延安，在革命根据地决定建立淘宝>
                    <div class="big2-pic-content">
                        <h2 class="t-h1">马云在人生最艰难时去了延安，在革命根据地决定建立淘宝</h2>
                    </div>
                </a>
            </div>
        </div>

        <%--动态加载--%>
        <div class="mod-info-flow" style="width: 100%;">
                <ul id="list"></ul>
            <div class="get-mod-more js-get-mod-more-list transition" id="loading" style="cursor: pointer;">
                点击加载更多
            </div>
        </div>
    </div>


    <div class="wrap-right pull-right">
        <div class="right-ad-box"></div>

        <link rel="stylesheet" type="text/css" href="https://static.huxiucdn.com/www/css/moment.css">
        <div id="moment"></div>
        <div class="box-moder moder-story-list">
            <h3>24小时</h3>
            <span class="pull-right project-more story-more"><a href="#"
                                                                class="transition index-24-right js-index-24-right"
                                                                target="_blank">查看全部</a></span>
            <span class="span-mark"></span>
            <div class="story-box-warp hour-box-warp">
                <div class="nano">
                    <div class="overthrow nano-content description" tabindex="0">
                        <ul class="box-list mt-box-list">
                            <!--公共24小时列表部分-->
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。
                                                <a href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp] </a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。
                                                <a href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。
                                                <a href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="story-content">
                                    <div class="mt-story-title js-story-title" story-data-show="true">
                                        <p class="transition hour-arrow">
                                            <span class="icon icon-caret js-mt-index-icon"></span>
                                        </p>
                                        <ul class="hour-head">
                                            <li><img class="hour-tx" src="${path}/resource/sy-img/touxiang.jpg"
                                                     alt="头像"></li>
                                            <li>
                                                <p>果然黑</p>
                                                <p>3分钟前</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-index-info-parent">
                                        <div class="story-info mt-story-info">
                                            <p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">
                                                #苹果至少要等到2019年才能摆脱对三星的依赖# 作为苹果现有LCD显示屏长期的供货商，LG
                                                Display可做到2019年实现OLED显示屏的全面发货，明年年底可以实现少量的发货。目前，LG与苹果就一些协商预付款的细节问题讨论到最后阶段。<a
                                                    href="#" target="_blank" class="mt-index-cont2-a">[&nbsp原文&nbsp]</a>
                                            </p>
                                            <div class="mt-index-end">
                                                <div class="mt-index-realend">...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="nano-pane">
                        <div class="nano-slider" style="height: 179px; transform: translate(0px, 0px);"></div>
                    </div>
                </div>
            </div>
            <div class="js-more-moment" data-cur_page="0"></div>
        </div>
        <div class="placeholder"></div>
        <!--24小时部分结束1-->
        <div class="ad-wrap">
            <div class="ad-title">广告</div>
        </div>
        <div class="placeholder"></div>

    </div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
<%--<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>--%>
</body>

</html>