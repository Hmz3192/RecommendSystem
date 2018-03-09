package com.hmz.dao;

import com.hmz.model.ArticleRating;
import com.hmz.model.ArticleRatingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleRatingMapper {
    long countByExample(ArticleRatingExample example);

    int deleteByExample(ArticleRatingExample example);

    int insert(ArticleRating record);

    int insertSelective(ArticleRating record);

    List<ArticleRating> selectByExample(ArticleRatingExample example);

    int updateByExampleSelective(@Param("record") ArticleRating record, @Param("example") ArticleRatingExample example);

    int updateByExample(@Param("record") ArticleRating record, @Param("example") ArticleRatingExample example);
}