package com.hmz.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hmz.interceptor.AvoidDuplicateSubmissionInterceptor;
import com.hmz.interceptor.Token;
import com.hmz.model.Article;
import com.hmz.model.ArticleAttach;
import com.hmz.model.ArticleKind;
import com.hmz.model.User;
import com.hmz.pojo.ArticleAttachPojo;
import com.hmz.pojo.ArticleEditPojo;
import com.hmz.pojo.PageResult;
import com.hmz.redis.JedisUtil;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.ArticleKindService;
import com.hmz.service.ArticleService;
import com.hmz.service.UserService;
import org.apache.ibatis.annotations.Result;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Action;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/22.
 */
@Controller
public class UserController {

    public static Logger logger = Logger.getLogger(UserController.class);



    @Resource
    private UserService userService;

    @Resource
    private ArticleService articleService;

    @Resource
    private ArticleAttachService articleAttachService;

    @Resource
    private ArticleKindService articleKindService;
    @RequestMapping("/")
    @Token(save=true)
    public String toPage() {
        userService.selectAll();
        return "main";
    }
    @RequestMapping("/toactive")
    public String active() {
        return "active";
    }

    @RequestMapping("/toapp")
    public String app() {
        return "app";
    }
    @RequestMapping("/toarticle")
    public String article() {
        return "article";
    }
    @RequestMapping("/tomember")
    public String member() {
        return "member";
    }

    @RequestMapping("/tosub")
    public String tosub(Model model) {
        ArticleEditPojo articleEditPojo = new ArticleEditPojo();
        articleEditPojo.setBlog_state(0);
        model.addAttribute("articlePO", articleEditPojo);
        return "submission";
    }


    @Token(remove=true)
    @RequestMapping("/login")
    public String login(User user) {
        logger.info(user.getUserName() + "--------" + user.getPassword());
        Boolean aBoolean = userService.loginUser(user);
        return "main";
    }



    @RequestMapping(value = "/clearReadis")
    public String clearReadis() {
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        logger.info("清楚成功");
        return "main";
    }

    @ResponseBody
    @RequestMapping(value = "/json")
    public PageResult ajaxLoad(int currentPage, int rows) {
        logger.info("当前页为===="+currentPage);
        PageHelper.startPage(currentPage, rows);
        List<Article> articles = articleService.selectAllArticle();
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        }else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, articles, currentPage);

        return pageResult;
    }

    @ResponseBody
    @RequestMapping(value = "/loadPKind")
    public List<ArticleKind> loadPKind() {
        List<ArticleKind> allKind = articleKindService.getAllPKind();
        return allKind;
    }

    @ResponseBody
    @RequestMapping(value = "/loadChildKind")
    public List<ArticleKind> loadChildKind(String parentName) {
        List<ArticleKind> childKind = articleKindService.getChildKind(parentName);
        return childKind;
    }




    @RequestMapping(value = "/test")
    public void test(HttpServletRequest request, HttpServletResponse response) {
//            E:\WorkSpace\Idea\RecommendSystem\src\main\webapp\
//            \WorkSpace\Idea\RecommendSystem\src\main\webapp\
        System.out.println( request.getServletContext().getRealPath("/"));
        System.out.println(request.getContextPath() + request.getServletContext().getRealPath("/").substring(2));
    }


}
