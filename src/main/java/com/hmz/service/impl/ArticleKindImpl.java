package com.hmz.service.impl;

import com.hmz.dao.ArticleKindMapper;
import com.hmz.model.ArticleKind;
import com.hmz.model.ArticleKindExample;
import com.hmz.service.ArticleKindService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/24.
 */
@Service
@Transactional
public class ArticleKindImpl implements ArticleKindService {
    @Resource
    private ArticleKindMapper articleKindMapper;

    @Cacheable(value = "ArticleKindCache")
    @Override
    public List<ArticleKind> getAllPKind() {
        ArticleKindExample example = new ArticleKindExample();
        ArticleKindExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(0);
        return articleKindMapper.selectByExample(example);
    }

    @Cacheable(value = "ArticleKindCache")
    @Override
    public List<ArticleKind> getChildKind(String PName) {
        ArticleKindExample example = new ArticleKindExample();
        ArticleKindExample.Criteria criteria = example.createCriteria();
        criteria.andKindNameEqualTo(PName);
        List<ArticleKind> ParticleKinds = articleKindMapper.selectByExample(example);
        ArticleKindExample example2 = new ArticleKindExample();
        ArticleKindExample.Criteria criteria2 = example2.createCriteria();
        criteria2.andParentIdEqualTo(ParticleKinds.get(0).getKindId());
        List<ArticleKind> CParticleKinds = articleKindMapper.selectByExample(example2);

        return CParticleKinds;
    }

    @Override
    public List<ArticleKind> getPCKind(Integer Pid, Integer Cid) {
        ArticleKind articleKind = articleKindMapper.selectByPrimaryKey(Pid);
        ArticleKind articleKind1 = articleKindMapper.selectByPrimaryKey(Cid);
        List<ArticleKind> articleKinds = new ArrayList<ArticleKind>();
        articleKinds.add(articleKind);
        articleKinds.add(articleKind1);
        return articleKinds;
    }

}
