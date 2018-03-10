package com.hmz.service;

import com.hmz.model.ArticleAttach;
import com.hmz.pojo.ArticleAttachPojo;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public interface ArticleAttachService {

    ArticleAttachPojo getOneByArticleId(Long articlID);

    void saveAttache(ArticleAttach articleAttach);

    void insertAttache(ArticleAttach articleAttach);
}
