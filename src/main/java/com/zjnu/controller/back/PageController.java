package com.zjnu.controller.back;

import com.zjnu.model.Article;
import com.zjnu.model.ArticleAttach;
import com.zjnu.model.ArticleRating;
import com.zjnu.model.User;
import com.zjnu.pojo.ReArticle;
import com.zjnu.recomm.offline.GroupLensDataModel;
import com.zjnu.recomm.offline.ItemsSimilarityRedisWriter;
import com.zjnu.recomm.offline.UserItemSimilarityRedisWriter;
import com.zjnu.service.*;
import com.zjnu.utils.FileUtil;
import net.sf.json.JSONObject;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.precompute.MultithreadedBatchItemSimilarities;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.similarity.precompute.BatchItemSimilarities;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/1.
 */
@Controller
public class PageController {
    @Resource
    private RatingService ratingService;
    @Resource
    private UserService userService;
    @Resource
    private ArticleAttachService articleAttachService;
    @Resource
    private ArticleService articleService;
    @Resource
    private ArticleRatingService articleRatingService;
    @RequestMapping("/b")
    @ResponseBody
    public String toBack() throws IOException {

//        System.out.println(Runtime.getRuntime().availableProcessors());
      /*  String path = "E:\\WorkSpace\\Idea\\mahout\\src\\main\\resources\\resources\\ratings.dat";
        File file = new File(path);
        BufferedReader br = new BufferedReader(new FileReader(file));
        String temp = null;
        temp = br.readLine();
        int i = 1;
        while (temp != null) {
            if (i == 2000) {
                break;
            }
            String[] split = temp.split("::");
            ArticleRating articleRating = new ArticleRating();
            if (Integer.valueOf(split[0]) > 18) {
                break;
            }
            articleRating.setUserId(Long.valueOf(split[0]));
            if (Integer.valueOf(split[1]) > 2067) {
                i++;
                temp = br.readLine();
                continue;
            }
            articleRating.setArticleId(Long.valueOf(split[1]));
            articleRating.setRating(Float.valueOf(split[2]));
            ratingService.insertOneRating(articleRating);
            i++;

            temp = br.readLine();
        }*/
        return "back/main";
    }



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

                    BatchItemSimilarities batch = new MultithreadedBatchItemSimilarities(recommender, 30);

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

