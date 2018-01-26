package com.hmz.dao;

import com.hmz.model.ArticleKind;
import com.hmz.model.ArticleKindExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleKindMapper {
    long countByExample(ArticleKindExample example);

    int deleteByExample(ArticleKindExample example);

    int deleteByPrimaryKey(Integer kindId);

    int insert(ArticleKind record);

    int insertSelective(ArticleKind record);

    List<ArticleKind> selectByExample(ArticleKindExample example);

    ArticleKind selectByPrimaryKey(Integer kindId);

    int updateByExampleSelective(@Param("record") ArticleKind record, @Param("example") ArticleKindExample example);

    int updateByExample(@Param("record") ArticleKind record, @Param("example") ArticleKindExample example);

    int updateByPrimaryKeySelective(ArticleKind record);

    int updateByPrimaryKey(ArticleKind record);
}