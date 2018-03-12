package com.zjnu.controller.font;

import com.zjnu.model.Article;
import com.zjnu.model.ArticleComment;
import com.zjnu.model.User;
import com.zjnu.pojo.ArticleAttachPojo;
import com.zjnu.pojo.ArticleDetail;
import com.zjnu.service.ArticleAttachService;
import com.zjnu.service.ArticleCommentService;
import com.zjnu.service.ArticleService;
import com.zjnu.service.UserService;
import com.zjnu.utils.ConstantPara;
/*import kafka.javaapi.producer.Producer;
import kafka.producer.KeyedMessage;
import kafka.producer.ProducerConfig;*/
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
@Controller
public class ArticleController {
    private static final Logger log = Logger.getLogger(ArticleController.class);
    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;
    @Resource
    private ArticleCommentService articleCommentService;
    @Resource
    private ArticleAttachService articleAttachService;
    private final String topic = ConstantPara.KAFKA_TOPICS;


    /*@RequestMapping("/produce/{userId}/{articleId}")
    @ResponseBody
    public String produce(@PathVariable("userId") Integer userId, @PathVariable("articleId") Integer articleId) {
        NewClickEvent[] newClickEvents = new NewClickEvent[]{
                new NewClickEvent(userId, articleId),
        };
        Properties props = new Properties();
        props.put("metadata.broker.list", ConstantPara.KAFKA_ADDR);
        props.put("serializer.class", "kafka.serializer.StringEncoder");
        props.put("producer.type", "async");
        ProducerConfig conf = new ProducerConfig(props);
        Producer<Integer, String> producer = null;
        try {
            System.out.println("Producing messages");
            producer = new Producer<>(conf);
            for (NewClickEvent event : newClickEvents) {
                String eventAsStr = JSON.toJSONString(event);
                producer.send(new KeyedMessage<Integer, String>(
                        this.topic, eventAsStr));
                System.out.println("Sending messages:" + eventAsStr);

            }
            System.out.println("Done sending messages");
        } catch (Exception ex) {
            log.fatal("Error while producing messages", ex);
            log.trace(null, ex);
            System.err.println("Error while producing messages：" + ex);
        } finally {
            if (producer != null) producer.close();
        }

        return "ok";
    }*/

    @ResponseBody
    @RequestMapping("/loadTime")
    public void loadTime(Integer userId,String times) {
        if (userId.equals("") || userId == null) {
            log.info("无Session");
        }
        else
            log.info(userId + "|||" + times);
    }
    @RequestMapping("/toarticle/{articleId}")
    public String article(@PathVariable("articleId") Integer articleId, Model model) {

        ArticleDetail articleDetail = new ArticleDetail();
        try {
            //文章详细
            Article one = articleService.getOne(Long.valueOf(articleId));
            articleDetail.setArticle(one);
            //人信息
            Long userId = one.getUserId();
            User userById = userService.getUserById(userId);
            articleDetail.setUser(userById);
            //评论
            List<ArticleComment> commsByArticleId = articleCommentService.getCommsByArticleId(Long.valueOf(articleId));
            articleDetail.setArticleComments(commsByArticleId);
            //tag
            ArticleAttachPojo oneByArticleId = articleAttachService.getOneByArticleId(Long.valueOf(articleId));
            articleDetail.setArticleAttachPojo(oneByArticleId);
            model.addAttribute("state", 1);
            model.addAttribute("articleDetail", articleDetail);
            return "font/article";
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("state", 0);
        return "font/article";
    }

    //kind = zanPlus,zanMinus
    //kind = caiPlus,caiMinus
    @RequestMapping("/zanOrCai/{articleId}/{opKind}/{orNumber}")
    @ResponseBody
    public Integer zanOrCai(@PathVariable("articleId") Integer articleId, @PathVariable("opKind") String opKind, @PathVariable("orNumber") Integer orNumber) {
        Article article = new Article();
        article.setArticleId(Long.valueOf(articleId));
        if (opKind.equalsIgnoreCase("zanPlus")) {
            article.setArticleUp(orNumber + 1);
            orNumber += 1;
        }
        if (opKind.equalsIgnoreCase("zanMinus")) {
            article.setArticleUp(orNumber - 1);
            orNumber -= 1;

        }
        if (opKind.equalsIgnoreCase("caiPlus")) {
            article.setArticleDown(orNumber + 1);
            orNumber += 1;
        }

        if (opKind.equalsIgnoreCase("caiMinus")) {
            article.setArticleDown(orNumber + 1);
            orNumber -= 1;
        }
        articleService.updateOne(article);
        return orNumber;
    }


}



/*package com.zjnu

import com.alibaba.fastjson.JSON
import com.hmz.pojo.NewClickEvent
import com.hmz.redis.JedisUtil
import com.hmz.utils.ConstantPara
import kafka.serializer.StringDecoder
import org.apache.spark.SparkConf
import org.apache.spark.streaming._
import org.apache.spark.streaming.kafka._

object RealtimeRecommender {
  def main(args: Array[String]) {

    val Array(brokers, topics) = Array(ConstantPara.KAFKA_ADDR, ConstantPara.KAFKA_TOPICS)
    System.setProperty("hadoop.home.dir", "E:\\software\\hadoop-common-2.2.0")
    // Create context with 2 second batch interval
    val sparkConf = new SparkConf().setMaster("local[2]").setAppName("RealtimeRecommender")
    val ssc = new StreamingContext(sparkConf, Seconds(2))

    // Create direct kafka stream with brokers and topics
    val topicsSet = topics.split(",").toSet
    val kafkaParams = Map[String, String](
      "metadata.broker.list" -> brokers,
      "auto.offset.reset" -> "smallest")
    val messages = KafkaUtils.createDirectStream[String, String, StringDecoder, StringDecoder](
      ssc, kafkaParams, topicsSet)

    messages.map(_._2).map{ event =>
      JSON.parseObject(event, classOf[NewClickEvent])
    }.mapPartitions { iter =>
      val jedis = JedisUtil.getJedis
      iter.map { event =>
        println("NewClickEvent" + event)
        val userId = event.asInstanceOf[NewClickEvent].getUserId
        val itemId = event.asInstanceOf[NewClickEvent].getItemId
        val key = "II:" + itemId
        val value = jedis.get(key)
        jedis.set("RUI:" + userId, value)
        println("Recommend to user:" + userId + ", items:" + value)
      }
    }.print()
    // Start the computation
    ssc.start()
    ssc.awaitTermination()
  }
}
*/
