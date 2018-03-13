
package com.zjnu.recomm.offline;

import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.precompute.MultithreadedBatchItemSimilarities;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.similarity.precompute.BatchItemSimilarities;
import org.junit.Test;

import java.io.File;

/**
 * generate item-item similarity table & user-item table, and insert into redis
 *
 */
public final class SimilarityTablesGenerator {

  public SimilarityTablesGenerator() {}

  @Test
  public void write2Redis()  throws Exception {
/*
    if (args.length != 1) {
      System.err.println("Need path to ratings.dat of the movielens1M dataset as argument!");
      System.exit(-1);
    }
*/
    DataModel dataModel = new GroupLensDataModel(new File("E:\\WorkSpace\\Idea\\mahout\\src\\main\\resources\\resources\\ratings.dat"));
    UserItemSimilarityRedisWriter userItemSimilarityTableRedisWriter =
        new UserItemSimilarityRedisWriter(dataModel);
    userItemSimilarityTableRedisWriter.storeToRedis();

    ItemBasedRecommender recommender = new GenericItemBasedRecommender(dataModel,
        new LogLikelihoodSimilarity(dataModel));

    BatchItemSimilarities batch = new MultithreadedBatchItemSimilarities(recommender, 100);

    int numSimilarities = batch.computeItemSimilarities(Runtime.getRuntime().availableProcessors(), 1,
        new ItemsSimilarityRedisWriter());

    System.out.println("Computed " + numSimilarities + " similarities for " + dataModel.getNumItems() + " items "
        + "and saved them to redis");

    userItemSimilarityTableRedisWriter.waitUtilDone();
  }

}
