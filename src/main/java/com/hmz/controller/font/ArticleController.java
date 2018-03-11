package com.hmz.controller.font;

import com.alibaba.fastjson.JSON;
import com.hmz.model.Article;
import com.hmz.model.ArticleComment;
import com.hmz.model.User;
import com.hmz.pojo.ArticleAttachPojo;
import com.hmz.pojo.ArticleDetail;
import com.hmz.pojo.NewClickEvent;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.ArticleCommentService;
import com.hmz.service.ArticleService;
import com.hmz.service.UserService;
import com.hmz.utils.ConstantPara;
import kafka.javaapi.producer.Producer;
import kafka.producer.KeyedMessage;
import kafka.producer.ProducerConfig;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Properties;

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


    @RequestMapping("/produce/{userId}/{articleId}")
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
