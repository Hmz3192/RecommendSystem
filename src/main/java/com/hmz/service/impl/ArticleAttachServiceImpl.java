package com.hmz.service.impl;

import com.hmz.dao.ArticleAttachMapper;
import com.hmz.model.ArticleAttach;
import com.hmz.model.ArticleAttachExample;
import com.hmz.pojo.ArticleAttachPojo;
import com.hmz.service.ArticleAttachService;
import com.hmz.utils.StringUtil;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
@Service
@Transactional
public class ArticleAttachServiceImpl implements ArticleAttachService {

    @Resource
    private ArticleAttachMapper articleAttachMapper;

    @Cacheable(value = "ArticleAttachCache")
    @Override
    public ArticleAttachPojo getOneByArticleId(Long articleID) {
        ArticleAttachPojo articleAttachPojo = new ArticleAttachPojo();
        ArticleAttachExample example = new ArticleAttachExample();
        ArticleAttachExample.Criteria criteria = example.createCriteria();
        criteria.andArticleIdEqualTo(articleID);
        List<ArticleAttach> articleAttaches = articleAttachMapper.selectByExample(example);
        articleAttachPojo.setArticleAttach(articleAttaches.get(0));
        articleAttachPojo.setTags(StringUtil.ConvertStringToList(articleAttaches.get(0).getTags()));
//        articleAttachPojo.setPics(StringUtil.ConvertStringToList(articleAttaches.get(0).getPics()));
        return articleAttachPojo;
    }

    @Override
    public void saveAttache(ArticleAttach articleAttach) {
        ArticleAttachExample example0 = new ArticleAttachExample();
        ArticleAttachExample.Criteria criteria0 = example0.createCriteria();
        criteria0.andArticleIdEqualTo(articleAttach.getArticleId());
        List<ArticleAttach> articleAttaches = articleAttachMapper.selectByExample(example0);
        if (articleAttaches.size() > 0) {
            //更新保存
            ArticleAttachExample example = new ArticleAttachExample();
            ArticleAttachExample.Criteria criteria = example.createCriteria();
            criteria.andArticleIdEqualTo(articleAttach.getArticleId());
            articleAttachMapper.updateByExample(articleAttach, example);
        } else {
            //插入保存
            articleAttachMapper.insert(articleAttach);
        }
    }

    @Override
    public void insertAttache(ArticleAttach articleAttach) {
        articleAttachMapper.insertSelective(articleAttach);
    }
}
