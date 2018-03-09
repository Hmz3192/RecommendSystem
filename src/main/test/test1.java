import com.hmz.utils.ThreadPoolUtils;
import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class test1 {
    private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
    private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
    private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
    private static final String regEx_space = "\\s*|\t|\r|\n";//定义空格回车换行符
    /**
     * @param htmlStr
     * @return
     *  删除Html标签
     */
    public static String delHTMLTag(String htmlStr) {
        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(htmlStr);
        htmlStr = m_script.replaceAll(""); // 过滤script标签
        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(htmlStr);
        htmlStr = m_style.replaceAll(""); // 过滤style标签
        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(htmlStr);
        htmlStr = m_html.replaceAll(""); // 过滤html标签
        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);
        Matcher m_space = p_space.matcher(htmlStr);
        htmlStr = m_space.replaceAll(""); // 过滤空格回车标签
        return htmlStr.trim(); // 返回文本字符串
    }
    public static String getTextFromHtml(String htmlStr){
        htmlStr = delHTMLTag(htmlStr);
        htmlStr = htmlStr.replaceAll(" ", "");
        htmlStr = htmlStr.substring(0,100);
        return htmlStr;
    }
    public static void main(String[] args) {
        String html = "<p style=\"text-align:center;\">\n" +
                "\t我啊谁家的<strong>撒吉萨多久啊的</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">撒大苏打上阿斯顿阿迪斯</span></strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\"><img src=\"/attached/image/20180125/20180125165158_376.png\" alt=\"\" /></span><br />\n" +
                "</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">阿<em><u>斯顿打撒大厦</u></em></span></strong>\n" +
                "</p>";

        String reg = "<*>\r|\n|\t|\\s*<*>";
        String reg1 = "(?<=\\\\>)(?:\\\\s*\\r?\\n?)(?=\\\\<)";
        String reg2 = ">\r|\n|\\s+([^\\\\s<]*)\r|\n\\s+<";
        String reg3 = "\r|\n";
        System.out.println(html.replaceAll(reg3, ""));
//        System.out.println(getTextFromHtml(str));
    }


    @Test
    public void test2() throws Exception {
        ThreadPoolUtils.getLongTimeOutThread(new Runnable() {
            @Override
            public void run() {
                System.out.println("开始睡觉");

                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("睡醒了");
            }
        });
        Thread.sleep(3000);
        System.out.println("2");

    }

}