    @RequestMapping("/insertdata")
    @ResponseBody
    public String insertdata() throws IOException {

        String path = "F:\\vedio\\推荐系统\\课件文档代码\\课件文档代码\\数据包\\MovieLens\\ml-1m\\users.dat";
        File file = new File(path);
        if (file.exists() || !file.isDirectory()) {
            BufferedReader br = new BufferedReader(new FileReader(file));
            String temp = null;
            temp = br.readLine();
            int i = 1;
            while (temp != null) {
                if (i == 500) {
                    break;
                }
                String[] split = temp.split("::");
                User user = new User();
                user.setUserId(Long.valueOf(split[0]));
                user.setUserName(split[0] + "-" + i);
                user.setPassword(split[0] + "-" + i);
                user.setEmail(split[0] + "@qq.com");

                if (split[3].equalsIgnoreCase("0")) {

                    user.setWork("未指定");
                    user.setIntroduction("我的职业是：未指定,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("1")) {

                    user.setWork("教育家");
                    user.setIntroduction("我的职业是：教育家,并且我的年龄是：" + split[2]);


                } else if (split[3].equalsIgnoreCase("2")) {

                    user.setWork("艺术家");
                    user.setIntroduction("我的职业是：艺术家,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("3")) {

                    user.setWork("文书/行政");
                    user.setIntroduction("我的职业是：文书/行政,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("4")) {

                    user.setWork("大学/研究生");
                    user.setIntroduction("我的职业是：大学/研究生,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("5")) {

                    user.setWork("客户服务");
                    user.setIntroduction("我的职业是：客户服务,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("6")) {

                    user.setWork("医生/保健");
                    user.setIntroduction("我的职业是：医生/保健,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("7")) {

                    user.setWork("执行/管理");
                    user.setIntroduction("我的职业是：执行/管理,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("8")) {

                    user.setWork("农民");
                    user.setIntroduction("我的职业是：农民,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("9")) {

                    user.setWork("家庭主妇");
                    user.setIntroduction("我的职业是：家庭主妇,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("10")) {

                    user.setWork("学生");
                    user.setIntroduction("我的职业是：学生,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("11")) {

                    user.setWork("律师");
                    user.setIntroduction("我的职业是：律师,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("12")) {

                    user.setWork("程序员");
                    user.setIntroduction("我的职业是：程序员,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("13")) {

                    user.setWork("退休");
                    user.setIntroduction("我的职业是：退休,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("14")) {

                    user.setWork("销售/营销");
                    user.setIntroduction("我的职业是：销售/营销,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("15")) {

                    user.setWork("科学家");
                    user.setIntroduction("我的职业是：科学家,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("16")) {

                    user.setWork("自营职业");
                    user.setIntroduction("我的职业是：自营职业,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("17")) {

                    user.setWork("技术员/工程师");
                    user.setIntroduction("我的职业是：技术员/工程师,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("18")) {

                    user.setWork("商人和工匠");
                    user.setIntroduction("我的职业是：商人和工匠,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("19")) {

                    user.setWork("失业");
                    user.setIntroduction("我的职业是：失业,并且我的年龄是：" + split[2]);

                } else if (split[3].equalsIgnoreCase("20")) {

                    user.setWork("作者");
                    user.setIntroduction("我的职业是：作者,并且我的年龄是：" + split[2]);

                }

                user.setAge(Integer.valueOf(split[2]));
                if (split[1].equalsIgnoreCase("M")) {
                    user.setSex(1);
                } else {
                    user.setSex(0);
                }
                user.setLocation("湖北省武汉市江岸区");
                user.setAvatar("resource/sy-img/touxiang.jpg");
                user.setPhone("15558680172");
                user.setVip(1);
                userService.insertUser(user);
                i++;
                temp = br.readLine();
            }
        }
        return "ok";

    }

    private static String sendPost2(String urlStr) throws Exception {

        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setConnectTimeout(5000);
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setRequestMethod("GET");

//        OutputStream os = conn.getOutputStream();
//        os.write(dataJSON.getBytes("UTF-8"));
//        os.close();

        // read the response
        InputStream in = new BufferedInputStream(conn.getInputStream());
        String result = new BufferedReader(new InputStreamReader(in)) .lines().collect(Collectors.joining("\n"));

        in.close();
        conn.disconnect();

        return result;

    }
    @ResponseBody
    @RequestMapping("/insertRating")
    public String insertRating() throws Exception{
        String path = "E:\\WorkSpace\\IdeaWorkSpace\\RecommendSystem\\src\\main\\resources\\rating2.base";
        File file = new File(path);
        if (file.exists() || !file.isDirectory()) {
            BufferedReader br = new BufferedReader(new FileReader(file));
            String temp = null;
            temp = br.readLine();
            while (temp != null) {
                ArticleRating articleRating = new ArticleRating();
                temp=temp.replaceAll("\\s+"," ");
                String[] split = temp.split(" ");
                articleRating.setUserId(Long.valueOf(split[0]));
                articleRating.setArticleId(Long.valueOf(split[1]));
                articleRating.setRating(Float.valueOf(split[2]));
                articleRatingService.insertOneorUpdate(articleRating);

                temp = br.readLine();

            }
        }



          /*  for(int m = 0;m<types.length;m++) {
                types[m] = types[m].replaceAll(" ", "");
                if (types[m].equalsIgnoreCase("Action")) {
                    types[m] = "动作";
                } else if (types[m].equalsIgnoreCase("Adventure")) {
                    types[m] = "冒险";
                }else if (types[m].equalsIgnoreCase("Animation")) {
                    types[m] = "动画";
                }else if (types[m].equalsIgnoreCase("Children's")) {
                    types[m] = "儿童";
                }else if (types[m].equalsIgnoreCase("Comedy")) {
                    types[m] = "喜剧";
                }else if (types[m].equalsIgnoreCase("Crime")) {
                    types[m] = "犯罪";
                }else if (types[m].equalsIgnoreCase("Documentary")) {
                    types[m] = "纪录";
                }else if (types[m].equalsIgnoreCase("Drama")) {
                    types[m] = "戏剧";
                }else if (types[m].equalsIgnoreCase("Fantasy")) {
                    types[m] = "幻想";
                }else if (types[m].equalsIgnoreCase("Film-Noir")) {
                    types[m] = "黑色电影";
                }else if (types[m].equalsIgnoreCase("Horror")) {
                    types[m] = "恐怖";
                }else if (types[m].equalsIgnoreCase("Musical")) {
                    types[m] = "音乐";
                }else if (types[m].equalsIgnoreCase("Mystery")) {
                    types[m] = "神秘";
                }else if (types[m].equalsIgnoreCase("Romance")) {
                    types[m] = "浪漫";
                }else if (types[m].equalsIgnoreCase("Sci-Fi")) {
                    types[m] = "科幻";
                }else if (types[m].equalsIgnoreCase("Thriller")) {
                    types[m] = "惊悚";
                }else if (types[m].equalsIgnoreCase("War")) {
                    types[m] = "战争";
                }else if (types[m].equalsIgnoreCase("Western")) {
                    types[m] = "西方";
                }
            }
            Article article = new Article();
            ArticleAttach articleAttach = new ArticleAttach();


            article.setArticleId(Long.valueOf(split[0]));
            article.setArticleTitle(split[1]);
            article.setArticleContent("<p class=\"text-big-title\" style=\"font-size:20px;font-weight:700;color:#A41D1D;font-family:Arial, 微软雅黑, &quot;text-align:justify;background-color:#FFFFFF;\">\t一、超级物种是什么？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t北京地铁6号线常营站东南口出来，就是长楹天街购物中心。购物中心位于北京东五环以东，偏中高档，餐饮占了两成。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t沿着商场通道往东，走到尽头，右侧是超级物种的广告：一张实木桌子，四周摆放着鱼、龙虾、螃蟹、水果、鲜贝、牛羊肉等生鲜，正中间是四个大字“超级物种”，下面跟着两个绿色的英文单词“Future Supermarket”。行人偶尔会停下脚步，看着墙上的广告，发出疑问：“超级物种是什么？”</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t超级物种是永辉的新业务，高端超市、高端餐饮和永辉生活App的综合体，对标提倡慢生活的意大利超市餐厅Eataly，但面积和SKU不到Eataly的十分之一。 超级物种以生鲜售卖和烹饪为主，80%的生鲜和商品靠进口，食材新鲜，周转率高，店面的装修也更符合年轻一代的审美。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t永辉创办于2001年，是中国超市的标杆，现在创办者试图让这头大象变成猎豹。在探索出红标店、绿标店、精标店和会员店之后，2017年1月1日在福州开了第一家超级物种，到年底时开了26家门店，福州7家，深圳6家，成都3家，北京、上海、厦门、南京各2家，杭州和重庆各1家。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t2017年夏天，新经济100人创始人兼CEO李志刚和超级物种缔造者、永辉超市CEO张轩宁有过一次对话，提到：&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：超级物种是什么？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：又像餐厅，又像超市，又像仓库。做成功了叫超级物种，不成功叫四不像。 早上当早餐，中午当正餐，晚上再当正餐，再晚一些，就当酒吧。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：吃一顿要花多少？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：人均消费200元。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：你的坪效是多少？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：现在开了几家店，能做到15万元/年。目前中国超市的坪效1.5万元/年，便利店能做到5万元/年，超级物种的坪效突破了最高记录。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：那利润太高了，一定是在繁华区域。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：社区在试，写字楼在试，购物中心也在试，我现在都在测试。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t2017年，超级物种在北京开了两家店，9月底第一家店在石景山鲁谷开业，12月底第二家店在朝阳长楹天街开业。两家店一东一西，但都紧随永辉超市。鲁谷店开在永辉超市红标店的一层，长楹天街店离永辉超市绿标店不到500米。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t相比于鲁谷店，长楹天街店面积更大，约为1000平方米，SKU也更丰富<span class=\"text-remarks\" style=\"color:#999999;line-height:30px;\">（SKU超过750个，其中200多个为零食和酒饮）</span>。</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t长楹天街店呈长方形布局，健康生活有机馆、花艺馆、麦子工坊、鲑鱼工坊、波龙工坊、盒牛工坊和咏悦汇排在四周，店面中央是用餐区，可同时容纳300人用餐，大约占了一半的面积。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<img src=\"/attached/kindEditor/image/20180127/20180127190811_885.jpg\" alt=\"\" /></p>");
            String s = "";
            if (types.length > 0) {
                for (int j = 0; j<types.length;j++) {
                    if (j == types.length - 1) {
                        s = s + types[j];
                    } else {
                        s = s + types[j] + ",";
                    }
                }
                articleAttach.setTags(s);
                articleAttach.setTagNumber(types.length);
                articleAttach.setArticleId(Long.valueOf(split[0]));
                articleAttachService.insertAttache(articleAttach);
            }else {
                articleAttach.setTagNumber(0);
                articleAttach.setArticleId(Long.valueOf(split[0]));
                articleAttachService.insertAttache(articleAttach);
            }
            if (types.length > 0) {
                article.setKindParentName(types[0]);
                if (types.length > 1) {
                    article.setKindChildName(types[1]);
                }
            }

            article.setUserId(Long.valueOf(1));

            article.setArticleSummary("本文作者用了180天对永辉进行了深度调研，将超级物种和盒马鲜生进行比较。最后得出结论：不管是有人便利店，还是生鲜生活超市，未来的挑战或者核心竞争力主要来自两个方面： 一，供应链；二，团队管理。");
            Random random = new Random();
            article.setArticleHints(random.nextInt(10000));

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
            article.setReleaseTime(df.format(new Date()));
            article.setCheckUp(1);

            article.setArticleCollection(random.nextInt(2000));
            article.setArticleUp(random.nextInt(10000));
            article.setArticleDown(random.nextInt(10000));
            article.setArticleState("已发布");
            article.setArticleAvatar("/attached/cover/20180127/20180127190816_30.jpg");
            article.setArticleFirst(0);
            int k = random.nextInt(10000);
            if (k > 7000) {
                article.setArticleBig(1);
            }else
                article.setArticleBig(0);
            articleService.insertone(article);*/
        return "ok";
    }

    @ResponseBody
    @RequestMapping("/insertArticle")
    public String insertArticle() throws Exception{
        long id = 1;
        for(int i =1 ;i<11;i++) {
            String url_str = "http://www.textvalve.com/htdatasub/subscribe/articles/toPublish/v2?userId=82&size=100&rnd0.456121920803368&page=" + i;
            String result = sendPost2(url_str);
            Map classMap = new HashMap();
            classMap.put("list",ReArticle.DataBean.ListBean.class);
            JSONObject jsonObject= JSONObject.fromObject(result);
            ReArticle reArticle=(ReArticle)JSONObject.toBean(jsonObject, ReArticle.class,classMap);
            Random random = new Random();
            for(int j = 0;j<reArticle.getData().getList().size();j++) {
                Article article = new Article();
                ReArticle.DataBean.ListBean listBean = reArticle.getData().getList().get(j);
                article.setArticleId(id);
                article.setArticleTitle(listBean.getTitle());
                article.setArticleContent("<p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<div class=\"article-img-box\" style=\"text-align:center;color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\t\t<img src=\"https://img.huxiucdn.com/article/cover/201803/12/103943272635.jpg?imageView2/1/w/800/h/600/|imageMogr2/strip/interlace/1/quality/85/format/jpg\" alt=\"极米科技获超 6 亿元融资，联手百度能卖得动“投影仪”吗？\" style=\"width:auto;\" />\t</div>\t<div id=\"article_content235394\" class=\"article-content-wrap\" style=\"font-size:16px;text-align:justify;color:#303030;font-family:Arial, 微软雅黑, &quot;background-color:#FFFFFF;\">\t\t<p>\t\t\t3&nbsp;月 12&nbsp;日上午，智能投影仪厂商极米科技宣布获超 6 亿元融资，百度、经纬中国、四川文投、赛领资本、博将资本、磐霖资本、鲁信创投、基锐资本等投资机构联合投资。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t极米科技成立于 2013 年 11 月，主打产品为“无屏电视”，通过几年的耕耘做到了细分市场头名的位置。极米科技创始人、CEO&nbsp;钟波非常固执地坚持“未来电视一定属于无屏”，除了无屏电视以外，这家硬件创业公司就再没推出过其他产品。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t无屏电视的优点显而易见，无需液晶屏幕，决定了它的成本可以压缩到非常低，同时便于保存和携带。也因此，这个新兴的品类，催生了极米、火乐神画、智歌、一数科技等初创公司，也吸引了海信、长虹等家电厂商，小米、暴风等互联网公司入场，欲从市场中抢一杯羹。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t目前的无屏电视依然是小众玩物。去年，暴风发布无屏电视时，我们曾提到，当下投影仪式无屏电视的技术已经相当成熟，但使用场景依然非常受到限制，暂时还不能取代传统电视，当务之急就是要解决亮度、距离等问题。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t极米算是目前跑的比较快的，至今已经拿到四轮融资。值得注意的是，在本轮增资后，百度成为了除创始团队外最大股东。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t百度与极米的合作关系开始于 2017 年 7 月，极米发布三款搭载了百度 DuerOS 人工智能操作系统的激光无屏电视。同年 11 月，成都极米科技宣布完成百度风投(BV)领投的C轮融资。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t双方合作的逻辑也非常清晰了，极米负责硬件，百度负责软件，加强目前流行的人工智能电视上的布局。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t上周（3&nbsp;月 6&nbsp;日），百度完成了结构调整，在内部宣布正式成立“智能生活事业群组”，百度集团总裁兼首席运营官陆奇兼任总经理。百度的策略就是双管齐下，既要有自研的产品，也要继续壮大 DuerOS&nbsp;平台的建设。&nbsp;\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t未来电视的目标定位是家庭娱乐的中心，以及连接整套智能家居系统的入口，重要性不言而喻，这也是百度 DuerOS 最好的落地机会之一。根据百度公布的数据，截至 2018 年 1 月，搭载 DuerOS 的智能设备激活数量已突破 5000 万，月活跃设备超过 1000 万。DuerOS 已新增 130 余家合作伙伴、落地硬件解决方案超过 20 个、每月新增 5 款以上搭载 DuerOS 的设备。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t但实际上，目前消费者每天都在接触的消费电子产品中，DuerOS&nbsp;的存在感并不强，它更多的存在于车载及某些更小众的智能产品中。而手机、电视这些设备的厂商，几乎都会选择搭载自家的操作系统及助手，DuerOS&nbsp;在容身之地越来越小的情况下，选择把宝押在未来，因此无屏电视成了最好的选择。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t随着技术的升级、成本逐渐降低，以及人工智能等概念的落地，本来显得“老气横秋”的电视逐渐焕发出了新的生命力，正努力夺回客厅娱乐主力的位置。慧聪网的数据显示，2018 年彩电市场将回暖，规模预计增长 3.1%，达到 4898 万台。与此同时，奥维云网发布的数据显示，2017 年激光电视市场规模销量 6.7 万台，销额&nbsp; 20.8 亿元，增长率分别达 116％，109％。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t极米有了百度的支持，能继续砸钱做研发，完善产品；而百度也能提前完成布局，“拉拢”更多的厂商加入到 Dueros&nbsp;的大平台中，继续抢占市场份额。看起来似乎很美好，不过最终还是看实际的产品表现说话，毕竟传统家电厂商，以及小米、暴风等竞争对手也不是吃素的。\t\t</p>\t\t<p>\t\t\t<br />\t\t</p>\t\t<p>\t\t\t未来无屏电视的可用性肯定会越来越好，就差一套大房子了。\t\t</p>\t</div></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p>");
                article.setCheckUp(1);
                article.setArticleState("已发布");
                article.setUserId(Long.valueOf(1));
                article.setArticleSummary(listBean.getDescription().split("。")[0].replaceAll(" ", ""));
                article.setSourceUrl(listBean.getSource_url());
                article.setArticleSource(listBean.getSource_site());
                article.setArticleHints(random.nextInt(100));
                Date day=new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                article.setReleaseTime(df.format(day));
                article.setArticleCollection(random.nextInt(50));
                article.setArticleUp(random.nextInt(200));
                article.setArticleDown(random.nextInt(40));
                article.setArticleAvatar(listBean.getImage_list().split(",")[0]);
                if (random.nextInt(999999)>700000) {
                    article.setArticleBig(1);
                }else
                    article.setArticleBig(0);
                article.setArticleFirst(0);

                ArticleAttach articleAttach = new ArticleAttach();
                articleAttach.setArticleId(id);
                articleAttach.setTagNumber(0);
                articleAttach.setPicNumber(listBean.getImage_list().split(",").length);
                articleAttach.setPics(listBean.getImage_list());
                articleAttachService.insertAttache(articleAttach);
                articleService.insertone(article);
                id++;
            }
        }



          /*  for(int m = 0;m<types.length;m++) {
                types[m] = types[m].replaceAll(" ", "");
                if (types[m].equalsIgnoreCase("Action")) {
                    types[m] = "动作";
                } else if (types[m].equalsIgnoreCase("Adventure")) {
                    types[m] = "冒险";
                }else if (types[m].equalsIgnoreCase("Animation")) {
                    types[m] = "动画";
                }else if (types[m].equalsIgnoreCase("Children's")) {
                    types[m] = "儿童";
                }else if (types[m].equalsIgnoreCase("Comedy")) {
                    types[m] = "喜剧";
                }else if (types[m].equalsIgnoreCase("Crime")) {
                    types[m] = "犯罪";
                }else if (types[m].equalsIgnoreCase("Documentary")) {
                    types[m] = "纪录";
                }else if (types[m].equalsIgnoreCase("Drama")) {
                    types[m] = "戏剧";
                }else if (types[m].equalsIgnoreCase("Fantasy")) {
                    types[m] = "幻想";
                }else if (types[m].equalsIgnoreCase("Film-Noir")) {
                    types[m] = "黑色电影";
                }else if (types[m].equalsIgnoreCase("Horror")) {
                    types[m] = "恐怖";
                }else if (types[m].equalsIgnoreCase("Musical")) {
                    types[m] = "音乐";
                }else if (types[m].equalsIgnoreCase("Mystery")) {
                    types[m] = "神秘";
                }else if (types[m].equalsIgnoreCase("Romance")) {
                    types[m] = "浪漫";
                }else if (types[m].equalsIgnoreCase("Sci-Fi")) {
                    types[m] = "科幻";
                }else if (types[m].equalsIgnoreCase("Thriller")) {
                    types[m] = "惊悚";
                }else if (types[m].equalsIgnoreCase("War")) {
                    types[m] = "战争";
                }else if (types[m].equalsIgnoreCase("Western")) {
                    types[m] = "西方";
                }
            }
            Article article = new Article();
            ArticleAttach articleAttach = new ArticleAttach();


            article.setArticleId(Long.valueOf(split[0]));
            article.setArticleTitle(split[1]);
            article.setArticleContent("<p class=\"text-big-title\" style=\"font-size:20px;font-weight:700;color:#A41D1D;font-family:Arial, 微软雅黑, &quot;text-align:justify;background-color:#FFFFFF;\">\t一、超级物种是什么？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t北京地铁6号线常营站东南口出来，就是长楹天街购物中心。购物中心位于北京东五环以东，偏中高档，餐饮占了两成。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t沿着商场通道往东，走到尽头，右侧是超级物种的广告：一张实木桌子，四周摆放着鱼、龙虾、螃蟹、水果、鲜贝、牛羊肉等生鲜，正中间是四个大字“超级物种”，下面跟着两个绿色的英文单词“Future Supermarket”。行人偶尔会停下脚步，看着墙上的广告，发出疑问：“超级物种是什么？”</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t超级物种是永辉的新业务，高端超市、高端餐饮和永辉生活App的综合体，对标提倡慢生活的意大利超市餐厅Eataly，但面积和SKU不到Eataly的十分之一。 超级物种以生鲜售卖和烹饪为主，80%的生鲜和商品靠进口，食材新鲜，周转率高，店面的装修也更符合年轻一代的审美。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t永辉创办于2001年，是中国超市的标杆，现在创办者试图让这头大象变成猎豹。在探索出红标店、绿标店、精标店和会员店之后，2017年1月1日在福州开了第一家超级物种，到年底时开了26家门店，福州7家，深圳6家，成都3家，北京、上海、厦门、南京各2家，杭州和重庆各1家。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t2017年夏天，新经济100人创始人兼CEO李志刚和超级物种缔造者、永辉超市CEO张轩宁有过一次对话，提到：&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：超级物种是什么？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：又像餐厅，又像超市，又像仓库。做成功了叫超级物种，不成功叫四不像。 早上当早餐，中午当正餐，晚上再当正餐，再晚一些，就当酒吧。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：吃一顿要花多少？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：人均消费200元。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：你的坪效是多少？&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：现在开了几家店，能做到15万元/年。目前中国超市的坪效1.5万元/年，便利店能做到5万元/年，超级物种的坪效突破了最高记录。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t李志刚：那利润太高了，一定是在繁华区域。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t张轩宁：社区在试，写字楼在试，购物中心也在试，我现在都在测试。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t2017年，超级物种在北京开了两家店，9月底第一家店在石景山鲁谷开业，12月底第二家店在朝阳长楹天街开业。两家店一东一西，但都紧随永辉超市。鲁谷店开在永辉超市红标店的一层，长楹天街店离永辉超市绿标店不到500米。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t相比于鲁谷店，长楹天街店面积更大，约为1000平方米，SKU也更丰富<span class=\"text-remarks\" style=\"color:#999999;line-height:30px;\">（SKU超过750个，其中200多个为零食和酒饮）</span>。</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<br /></p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t长楹天街店呈长方形布局，健康生活有机馆、花艺馆、麦子工坊、鲑鱼工坊、波龙工坊、盒牛工坊和咏悦汇排在四周，店面中央是用餐区，可同时容纳300人用餐，大约占了一半的面积。&nbsp;</p><p style=\"color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\t<img src=\"/attached/kindEditor/image/20180127/20180127190811_885.jpg\" alt=\"\" /></p>");
            String s = "";
            if (types.length > 0) {
                for (int j = 0; j<types.length;j++) {
                    if (j == types.length - 1) {
                        s = s + types[j];
                    } else {
                        s = s + types[j] + ",";
                    }
                }
                articleAttach.setTags(s);
                articleAttach.setTagNumber(types.length);
                articleAttach.setArticleId(Long.valueOf(split[0]));
                articleAttachService.insertAttache(articleAttach);
            }else {
                articleAttach.setTagNumber(0);
                articleAttach.setArticleId(Long.valueOf(split[0]));
                articleAttachService.insertAttache(articleAttach);
            }
            if (types.length > 0) {
                article.setKindParentName(types[0]);
                if (types.length > 1) {
                    article.setKindChildName(types[1]);
                }
            }

            article.setUserId(Long.valueOf(1));

            article.setArticleSummary("本文作者用了180天对永辉进行了深度调研，将超级物种和盒马鲜生进行比较。最后得出结论：不管是有人便利店，还是生鲜生活超市，未来的挑战或者核心竞争力主要来自两个方面： 一，供应链；二，团队管理。");
            Random random = new Random();
            article.setArticleHints(random.nextInt(10000));

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
            article.setReleaseTime(df.format(new Date()));
            article.setCheckUp(1);

            article.setArticleCollection(random.nextInt(2000));
            article.setArticleUp(random.nextInt(10000));
            article.setArticleDown(random.nextInt(10000));
            article.setArticleState("已发布");
            article.setArticleAvatar("/attached/cover/20180127/20180127190816_30.jpg");
            article.setArticleFirst(0);
            int k = random.nextInt(10000);
            if (k > 7000) {
                article.setArticleBig(1);
            }else
                article.setArticleBig(0);
            articleService.insertone(article);*/
        return "ok";
    }



}
