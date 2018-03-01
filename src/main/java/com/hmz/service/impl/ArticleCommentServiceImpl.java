package com.hmz.service.impl;

import com.hmz.dao.ArticleCommentMapper;
import com.hmz.model.ArticleComment;
import com.hmz.model.ArticleCommentExample;
import com.hmz.service.ArticleCommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
@Service
@Transactional
public class ArticleCommentServiceImpl  implements ArticleCommentService{

    @Resource
    private ArticleCommentMapper articleCommentMapper;

    @Override
    public List<ArticleComment> getCommsByArticleId(Integer articleId) {
        ArticleCommentExample articleCommentExample = new ArticleCommentExample();
        ArticleCommentExample.Criteria criteria = articleCommentExample.createCriteria();
        criteria.andArticleIdEqualTo(articleId);
        List<ArticleComment> articleComments = articleCommentMapper.selectByExample(articleCommentExample);
        if (articleComments.size() > 0) {
            return articleComments;
        }
        return null;
    }
}
