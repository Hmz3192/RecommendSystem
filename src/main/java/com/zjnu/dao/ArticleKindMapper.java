package com.zjnu.dao;

import com.zjnu.model.ArticleKind;
import com.zjnu.model.ArticleKindExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleKindMapper {
    long countByExample(ArticleKindExample example);

    int deleteByExample(ArticleKindExample example);

    int deleteByPrimaryKey(Long kindId);

    int insert(ArticleKind record);

    int insertSelective(ArticleKind record);

    List<ArticleKind> selectByExample(ArticleKindExample example);

    ArticleKind selectByPrimaryKey(Long kindId);

    int updateByExampleSelective(@Param("record") ArticleKind record, @Param("example") ArticleKindExample example);

    int updateByExample(@Param("record") ArticleKind record, @Param("example") ArticleKindExample example);

    int updateByPrimaryKeySelective(ArticleKind record);

    int updateByPrimaryKey(ArticleKind record);
}