package com.hmz.controller;

import com.hmz.interceptor.Token;
import com.hmz.model.Article;
import com.hmz.model.User;
import com.hmz.pojo.ArticleEditPojo;
import com.hmz.pojo.MesResult;
import com.hmz.redis.JedisUtil;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.UserService;
import com.hmz.utils.IDUtils;
import org.apache.ibatis.annotations.Result;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    private ArticleAttachService articleAttachService;


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
        Integer GenArticleId = IDUtils.genIntegerId();
        ArticleEditPojo articleEditPojo = new ArticleEditPojo();
        articleEditPojo.setBlog_state(0);
        Article article = new Article();
        article.setArticleId(GenArticleId);
        articleEditPojo.setArticle(article);
        model.addAttribute("articlePO", articleEditPojo);
        return "submission";
    }


    @Token(remove = true)
    @RequestMapping("/login")
    public MesResult login(User user, HttpSession session) {
        MesResult mesResult = new MesResult();
        logger.info(user.getUserName() + "--------" + user.getPassword());
        try {
            User userLogined = userService.loginUser(user);
            session.setAttribute("user", userLogined);
            mesResult.setMessage("登陆成功");
            return mesResult;
        } catch (Exception e) {
            e.printStackTrace();
        }

        mesResult.setMessage("登陆失败");
        return mesResult;
    }



    @ResponseBody
    @RequestMapping(value = "/clearReadis")
    public String clearReadis() {
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        logger.info("清楚成功");
        return "清楚成功";
    }


    @RequestMapping(value = "/test")
    public void test(HttpServletRequest request, HttpServletResponse response) {
//            E:\WorkSpace\Idea\RecommendSystem\src\main\webapp\
//            \WorkSpace\Idea\RecommendSystem\src\main\webapp\
        System.out.println( request.getServletContext().getRealPath("/"));
        System.out.println(request.getContextPath() + request.getServletContext().getRealPath("/").substring(2));
    }


}
