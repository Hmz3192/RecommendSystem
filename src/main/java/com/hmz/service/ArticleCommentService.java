package com.hmz.service;

import com.hmz.model.ArticleComment;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
public interface ArticleCommentService {

    List<ArticleComment> getCommsByArticleId(Long articleId);
}
