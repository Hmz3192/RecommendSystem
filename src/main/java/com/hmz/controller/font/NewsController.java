package com.hmz.controller.font;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hmz.model.Article;
import com.hmz.pojo.PageResult;
import com.hmz.service.ArticleKindService;
import com.hmz.service.ArticleService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class NewsController {

    public static Logger logger = Logger.getLogger(NewsController.class);

    @Resource
    private ArticleKindService articleKindService;

    @Resource
    private ArticleService articleService;



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
    @RequestMapping(value = "/rewen")
    public List<Article> rewen() {
        List<Article> articles = articleService.selectFirstFiveArticle();
        return articles;
    }

    @RequestMapping(value = "/search")
    public String search(String input) {
        System.out.println(input);
        return "font/search";
    }

}
