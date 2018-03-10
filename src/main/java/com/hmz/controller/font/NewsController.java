package com.hmz.controller.font;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hmz.model.Article;
import com.hmz.pojo.PageResult;
import com.hmz.pojo.RecommendedItems;
import com.hmz.recomm.common.ItemSimilarity;
import com.hmz.redis.JedisUtil;
import com.hmz.service.ArticleKindService;
import com.hmz.service.ArticleService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

@Controller
public class NewsController {

    public static Logger logger = Logger.getLogger(NewsController.class);

    @Resource
    private ArticleKindService articleKindService;

    @Resource
    private ArticleService articleService;


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

    @ResponseBody
    @RequestMapping(value = "/loadRecom")
    public PageResult loadRecom(int userId,int currentPage,int rows) {

        PageResult pageResult;
        RecommendedItems recommendedItems = new RecommendedItems();

        // Stage 1: get user's items
        String key = String.format("UI:%s", userId);
        String value = JedisUtil.getJedis().get(key);

        if(value == null || value.length() <= 0) {
            return new PageResult();
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

        Long[] items = recommendedItems.getItems();
        logger.info("当前页为===="+currentPage);
        PageHelper.startPage(currentPage, rows);
        List<Article> articles = articleService.selectByArray(items);
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        }else
            total = info.getTotal() / rows + 1;
        pageResult = new PageResult(total, articles, currentPage);
        return pageResult;
    }

    @ResponseBody
    @RequestMapping(value = "/json")
    public PageResult ajaxLoad(int currentPage, int rows) {
        logger.info("当前页为===="+currentPage);
        PageHelper.startPage(currentPage, rows);
        List<Article> articles = articleService.selectAllArticle();
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        }else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, articles, currentPage);

        return pageResult;
    }


    @ResponseBody
    @RequestMapping(value = "/rewen")
    public PageResult rewen() {
        PageHelper.startPage(1, 5);
        List<Article> articles = articleService.selectFirstFiveArticle();
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % 5 == 0) {
            total = info.getTotal() / 5;
        }else
            total = info.getTotal() / 5 + 1;
        PageResult pageResult = new PageResult(total, articles, 1);

        return pageResult;
    }

    @RequestMapping(value = "/search")
    public String search(String input) {
        System.out.println(input);
        return "font/search";
    }

}
