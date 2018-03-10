<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/activity.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">
    <!--toast-->
    <link href="${path}/resource/toast/toast.style.css" rel="stylesheet">

    <link href="${path}/resource/css/myCss.css" rel="stylesheet">

    <script type="text/javascript" src="${path}/resource/toast/toast.script.js"></script>


    <style type="text/css">
        ul.list_01 > li:hover ul.list_02 {
            display: block;
        }

    </style>
    <script type="text/javascript">
        var user = '${sessionScope.user}';
        var logined = '${sessionScope.logined}';
        if (logined) {
            if (${result != null}) {
                if (user == null) {
                    toast("登陆提醒", "登陆失败", "error");
                }
                else
                    toast("登陆提醒", "登陆成功", "success");
            }
//            alert(user);
        }

        var exitResult = '${exitResult}';
        if (${exitResult != null}) {
            toast("退出提醒", "退出成功", "info");
        }


        function toast(title, message, state) {
            $.Toast(title, message, state, {
                stack: true,
                has_icon: true,
                has_close_btn: true,
                fullscreen: false,
                timeout: 3000,
                sticky: false,
                has_progress: true,
                rtl: false,
            });
        }


    </script>
</head>
<body>
<header id="op" role="banner" class="transition">
    <!--搜索弹窗 开始-->
    <div class="box">
        <div class="box2">
            <div class="icon icon-search-close js-show-search-box"><a class="close"></a></div>
            <div class="search-content overlay-dialog-animate">
                <div class="search-input">
                    <form role="search" method="get" action="${path}/search" onsubmit="return checkinput()">
                        <button type="submit"></button>
                        <input placeholder="请输入关键字" name="input" id="search-input">
                    </form>
                </div>
                <div class="search-history hide" id="history">
                    <span>我的搜索历史</span>
                    <ul class="transition" id="history_ul">
                        <li class="transition"><a href="#">数码</a></li>
                        <li class="transition"><a href="#">科技</a></li>
                        <li class="transition"><a href="#">科技</a></li>
                        <li class="transition"><a href="#">互联网</a></li>
                        <li class="transition"><a href="#">汽车之家</a></li>
                    </ul>
                    <div class="pull-right empty-history js-empty-history">清空历史</div>
                </div>
                <div class="search-history search-hot">
                    <strong>热搜词</strong>
                    <ul>
                        <li class="transition"><a href="#">数码</a></li>
                        <li class="transition"><a href="#">科技</a></li>
                        <li class="transition"><a href="#">互联网</a></li>
                        <li class="transition"><a href="#">汽车之家</a></li>
                        <li class="transition"><a href="#">Uber</a></li>
                        <li class="transition"><a href="#">支付宝</a></li>
                        <li class="transition"><a href="#">大数据</a></li>
                        <li class="transition"><a href="#">创业</a></li>
                        <li class="transition"><a href="#">旅游</a></li>
                        <li class="transition"><a href="#">美团</a></li>
                        <li class="transition"><a href="#">社交</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--搜索弹窗 结束-->
    <script>
        function checkinput() {
            var input = $("#search-input").val();
            if (input == null || input == '') {
                return false;
            }
            return true;
        }


    </script>


    <div class="container" style="width: 80%!important;">
        <div class="navbar-header transition">
            <%--<a href="${path}/" title="首页"><img src="${path}/resource/images/logo.jpg" alt="虎嗅网" title="首页"/></a>--%>
        </div>
        <ul class="nav navbar-nav navbar-left" id="jsddm">
            <li class="nav-news js-show-menu">
                <a href="#">资讯 <span class="caret"></span></a>
                <ul>
                    <li><a href="#" target="_blank">电商消费</a></li>
                    <li><a href="#" target="_blank">娱乐淘金</a></li>
                    <li><a href="#" target="_blank">雪花一代</a></li>
                    <li><a href="#" target="_blank">人工智能</a></li>
                    <li><a href="#" target="_blank">车与出行</a></li>
                    <li><a href="#" target="_blank">智能终端</a></li>
                    <li><a href="#" target="_blank">医疗健康</a></li>
                    <li><a href="#" target="_blank">金融地产</a></li>
                    <li><a href="#" target="_blank">企业服务</a></li>
                    <li><a href="#" target="_blank">创业维艰</a></li>
                    <li><a href="#" target="_blank">社交通讯</a></li>
                    <li><a href="#" target="_blank">全球热点</a></li>
                    <li><a href="#" target="_blank">生活腔调</a></li>
                </ul>
            </li>
            <style>
                #jsddm ul {
                    position: absolute;
                    visibility: hidden;
                    background: #fff;
                    width: 250px;
                    top: 60px;
                    left: -50px;
                    z-index: 9999;
                    box-shadow: 0 1px 15px rgba(18, 21, 21, .2);
                    padding: 10px 5px;
                }

                #jsddm ul li {
                    float: left;
                    width: 105px;
                    padding-left: 20px;
                    line-height: 40px;
                }
            </style>
            <!--<li class="nav-news"><a href="#" target="_blank">热议<span class="nums-prompt nums-prompt-topic"></span></a></li>-->
            <li class="nav-news"><a href="${path}/toactive" target="_blank">活动</a></li>
            <li class="nav-news"><a href="#" target="_blank">创业白板<span class="nums-prompt"></span></a></li>
            <li class="nav-news"><a href="#" target="_blank">会员专享<em class="nums-prompt"></em></a></li>
            <li class="nav-news"><a href="#" target="_blank">官方Blog</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right transition  xiala main_nav">
            <li class="app-guide js-app-guide">
                <div class="app-guide-box">
                    <img src="${path}/resource/images/1448211685.png">
                    <div class="app-guide-title">
                        <span>微信扫一扫</span><br>
                        <span>下载虎嗅APP</span>
                    </div>
                </div>
                <i class="icon icon-sm-phone"></i>APP下载<em class="guide-prompt"></em>
            </li>
            <li class="search-li js-show-search-box"><a><i class="icon icon-search "></i></a><span>搜索</span></li>
            <c:if test="${sessionScope.user == null}">
                <li class="login-link-box"><a class="cd-signin">登录</a></li>
                <li><a class="cd-signup">注册</a></li>
            </c:if>


            <c:if test="${sessionScope.user != null}">
                <li class="user-head js-show-menu">
                    <div class="header-column header-column-user menu-box" id="detail"
                         style="opacity: 1; margin-top: 60px; padding-top:1px!important; ">
                        <a class="transition" href="${path}/tomyself">个人中心
                        </a>

                        <a class="transition">系统消息
                            <span class="badge comment_message">1</span>
                        </a>
                        <a class="transition js-btn-logout" id="exit" href="${path}/exit">退出
                        </a>
                    </div>
                    <a class="avatar transition" id="avatar">
                        <span class="icon-s"></span>
                        <img src="${path}/resource/sy-img/touxiang.jpg">
                        <span class="caret"></span>
                        <em class="message-num nums"></em>
                    </a>

                </li>
            </c:if>
            <li><a class="cd-tougao" id="tougao" target="_self">投稿</a></li>
        </ul>
    </div>
    <div class="cd-user-modal">
        <div class="cd-user-modal-container" style="width: 45%">

            <div id="cd-login"> <!-- 登录表单 -->
                <div class="modal-alert-title">登录</div>
                <div class="register">
                    <div class="register-top" id="reg-top"><i><a id="qrcode" href="#"></a></i></div>
                    <div class="register-con" id="rc">
                        <div class="login-form username-box " style="margin-top:52px;">
                            <!--  <a class="js-open-sms-login sms-text">短信快捷登录</a>-->
                            <form action="${path}/login" method="post">
                                <!--<input type="hidden" name="Token" value="${Token}" />-->
                                <label class="login-label transition">
                                    <input id="login_username" name="userName" class="login-input"
                                           placeholder="手机号／邮箱／虎嗅账号">
                                </label>
                                <label class="login-label">
                                    <input id="login_password" name="password" class="login-input password"
                                           type="password" placeholder="输入6～24位密码">
                                </label>
                                <a class="js-label-select label-select-box hide login-label-select text-center"><span
                                        class="js-country-user">+86</span><i
                                        class="icon-modal icon-l-caret"></i></a>
                                <div class="login-operation">
                                    <label><input id="autologin" type="checkbox">&nbsp;2周内自动登录</label>
                                    <a href="/user/reset_password" class="js-forget-passward pull-right">忘记密码</a>
                                </div>
                                <input class="js-btn-login btn-login" type="submit">登&nbsp;录</input>
                            </form>
                        </div>
                        <div class="js-open-register register-text">极速注册</div>

                        <div class="third-box">
                            <div class="title"><span>第三方登录</span></div>
                            <a href="#"><i class="icon-modal icon-login-qq"></i></a>
                            <a class="js-login-switch"><i class="icon-modal icon-login-wx"></i></a>
                            <a href="#"><i class="icon-modal icon-login-wb"></i></a>
                            <a href="#"><i class="icon-modal icon-login-zfb"></i></a>
                        </div>
                    </div>
                </div>
                <div class="saoma" id="sm">
                    <div class="qr-code" style="text-align:center">
                        <div class="title">微信登录</div>
                        <div class="waiting panelContent">
                            <div class="wrp_code"><img class="qrcode lightBorder"
                                                       src="${path}/resource/images/150943753529.png"></div>
                            <div class="info">
                                <div class="status status_browser js_status" id="wx_default_tip">
                                    <p>请使用微信扫描二维码登录</p>
                                    <p>"虎嗅网"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="screen-tu" id="screen"></div>
                </div>
            </div>

            <div id="cd-signup"> <!-- 注册表单 -->
                <div class="modal-alert-title">账号注册</div>
                <div class="user-register-box">
                    <div >
                        <p>请完成下列调查问卷，方便我们为您提供个性化推荐</p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" id="progress"
                                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 50%;background-color:#45cbed">
                                <span class="sr-only">40% 完成</span>
                            </div>
                        </div>
                        <div id="register" class="login-form sms-box">
                            <label class="login-label col-xs-label transition"><input id="sms_username" class="login-input username" placeholder="手机号"></label>
                            <div class="geetest_login_sms_box" >
                                <div id="geetest_1496454436837" class="gt_holder gt_float" style="touch-action: none;">
                                    <div class="gt_slider">
                                        <div class="gt_guide_tip gt_show">按住左边滑块，拖动完成上方拼图</div>
                                        <div class="gt_slider_knob gt_show" style="left: 0px;"></div>
                                        <div class="gt_curtain_knob gt_hide">移动到此开始验证</div>
                                        <div class="gt_ajax_tip gt_ready"></div>
                                    </div>
                                </div>
                            </div>
                            <label class="login-label captcha"><input id="sms_captcha" class="login-input" placeholder="输入6位验证码" maxlength="6">
                                <span class="js-btn-captcha btn-captcha">获取验证码</span></label>
                            <a class="js-label-select label-select-box text-center"><span class="js-country-sms">+86</span><i class="icon-modal icon-l-caret"></i></a>
                            <button class="js-btn-sms-login btn-login">注&nbsp;册</button>
                        </div>
                        <div id="survery" >
                            <div class="rb-box">
                                <!-- Radio Button Module -->
                                <p>1. On a scale of 1 to 5 how cubic are you?</p>
                                <div id="rb-1" class="rb">
                                    <div class="rb-tab rb-tab-active" data-value="1">
                                        <div class="rb-spot">
                                            <span class="rb-txt">1</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="2">
                                        <div class="rb-spot">
                                            <span class="rb-txt">2</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="3">
                                        <div class="rb-spot">
                                            <span class="rb-txt">3</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="4">
                                        <div class="rb-spot">
                                            <span class="rb-txt">4</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="5">
                                        <div class="rb-spot">
                                            <span class="rb-txt">5</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Radio Button Module -->
                                <p>2. On a scale of 1 to 5 how would you rate the universe?</p>
                                <div id="rb-2" class="rb">
                                    <div class="rb-tab" data-value="1">
                                        <div class="rb-spot">
                                            <span class="rb-txt">1</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab rb-tab-active" data-value="2">
                                        <div class="rb-spot">
                                            <span class="rb-txt">2</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="3">
                                        <div class="rb-spot">
                                            <span class="rb-txt">3</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="4">
                                        <div class="rb-spot">
                                            <span class="rb-txt">4</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="5">
                                        <div class="rb-spot">
                                            <span class="rb-txt">5</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Radio Button Module -->
                                <p>3. On a scale of 1 to 5 how much do you like stalactites?</p>
                                <div id="rb-3" class="rb">
                                    <div class="rb-tab" data-value="1">
                                        <div class="rb-spot">
                                            <span class="rb-txt">1</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="2">
                                        <div class="rb-spot">
                                            <span class="rb-txt">2</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab rb-tab-active" data-value="3">
                                        <div class="rb-spot">
                                            <span class="rb-txt">3</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="4">
                                        <div class="rb-spot">
                                            <span class="rb-txt">4</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="5">
                                        <div class="rb-spot">
                                            <span class="rb-txt">5</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Radio Button Module -->
                                <p>4. On a scale of 1 to 5 what is your favorite color in the alphabet?</p>
                                <div id="rb-4" class="rb">
                                    <div class="rb-tab" data-value="1">
                                        <div class="rb-spot">
                                            <span class="rb-txt">1</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="2">
                                        <div class="rb-spot">
                                            <span class="rb-txt">2</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="3">
                                        <div class="rb-spot">
                                            <span class="rb-txt">3</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab rb-tab-active" data-value="4">
                                        <div class="rb-spot">
                                            <span class="rb-txt">4</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="5">
                                        <div class="rb-spot">
                                            <span class="rb-txt">5</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Radio Button Module -->
                                <p>5. On a scale of one to shrimp, how random are you?</p>
                                <div id="rb-5" class="rb">
                                    <div class="rb-tab" data-value="4">
                                        <div class="rb-spot">
                                            <span class="rb-txt">4</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="2">
                                        <div class="rb-spot">
                                            <span class="rb-txt">2</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="5">
                                        <div class="rb-spot">
                                            <span class="rb-txt">5</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab" data-value="1">
                                        <div class="rb-spot">
                                            <span class="rb-txt">1</span>
                                        </div>
                                    </div>
                                    <div class="rb-tab rb-tab-active" data-value="3">
                                        <div class="rb-spot">
                                            <span class="rb-txt">3</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 100%">
                                <a href="#" class="nextButton trigger" style="margin: 0 40%" id="nextBtn">
                                    下一步
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#0" class="cd-close-form ">关闭</a>
        </div>
    </div>
