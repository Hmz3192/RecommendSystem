<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人中心-虎嗅网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>
    <%--<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>--%>
    <%--<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>--%>
</head>

<body style="background-color:#f0f4fb;">
<%@include file="header.jsp" %>

<div class="placeholder-height"></div>
<div class="container per_center_body" id="per_center">
    <div class="user-info-warp">
        <div class="user-head-box">
            <div class="user-face"><img src="${path}/resource/images/58_avatar_big.jpg"></div>
            <div class="user-name">${sessionScope.user.userName}<a href="#" target="_blank"><i class="i-vip icon-vip"
                                                                                               title="虎嗅黑卡会员"></i></a>
            </div>
            <div class="user-one">产品老司机</div>
            <div class="user-one user-auth">虎嗅认证作者<i class="i-icon icon-auth3" title="虎嗅认证作者"></i></div>
            <a href="javascript:" class="btn btn-messages js-login">编辑资料</a>
            <div class="admin-btn-warp"></div>
        </div>
        <div class="user-info-box">
            <div class="col-lg-5">
                <div class="more-user-info"><i class="icon icon-user-point"></i>真实姓名：保密</div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>手机：未填写</div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>注册时间：2015-06-29</div>
                <div class="more-user-info" style="padding-left:75px;"><span>认证星级：<i class="i-icon2 icon2-stars03"></i></span>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="more-user-info"><i class="icon icon-user-point"></i>
                    <c:if test="${sessionScope.user.sex == 1}">
                        性别：男
                    </c:if>
                    <c:if test="${sessionScope.user.sex == 0}">
                        性别：女
                    </c:if>
                </div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>所在地址：保密</div>
            </div>
            <%-- <div class="col-lg-5">
                 <div class="user-info"><i class="icon icon-user-point"></i>公司：旅客App</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>职业：产品个体户</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>邮箱：保密</div>
             </div>
             <div class="col-lg-7">
                 <div class="user-info"><i class="icon icon-user-point"></i>微博：http://weibo.com/alexli2011</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>微信：17276694</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>微信公众号：lvkeapp2015</div>
             </div>
             <div class="btn-box"><a class="js-sea-more-info more-info pull-right">更多<span class="caret"></span></a></div>--%>
            <%--<div class="more-user-info-box">
                <div class="col-lg-5">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>真实姓名：保密</div>
                    <div class="more-user-info"><i class="icon icon-user-point"></i>手机：保密</div>
                </div>
                <div class="col-lg-7">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>性别：男</div>
                    <div class="more-user-info"><i class="icon icon-user-point"></i>所在地址：保密</div>
                </div>
                <div style="clear:both; width:100%;">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>注册时间：2015-06-29</div>
                </div>
                <div style="width:100%;">
                    <div class="more-user-info" style="padding-left:75px;"><span>认证星级：<i class="i-icon2 icon2-stars03"></i></span></div>
                </div>
            </div>--%>
        </div>
    </div>
    <div id="menu" name="menu"></div>
    <div class="user-menu-warp">
        <div class="menu-warp">
            <ul id=myTabs1>
                <li class="active" onMouseDown=Tabs1(this,0);><a href="#menu">我的文章</a></li>
                <li class="" onMouseDown=Tabs1(this,1);><a href="#menu">我的评论</a></li>
                <li class="" onMouseDown=Tabs1(this,2);><a href="#menu">我的收藏</a></li>
                <li class="" onMouseDown=Tabs1(this,3);><a href="#menu">我的关注</a></li>
                <li class="" onMouseDown=Tabs1(this,4);><a href="#menu">我的项目</a></li>
            </ul>
        </div>
        <div class="user-content-warp" id=myTabs1_Content0>
            <div class="message-box" id="arBox">
            </div>
            <nav class="page-nav">
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                            class="icon icon-first"></i></span></a></li>
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                            class="icon icon-lt"></i></span></a></li>
                    <li class="active"><a>1</a></li>
                    <li><a href="/member/1373658/article/2.html">2</a></li>
                    <li><a href="/member/1373658/article/3.html">3</a></li>
                    <li><a href="/member/1373658/article/4.html">4</a></li>
                    <li><a href="/member/1373658/article/2.html"><i class="icon icon-gt"></i></a></li>
                    <li><a href="/member/1373658/article/4.html"><i class="icon icon-last"></i></a></li>
                </ul>
            </nav>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content1>
            <ul class='nav-box' id=myTabs2>
                <li class="active" onMouseDown=Tabs2(this,0);><a href="#">评论（115）</a></li>
                <li class="" onMouseDown=Tabs2(this,1)><a href="#">点评（540）</a></li>
            </ul>
            <div class="message-box" id=myTabs2_Content0>
                <ul>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">1直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">10直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
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
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                    </ul>
                </nav>
            </div>
            <div class="message-box" style="display:none" id=myTabs2_Content1>
                <ul>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                        <blockquote>
                            10社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
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
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content2>
            <div class="collect-box" data-cid="129416"><span class="collect-title">我的默认收藏夹</span></div>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content3>
            <div class="topic-message-wrap">
                <div class="no-content-prompt">TA还没有关注</div>
            </div>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content4>
            <div class="product-html-box">
                <div class="message-box">
                    <ul>
                        <li type="article">
                            <div class="cy-mod-thumb">
                                <a class="transition" href="#" target="_blank"><img class="lazy"
                                                                                    src="images/1461314509617354.png"
                                                                                    alt="旅客"></a>
                            </div>
                            <div class="cy-mob-ctt">
                                <div class="cp-name"><a href="#" class="transition" target="_blank">旅客</a></div>
                                <div class="cp-time"> 提交时间：2016-04-22</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
    $(function () {
        window.onload = function () {
            loadMyArticle();
        }


        function loadMyArticle() {
            var loadTagUrl = "${path}/getMyArticle";
            var html = "";
            $.get(loadTagUrl, function (data) {
                if (data.length == 0) {
//                    alert("Tag无数据");
                    html += '<p>Ta 还没有留下任何文章</p>';
                    $("#arBox").append(html);
                } else {
                    var len = data.length, i = 0;
                    for (; i < len; i++) {
                        var rs = data[i],
                            id = rs.articleId,
                            pic = "http://localhost:8111/" + rs.articleAvatar,
                            title = rs.articleTitle,
                            summary = rs.articleSummary,
                            article_href = "${path}/toarticle/" + id;

                        html += '<div class="mod-b mod-art">' +
                            '<a class="transition" href="' + article_href + '" target="_blank">' +
                            '<div class="mod-thumb"><img class="lazy" src="' + pic + '" alt="' + title + '" style="display: inline;"></div></a> ' +
                            '<div class="mob-ctt"><h3><a href="' + article_href + '" class="transition" target="_blank">' + title + '</a></h3>' +
                            '<div class="mob-author"><span class="time">6天前</span></div><div class="mob-sub">' + summary + '</div></div></div>';
                        $("#arBox").append(html);

                    }
                }
            });
        }

    });


</script>
<script>
    $(document).ready(function () {
        $(".more-user-info-box").fadeOut(0);
        $(".btn-box").click(function () {
            $(".more-user-info-box").not($(this).next()).slideUp('fast');
            $(this).next().slideToggle(400);
        });
    });
</script>
<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
</body>
</html>
