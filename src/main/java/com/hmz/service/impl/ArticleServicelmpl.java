package com.hmz.service.impl;

import com.hmz.dao.ArticleMapper;
import com.hmz.model.Article;
import com.hmz.model.ArticleExample;
import com.hmz.service.ArticleService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/23.
 */
@Service
@Transactional
public class ArticleServicelmpl implements ArticleService {

    @Resource
    private ArticleMapper articleMapper;

    @Cacheable(value = {"ArticleCache"})
    @Override
    public List<Article> selectAllArticle() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @CacheEvict(value = "ArticleCache", allEntries = true)
    @Override
    public boolean saveBlog(Article article) {

        ArticleExample example0 = new ArticleExample();
        ArticleExample.Criteria criteria0 = example0.createCriteria();
        criteria0.andArticleIdEqualTo(article.getArticleId());
        List<Article> articles = articleMapper.selectByExample(example0);
        if (articles.size() > 0) {
            //更新保存
            ArticleExample example = new ArticleExample();
            ArticleExample.Criteria criteria = example.createCriteria();
            criteria.andArticleIdEqualTo(article.getArticleId());
            articleMapper.updateByExample(article, example);
        } else {
            //插入保存
            articleMapper.insert(article);
        }
        return true;
    }


    @Cacheable(value = {"ArticleCache"})
    @Override
    public Article getOne(Integer articleID) {
        return articleMapper.selectByPrimaryKey(articleID);
    }
}
