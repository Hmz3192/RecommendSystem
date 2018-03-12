package com.zjnu.recomm.booleanrec;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.model.DataModel;

import java.io.File;
import java.io.IOException;

public class BXBooleanRecommenderEvaluator {
    private BXBooleanRecommenderEvaluator(){
    }

    public static void main(String[] args) throws IOException, TasteException {
/*
        DataModel dataModel = new BXDataModel(new File(args[0]), true);
        RecommenderIRStatsEvaluator evaluator = new GenericRecommenderIRStatsEvaluator();
        //推荐3个 1.0 全部数据
        IRStatistics stats = evaluator.evaluate(new BXBooleanRecommenderBuilder(), new BXDataModelBuilder(), dataModel, null, 3, Double.NEGATIVE_INFINITY, 1.0);

        System.out.println("Precision is "+stats.getPrecision()+"; Recall is "+stats.getRecall()+"; F1 is"+stats.getF1Measure());
*/
        String path = "F:\\vedio\\推荐系统\\课件文档代码\\课件文档代码\\数据包\\Book-Crossing\\BX-Book-Ratings.csv";
        DataModel dataModel = new BXDataModel(new File(path), true);
        //均方差
        RecommenderEvaluator evaluator = new AverageAbsoluteDifferenceRecommenderEvaluator();
        //0.9 训练集 0.3 测试集
        double score = evaluator.evaluate(new BXBooleanRecommenderBuilder(),null , dataModel, 0.9, 0.3);

        System.out.println("MAE score is "+score);
    }
}
