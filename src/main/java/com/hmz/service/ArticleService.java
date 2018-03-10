package com.hmz.service;

import com.hmz.model.Article;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/23.
 */
public interface ArticleService {

    List<Article> selectAllArticle();

    boolean saveBlog(Article article);

    Article getOne(Long articleID);

    List<Article> selectMyArticles(Long userId);

    Integer updateOne(Article article);

    void insertone(Article article);

    List<Article> selectFirstFiveArticle();

    List<Article> selectByArray(Long[] array);


}
