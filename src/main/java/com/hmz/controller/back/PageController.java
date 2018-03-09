package com.hmz.controller.back;

import com.alibaba.fastjson.JSON;
import com.hmz.model.ArticleRating;
import com.hmz.pojo.RecommendedItems;
import com.hmz.recomm.common.ItemSimilarity;
import com.hmz.recomm.offline.GroupLensDataModel;
import com.hmz.recomm.offline.ItemsSimilarityRedisWriter;
import com.hmz.recomm.offline.UserItemSimilarityRedisWriter;
import com.hmz.redis.JedisUtil;
import com.hmz.service.RatingService;
import com.hmz.utils.FileUtil;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.precompute.MultithreadedBatchItemSimilarities;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.similarity.precompute.BatchItemSimilarities;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.*;
import java.util.*;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/1.
 */
@Controller
public class PageController {
    @Resource
    private RatingService ratingService;

    @RequestMapping("/b")
    public String toBack() throws IOException {

//        System.out.println(Runtime.getRuntime().availableProcessors());
      /*  String path = "E:\\WorkSpace\\Idea\\mahout\\src\\main\\resources\\resources\\ratings.dat";
        File file = new File(path);
        if (!file.exists() || file.isDirectory()) ;
        BufferedReader br = new BufferedReader(new FileReader(file));
        String temp = null;
        temp = br.readLine();
        while (temp != null) {
            String[] split = temp.split("::");
            ArticleRating articleRating = new ArticleRating();
            articleRating.setUserId(Long.valueOf(split[0]));
            articleRating.setArticleId(Long.valueOf(split[1]));
            articleRating.setRating(Float.valueOf(split[2]));
            ratingService.insertOneRating(articleRating);
            temp = br.readLine();
        }*/
        return "back/main";
    }

    @RequestMapping("/adver")
    public String adver() {
        return "back/adver";
    }

    @RequestMapping("/addAdver")
    public String addAdver() {
        return "back/addAdver";
    }


    @RequestMapping("/article")
    public String article() {
        return "back/article";
    }

    @RequestMapping("/articleComments")
    public String articleComments() {
        return "back/articleComments";
    }

    @RequestMapping("/articleKind")
    public String articleKind() {
        return "back/articleKind";
    }

    @RequestMapping("/chart")
    public String chart() {
        return "back/chart";
    }

    @RequestMapping("/manager")
    public String manager() {
        return "back/manager";
    }

    @RequestMapping("/mesboard")
    public String mesboard() {
        return "back/mesboard";
    }

    @RequestMapping("/permission")
    public String permission() {
        return "back/permission";
    }

    @RequestMapping("/role")
    public String role() {
        return "back/role";
    }

    @RequestMapping("/user")
    public String user() {
        return "back/user";
    }

    @RequestMapping("/vip")
    public String vip() {
        return "back/vip";
    }


    @RequestMapping("/offline")
    @ResponseBody
    public String offlinerec() throws Exception{
        final List<ArticleRating> articleRating = ratingService.getArticleRating();
        File file = FileUtil.write2Dat(articleRating);
        DataModel model = new GroupLensDataModel(file);
                try {
                    UserItemSimilarityRedisWriter userItemSimilarityTableRedisWriter =
                            new UserItemSimilarityRedisWriter(model);
                    userItemSimilarityTableRedisWriter.storeToRedis();

                    ItemBasedRecommender recommender = new GenericItemBasedRecommender(model,new LogLikelihoodSimilarity(model));

                    BatchItemSimilarities batch = new MultithreadedBatchItemSimilarities(recommender, 10);

                    int numSimilarities = batch.computeItemSimilarities(Runtime.getRuntime().availableProcessors(), 1,
                            new ItemsSimilarityRedisWriter());

                    System.out.println("Computed " + numSimilarities + " similarities for " + model.getNumItems() + " items "
                            + "and saved them to redis");

                    userItemSimilarityTableRedisWriter.waitUtilDone();
                } catch (Exception e) {
                    e.printStackTrace();
                }
        System.out.println("推出成功--------------------");

        return "ok";
    }

    @RequestMapping("/rec/{userId}")
    @ResponseBody
    public RecommendedItems getRecom(@PathVariable("userId") Integer userId)throws Exception{
        RecommendedItems recommendedItems = new RecommendedItems();

        // Stage 1: get user's items
        String key = String.format("UI:%s", userId);
        String value = JedisUtil.getJedis().get(key);

        if(value == null || value.length() <= 0) {
            return recommendedItems;
        }

        List<Long> userItems = JSON.parseArray(value, Long.class);
        Set<Long> userItemsSet = new TreeSet<Long>(userItems);

        // Stage 2: get similar items to the user's items
        List<String> userItemStrs = new ArrayList<>();
        for(Long item: userItems) {
            userItemStrs.add("II:" + item);
        }

        List<String> similarItems = JedisUtil.getJedis().mget(userItemStrs.toArray(new String[userItemStrs.size()]));
        Set<ItemSimilarity> similarItemsSet = new TreeSet<>();
        int i = 0;
        for(String item: similarItems) {
            i++;
            if (item == null || item.length() == 0) {
                System.out.println("cuowu zai "+i);
                continue;
            } else {
                String s = item.replaceAll(",null", "");
                List<ItemSimilarity> result = JSON.parseArray(s, ItemSimilarity.class);
                similarItemsSet.addAll(result);
            }

        }

        List<Long> recommendedItemIDs = new ArrayList<>();
        Map similarity = new HashMap();
        for(ItemSimilarity item: similarItemsSet) {
            if(!userItemsSet.contains(item.getId())) {
                recommendedItemIDs.add((item.getId()));
                similarity.put(item.getId(), item.getS());
            }
            if(recommendedItemIDs.size() >= 100)
                break;
        }
        recommendedItems.setItems(recommendedItemIDs.toArray(new Long[0]));
        recommendedItems.setSimilarity(similarity);

        return recommendedItems;

    }
}
