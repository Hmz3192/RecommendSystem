package com.hmz.service;

import com.hmz.model.Article;
import com.hmz.model.User;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/23.
 */
public interface ArticleService {

    List<Article> selectAllArticle();

    boolean saveBlog(Article article);

    Article getOne(Integer articleID);

    List<Article> selectMyArticles(Integer userId);

    Integer updateOne(Article article);


    List<Article> selectFirstFiveArticle();

}
