package com.hmz.dao;

import com.hmz.model.ArticleAttach;
import com.hmz.model.ArticleAttachExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleAttachMapper {
    long countByExample(ArticleAttachExample example);

    int deleteByExample(ArticleAttachExample example);

    int insert(ArticleAttach record);

    int insertSelective(ArticleAttach record);

    List<ArticleAttach> selectByExample(ArticleAttachExample example);

    int updateByExampleSelective(@Param("record") ArticleAttach record, @Param("example") ArticleAttachExample example);

    int updateByExample(@Param("record") ArticleAttach record, @Param("example") ArticleAttachExample example);
}