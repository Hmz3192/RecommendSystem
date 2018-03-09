package com.hmz.service;

import com.hmz.model.ArticleRating;

import java.util.List;

public interface RatingService {

    void insertOneRating(ArticleRating articleRating);

    List<ArticleRating> getArticleRating();
}
