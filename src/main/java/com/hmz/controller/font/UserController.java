package com.hmz.controller.font;

import com.hmz.model.Article;
import com.hmz.model.User;
import com.hmz.pojo.ArticleEditPojo;
import com.hmz.redis.JedisUtil;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.ArticleService;
import com.hmz.service.UserService;
import com.hmz.utils.IDUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    private ArticleAttachService articleAttachService;
    @Resource
    private ArticleService articleService;

    @RequestMapping("/f")
//    @Token(save=true)
    public String toPage() {
        userService.selectAll();
        return "main";
    }
    @RequestMapping("/toactive")
    public String active() {
        return "font/active";
    }

    @RequestMapping("/toapp")
    public String app() {
        return "font/app";
    }

    @RequestMapping("/tomyself")
    public String member() {
        return "font/member";
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
        return "font/submission";
    }


    //    @Token(remove = true)
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session) {

        logger.info(user.getUserName() + "--------" + user.getPassword());
        try {
            User userLogined = userService.loginUser(user);
            session.setAttribute("user", userLogined);
            session.setAttribute("logined", true);
            model.addAttribute("result","登陆成功");
            return "main";
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("logined", false);
        model.addAttribute("result","登陆失败");
        return "font/main";
    }

    @RequestMapping(value = "/exit")
    public String logout(HttpSession session,Model model) {
        session.invalidate();
        model.addAttribute("exitResult", "退出成功");
        return "font/main";
    }



    @ResponseBody
    @RequestMapping(value = "/clearReadis")
    public String clearReadis() {
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        logger.info("清楚成功");
        return "清楚成功";
    }


    @ResponseBody
    @RequestMapping(value = "/getMyArticle")
    public List<Article> getMyArticle(HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Article> articles = articleService.selectMyArticles(user.getUserId());
        return articles;
    }



    @RequestMapping(value = "/test")
    public void test(HttpServletRequest request, HttpServletResponse response) {
//            E:\WorkSpace\Idea\RecommendSystem\src\main\webapp\
//            \WorkSpace\Idea\RecommendSystem\src\main\webapp\
        System.out.println( request.getServletContext().getRealPath("/"));
        System.out.println(request.getContextPath() + request.getServletContext().getRealPath("/").substring(2));
    }


}
