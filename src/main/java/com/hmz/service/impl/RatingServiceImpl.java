package com.hmz.service.impl;

import com.hmz.dao.ArticleRatingMapper;
import com.hmz.model.ArticleRating;
import com.hmz.model.ArticleRatingExample;
import com.hmz.service.RatingService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class RatingServiceImpl implements RatingService {

    @Resource
    private ArticleRatingMapper articleRatingMapper;

    @Override
    public void insertOneRating(ArticleRating articleRating) {
        articleRatingMapper.insert(articleRating);
    }

    @Override
    public List<ArticleRating> getArticleRating() {
        ArticleRatingExample example = new ArticleRatingExample();
        List<ArticleRating> articleRatings = articleRatingMapper.selectByExample(example);
        return articleRatings;

    }
}
