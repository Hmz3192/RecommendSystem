package com.zjnu.recomm.youkeRec;

import com.zjnu.model.ArticleRating;
import com.zjnu.recomm.booleanrec.MovieLensDataModel;
import com.zjnu.utils.FileUtil;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.precompute.FileSimilarItemsWriter;
import org.apache.mahout.cf.taste.impl.similarity.precompute.MultithreadedBatchItemSimilarities;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.precompute.BatchItemSimilarities;
import org.apache.mahout.cf.taste.similarity.precompute.SimilarItemsWriter;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class ItemRec {
    //基于物品的推荐
    public static Long[] itemRec(Set<Long> itemIds, List<ArticleRating> articleRating) throws Exception{
        Long[] recitems = new Long[30];

//        File resultFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\RecommendSystem\\src\\main\\resources\\itemRec.dat");
        File resultFile = new File(System.getProperty("java.io.tmpdir"), "itemRec.dat");

        long[] itemsLong = new long[itemIds.size()];
        Iterator<Long> it = itemIds.iterator();
        int i = 0;
        while (it.hasNext()) {
            long str = it.next();
            itemsLong[i] = str;
            i++;
        }
        DataModel dataModel = new MovieLensDataModel(FileUtil.write2Dat(articleRating, resultFile));
        ItemSimilarity similarity = new LogLikelihoodSimilarity(dataModel);
        ItemBasedRecommender recommender = new GenericItemBasedRecommender(dataModel, similarity);

//            BatchItemSimilarities batchItemSimilarities = new MultithreadedBatchItemSimilarities(recommender, 5);
        List<RecommendedItem> recommendedItems = recommender.mostSimilarItems(itemsLong, 30);
//            SimilarItemsWriter writer = new FileSimilarItemsWriter(resultFile);
//            int numSimilarites = batchItemSimilarities.computeItemSimilarities(Runtime.getRuntime().availableProcessors(), 1, writer);
//            System.out.println("Computed " + numSimilarites + " for " + dataModel.getNumItems() + " items and saved them to " + resultFile.getAbsolutePath());
        int j = 0;
        for (RecommendedItem recommendedItem : recommendedItems) {
            recitems[j] = recommendedItem.getItemID();
            j++;
        }
        return recitems;
       }
}
