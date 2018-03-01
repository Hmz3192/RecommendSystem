package com.hmz.controller;

import com.hmz.model.Article;
import com.hmz.model.ArticleComment;
import com.hmz.model.User;
import com.hmz.pojo.ArticleAttachPojo;
import com.hmz.pojo.ArticleDetail;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.ArticleCommentService;
import com.hmz.service.ArticleService;
import com.hmz.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
@Controller
public class ArticleController {

    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;
    @Resource
    private ArticleCommentService articleCommentService;
    @Resource
    private ArticleAttachService articleAttachService;

    @RequestMapping("/toarticle/{articleId}")
    public String article(@PathVariable("articleId") Integer articleId, Model model) {
        ArticleDetail articleDetail = new ArticleDetail();
        try {
            //文章详细
            Article one = articleService.getOne(articleId);
            articleDetail.setArticle(one);
            //人信息
            Integer userId = one.getUserId();
            User userById = userService.getUserById(userId);
            articleDetail.setUser(userById);
            //评论
            List<ArticleComment> commsByArticleId = articleCommentService.getCommsByArticleId(articleId);
            articleDetail.setArticleComments(commsByArticleId);
            //tag
            ArticleAttachPojo oneByArticleId = articleAttachService.getOneByArticleId(articleId);
            articleDetail.setArticleAttachPojo(oneByArticleId);
            model.addAttribute("state", 1);
            model.addAttribute("articleDetail", articleDetail);
            return "article";
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("state", 0);
        return "article";
    }

    //kind = zanPlus,zanMinus
    //kind = caiPlus,caiMinus
    @RequestMapping("/zanOrCai/{articleId}/{opKind}/{orNumber}")
    @ResponseBody
    public Integer zanOrCai(@PathVariable("articleId") Integer articleId,@PathVariable("opKind") String opKind,@PathVariable("orNumber") Integer orNumber){
        Article article = new Article();
        article.setArticleId(articleId);
        if (opKind.equalsIgnoreCase("zanPlus")) {
            article.setArticleUp(orNumber + 1);
            orNumber += 1;
        }
        if (opKind.equalsIgnoreCase("zanMinus")) {
            article.setArticleUp(orNumber - 1);
            orNumber -= 1;

        }
        if (opKind.equalsIgnoreCase("caiPlus")) {
            article.setArticleDown(orNumber + 1);
            orNumber += 1;
        }

        if (opKind.equalsIgnoreCase("caiMinus")) {
            article.setArticleDown(orNumber + 1);
            orNumber -= 1;
        }
        articleService.updateOne(article);
        return orNumber;
    }



}
