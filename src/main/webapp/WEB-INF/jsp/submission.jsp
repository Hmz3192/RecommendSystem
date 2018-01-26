<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/1/24
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
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
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link href="${path}/resource/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${path}/resource/css/styles.css" rel="stylesheet" media="screen">

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/activity.css">

    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <%--webUpload--%>
    <link rel="stylesheet" href="${path}/resource/webUpload/easy-upload.css">

<%--<script language="javascript" type="text/javascript" src="${path}/resource/js/jquery-1.11.1.min.js"/>--%>
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">
    <%--kindEditor--%>
    <link rel="stylesheet" href="${path}/resource/kindEditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${path}/resource/kindEditor/plugins/code/prettify.css"/>


    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>
    <style>
        .row-fluid {
            width: 100%;
            *zoom: 1
        }

        .row-fluid:before, .row-fluid:after {
            display: table;
            line-height: 0;
            content: ""
        }

        .row-fluid:after {
            clear: both
        }

        .navbar {
            *position: relative;
            *z-index: 2;
            margin-bottom: 20px;
            overflow: visible
        }

        .navbar-inner {
            min-height: 40px;
            padding-right: 20px;
            padding-left: 20px;
            background-color: #fafafa;
            background-image: -moz-linear-gradient(top, #fff, #f2f2f2);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fff), to(#f2f2f2));
            background-image: -webkit-linear-gradient(top, #fff, #f2f2f2);
            background-image: -o-linear-gradient(top, #fff, #f2f2f2);
            background-image: linear-gradient(to bottom, #fff, #f2f2f2);
            background-repeat: repeat-x;
            border: 1px solid #d4d4d4;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff2f2f2', GradientType=0);
            *zoom: 1;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065)
        }

        .navbar-inner:before, .navbar-inner:after {
            display: table;
            line-height: 0;
            content: ""
        }

        .navbar-inner:after {
            clear: both
        }

        .muted {
            color: #999
        }

        .collapse {
            position: relative;
            height: 0;
            overflow: hidden;
            -webkit-transition: height .35s ease;
            -moz-transition: height .35s ease;
            -o-transition: height .35s ease;
            transition: height .35s ease
        }

        .collapse.in {
            height: auto
        }

        /*bootstrap-tagsinput 样式*/
        .bootstrap-tagsinput {
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            display: inline-block;
            padding: 5px 6px;
            color: #555;
            vertical-align: middle;
            border-radius: 4px;
            width: 100%;
            line-height: 22px;
            cursor: text;
        }

        .bootstrap-tagsinput input {
            border: none;
            box-shadow: none;
            outline: none;
            background-color: transparent;
            padding: 0;
            margin: 0;
            width: auto !important;
            max-width: inherit;
        }

        .bootstrap-tagsinput input:focus {
            border: none;
            box-shadow: none;
        }

        .bootstrap-tagsinput .tag {
            margin-right: 2px;
            color: white;
            font-size: 100%;
        }

        .bootstrap-tagsinput .tag [data-role="remove"] {
            margin-left: 8px;
            cursor: pointer;
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:after {
            content: "x";
            padding: 0px 2px;
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:hover {
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:hover:active {
            box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        }

        .myButton {
            background-color:transparent;
            -moz-border-radius:4px;
            -webkit-border-radius:4px;
            border-radius:4px;
            border:1px solid #eb675e;
            display:inline-block;
            cursor:pointer;
            color: #eb675e;
            background-color:#fff;
            font-family:Arial;
            font-size:22px;
            font-weight:bold;
            padding:6px 29px;
            text-decoration:none;
            font-size: 20px;
            align-items:center;
            margin-left: 15px;
            margin-right: 20px;
        }
        .myButton:hover {
            background-color:#eb675e;
            color: #fff;
            border:1px solid #fff;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }
        #picker {
            display: inline-block;
            line-height: 1.428571429;
            vertical-align: middle;
            margin: 0 12px 0 0;
        }


    </style>
    <script>
        $(function () {
            var editor1;
            $('input[data-role="tagsinput"]').tagsinput({
                maxTags: 5
            });

            KindEditor.ready(function (K) {
                editor1 = K.create('textarea[name="content1"]', {
                    cssPath: '${path}/resource/kindEditor/plugins/code/prettify.css',
                    uploadJson: '${path}/fileUpload',
                    fileManagerJson: '${path}/fileManager',
                    allowFileManager: true,
                    resizeType: 0,
                    afterCreate: function () {
                        var self = this;
                        K.ctrl(document, 13, function () {
                            self.sync();
                            document.forms['example'].submit();
                        });
                        K.ctrl(self.edit.doc, 13, function () {
                            self.sync();
                            document.forms['example'].submit();
                        });
                        // 保存
                        K('input[name=getHtml]').click(function (e) {
                            var saveUrl = "${path}/saveBlog",
                                articleId = $("#articleId").val(),
                                title = $("#title").val(),
                                summary = $("#summary").val(),
                                content = editor1.html(),
                                pKind = $("#pKind").val(),
                                cKind = $("#cKind").val(),
                                tags = $('input[data-role="tagsinput"]').val(),
                                param = {
                                    "articleId": articleId,
                                    "content": content,
                                    "title": title,
                                    "sumary": summary,
                                    "tags": tags,
                                    "pKind": pKind,
                                    "cKind": cKind
                                };
                            $.post(saveUrl, param, function (data) {
                                alert(data.message);
                            })
                        });
                    }
                });
                var html = '${articlePO.article.articleContent}';
                editor1.insertHtml(html);
                prettyPrint();

            })


            window.onload = function () {
                //加载kind数据
                loadPKind();
                alert(${articlePO.blog_state});
                <c:if test="${articlePO.blog_state == 1}">
                //加载tag
                loadTag();
                loadPCKind();
                </c:if>

            }

            function loadTag() {
                var loadTagUrl = "${path}/getTags",
                    articleId = "${articlePO.article.articleId}",
                    params = {"articleId": articleId};
                $.get(loadTagUrl, params, function (data) {
                    if (data.length == 0) {
                        alert("Tag无数据");
                    } else {
                        $('input[data-role="tagsinput"]').tagsinput('removeAll');
                        for (var i = 0; i < data.tags.length; i++) {
                            var tag = data.tags[i];
                            $('input[data-role="tagsinput"]').tagsinput('add', tag);
                        }
                    }
                })
            }

            /*
             请求父类级别数据接口
             */
            function loadPKind() {
                var loadPUrl = "${path}/loadPKind";
                //发送ajax
                $.ajax({
                    //url
                    url: loadPUrl,
                    //请求方式
                    type: 'GET',
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
             请求父类和子类级别数据接口
             */
            function loadPCKind() {
                var loadPUrl = "${path}/loadPCKind",
                    kindChildName = "${articlePO.article.kindChildName}",
                    kindParentName = "${articlePO.article.kindParentName}";
                if (kindParentName != null || kindChildName != null) {
                    var param = {"pKindId": kindParentName, "cKindId": kindChildName};
                }
                $.get(loadPUrl, param, function (data) {
                    if (data.length == 0) {
                        alert("无子数据");
                    } else {
                        var rsP, rsC;
                        if (data[0] != null) {
                            $("#pKind").append('<option value="' + data[0].kindName + '"> ' + data[0].kindName + '</option>');
                            var options = document.getElementById('pKind').children;
                            options[0].selected = true;
                        }

                        if (data[1] != null) {
                            $("#cKind").append('<option value="' + data[1].kindName + '"> ' + data[1].kindName + '</option>');
                            var options = document.getElementById('cKind').children;
                            document.getElementById('cKind').style.display = 'block';
                            options[0].selected = true;
                        }
                    }
                })
            }

            /*
             成功回调函数
             */
            function sucessCallback(data) {
                var len = data.length, i = 0;
                //循环数据
                if (len > 0) {
                    for (; i < len; i++) {
                        var rs = data[i],
                            kindId = rs.kindId,
                            kindName = rs.kindName,
                            parentId = rs.parentId;
                        $("#pKind").append('<option value="' + kindName + '"> ' + kindName + '</option>');
                    }
                } else
                    alert("未找到类型");
            }


            $("#pKind").change(function () {
                $("#cKind option:not(:first)").remove();
                var pKind = $(this).val();
                if (pKind != "") {
                    var url = "${path}/loadChildKind";
                    var param = {"parentName": pKind};
                    $.get(url, param, function (data) {
                        if (data.length == 0) {
                            alert("无子数据");
                        } else {
                            for (var i = 0; i < data.length; i++) {
                                var rs = data[i],
                                    kindName = rs.kindName;
                                $("#cKind").append('<option value="' + kindName + '"> ' + kindName + '</option>');
                                document.getElementById('cKind').style.display = 'block';
                            }
                        }
                    })
                }
            });

        })

    </script>
</head>

<body>
<%@include file="header.jsp" %>
<div class="placeholder"></div>

<%--编辑器--%>
<div class="container" id="index" style="width: 95%!important;margin: 0px auto">
    <div class="wrap-left pull-left" style="margin-left: 13%;width: 55%;">
        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left" style="font-size: 30px;color: #000">我的博客</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form name="example" class="form-horizontal" method="post" action="${path}/todemo">
                            <input type="hidden" id="articleId" value="${articlePO.article.articleId}">
                            <fieldset>
                                <legend>标题</legend>
                                <div class="controls">
                                    <select class="span2 m-wrap"
                                            style="border-radius:5px;border: 1px solid #000; outline:none;" id="pKind"
                                            name="category">
                                        <c:if test="${articlePO.article.kindParentName == null}">
                                            <option value="">请选择...</option>
                                        </c:if>
                                    </select>
                                    <select class="span2 m-wrap" id="cKind"
                                            style="display: none;border-radius:5px;border: 1px solid #000; outline:none;"
                                            name="category">
                                        <c:if test="${articlePO.article.kindChildName == null}">
                                            <option value="">请选择...</option>
                                        </c:if>
                                    </select>
                                    <c:if test="${articlePO.article.articleTitle != null}">
                                        <input type="text"
                                               id="title"
                                               style="margin-left: 30px;border-radius:5px;border: 1px solid #000; outline:none;"
                                               maxlength="30" class="span6"
                                               value="${articlePO.article.articleTitle}"
                                               placeholder="请输入标题，1-30个字">
                                    </c:if>
                                    <c:if test="${articlePO.article.articleTitle == null}">
                                        <input type="text"
                                               id="title"
                                               style="margin-left: 30px;border-radius:5px;border: 1px solid #000; outline:none;"
                                               maxlength="30" class="span6"
                                               placeholder="请输入标题，1-30个字">
                                    </c:if>
                                </div>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>简介</legend>
                                <div class="controls">
                                    <c:if test="${articlePO.article.articleSummary != null}">
                                       <textarea class="span8" id="summary" cols="10" rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字">${articlePO.article.articleSummary}</textarea>
                                    </c:if>
                                    <c:if test="${articlePO.article.articleSummary == null}">
                                       <textarea class="span8" id="summary" cols="10" rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字"></textarea>
                                    </c:if>
                                </div>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>封面图片</legend>
                                    <div id="upload" class="upload"><p>选择封面</p></div>
                                <br>
                            </fieldset>
                            <%--<%=htmlData%>--%>
                            <fieldset>
                                <legend>内容</legend>
                                <textarea name="content1" cols="200" rows="8"
                                          style="resize:none;width:100%;height:700px;"><%=htmlspecialchars(htmlData)%></textarea>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>标签</legend>
                                <input type="text" class="form-control" style="width: 100px;" id="tags"
                                       data-role="tagsinput" placeholder="请输入标签"/>
                            </fieldset>
                            <%--<input type="submit" name="button" value="提交内容"/> (提交快捷键: Ctrl + Enter)--%>
                            <br>
                            <fieldset>
                            <%--<input type="submit"  class="myButton"  value="发布" />--%>
                            <input type="button"  class="myButton" value="保存" name="getHtml"/>
                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="wrap-right pull-right" style="width: 20%;float: left!important;margin-left:1%;">
        <div class="right-ad-box"></div>
        <link rel="stylesheet" type="text/css" href="https://static.huxiucdn.com/www/css/moment.css">
        <div id="moment"></div>
        <div class="box-moder moder-story-list">
            <h3>上传附件</h3>
            <span class="span-mark"></span>
            <div class="story-box-warp hour-box-warp">
                <div class="nano">
                    <div class="overthrow nano-content description" tabindex="0">
                        <div id="easyContainer"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="placeholder"></div>
    </div>
    <%!
        private String htmlspecialchars(String str) {
            str = str.replaceAll("&", "&amp;");
            str = str.replaceAll("<", "&lt;");
            str = str.replaceAll(">", "&gt;");
            str = str.replaceAll("\"", "&quot;");
            return str;
        }
    %>
</div>
<div class="placeholder"></div>

<%--页脚--%>
<%@include file="footer.jsp" %>
<%--<script language="javascript" type="text/javascript" src="${path}/resource/js/jquery-1.11.1.min.js"/>--%>
<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>
<%--kindEditor--%>
<script charset="utf-8" src="${path}/resource/kindEditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/resource/kindEditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="${path}/resource/kindEditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="${path}/resource/kindEditor/plugins/jwplayer/jwplayer.js"></script>
<%--自定义的选择图片--%>
<link rel="stylesheet" href="${path}/resource/css/tinyImgUpload.css">
<script type="text/javascript" src="${path}/resource/js/tinyImgUpload.js"></script>
<%--鼠标滑动--%>
<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
<%--tag标签--%>
<script type="text/javascript" src="${path}/resource/js/bootstrap-tagsinput.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/webUpload/easyUpload.js"></script>

<script>
    $('#easyContainer').easyUpload({
        allowFileTypes: '*.jpg;*.doc;*.pdf',//允许上传文件类型，格式';*.doc;*.pdf'
        allowFileSize: 100000,//允许上传文件大小(KB)
        selectText: '选择文件',//选择文件按钮文案
        multi: true,//是否允许多文件上传
        multiNum: 5,//多文件上传时允许的文件数
        showNote: true,//是否展示文件上传说明
        note: '提示：最多上传5个文件，支持格式为doc、pdf、jpg',//文件上传说明
        showPreview: true,//是否显示文件预览
        url: '/api/file/upload',//上传文件地址
        fileName: 'file',//文件filename配置参数
        formParam: {
        },//文件filename以外的配置参数，格式：{key1:value1,key2:value2}
        timeout: 30000,//请求超时时间
        okCode: 200,//与后端返回数据code值一致时执行成功回调，不配置默认200
        successFunc: function(res) {
            console.log('成功回调', res);
        },//上传成功回调函数
        errorFunc: function(res) {
            console.log('失败回调', res);
        },//上传失败回调函数
        deleteFunc: function(res) {
            console.log('删除回调', res);
        }//删除文件回调函数
    });
</script>
<script type='text/javascript'>
    //非视频，不加载播放器
    if (document.getElementById('player') != null) {
        jwplayer('player').onReady(function () {
        });
        jwplayer('player').onPlay(function () {
        });
        //jwplayer('player').play(); //自动播放？
    }
    /*uploadPic*/
    document.documentElement.style.fontSize = document.documentElement.clientWidth*0.1+'px';

    var options = {
        path: '/',
        onSuccess: function (res) {
            console.log(res);
        },
        onFailure: function (res) {
            console.log(res);
        }
    }

    var upload = tinyImgUpload('#upload', options);



</script>

</body>
</html>