</header>
<script src="${path}/resource/js/d-login.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>

<script>
    /*
     ===============================================================
     Hi! Welcome to my little playground!
     My name is Tobias Bogliolo. 'Open source' by default and always 'responsive',
     I'm a publicist, visual designer and frontend developer based in Barcelona.
     Here you will find some of my personal experiments. Sometimes usefull,
     sometimes simply for fun. You are free to use them for whatever you want
     but I would appreciate an attribution from my work. I hope you enjoy it.
     ===============================================================
     */
    //Global:
    var survey = []; //Bidimensional array: [ [1,3], [2,4] ]
    //switcher function:
    $(".rb-tab").click(function () {
        //Spot switcher:
        $(this).parent().find(".rb-tab").removeClass("rb-tab-active");
        $(this).addClass("rb-tab-active");
    });
    var progres = 0;
    //Save data:
    $(".trigger").click(function () {
       /* //Empty array:
        survey = [];
        //Push data:
        for (i = 1; i <= $(".rb").length; i++) {
            var rb = "rb" + i;
            var rbValue = parseInt($("#rb-" + i).find(".rb-tab-active").attr("data-value"));
            //Bidimensional array push:
            survey.push([i, rbValue]); //Bidimensional array: [ [1,3], [2,4] ]
        }
        ;
        //Debug:
        debug();*/
       $("#register").css('display','block'),
       $("#progress").css("width",'100%'),
       $("#nextBtn").text("完成"),
        $("#survery").css('display','none');

    });
    //Debug:
    function debug() {
        var debug = "";
        for (i = 0; i < survey.length; i++) {
            debug += "No " + survey[i][0] + " = " + survey[i][1] + "\n";
        }
        ;
        alert(debug);
    };
</script>

</body>
</html>