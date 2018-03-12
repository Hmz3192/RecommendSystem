package com.hmz.utils;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class StringUtil {
    public List<String> allPathResult = new ArrayList<String>();


    public StringUtil(String inputPath) {
        getAllPath(inputPath);
    }

    /**
     * 递归获取文件夹下所有的文件绝对路径
     *
     * @param inputPath
     * @return
     */
    public void getAllPath(String inputPath) {

        try {
            File file = new File(inputPath);
            File[] files = file.listFiles();
            for (File f : files) {
                if (f.isDirectory()) {
                    getAllPath(f.getAbsolutePath());//递归
                } else {
//					System.out.println(f.getAbsolutePath());
                    allPathResult.add(f.getAbsolutePath());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 从文件的完整路径中，抽取其文件名称
     *
     * @param path
     * @return
     */
    public static String getFileNameFromPath(String path) {
        String result = "";
        if (isEmpty(path)) {
            return result;
        }
        if (path.contains("/")) {
            result = path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
        } else if (path.contains("\\")) {
            result = path.substring(path.lastIndexOf("\\") + 1, path.lastIndexOf("."));
        } else {
            result = path;
        }
        return result;
    }

    /**
     * 读取文件内容（读到内存里面）
     *
     * @param inputPath
     * @return
     */
    public static String getContent(String inputPath) {
        String result = "";
        if (isEmpty(inputPath)) {
            return result;
        }
        try {
//            File file = new File(inputPath);
//            FileReader fr = new FileReader(file);
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(inputPath), "UTF-8"));
            String temp = "";
            while ((temp = br.readLine()) != null) {
                result += (temp + ConstantPara.CHENG_LINE);
            }
            br.close();
//            fr.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String getConfigParam(String params, String defaultValue, String fileName) {
        String result = "";
        if (isEmpty(fileName) || isEmpty(params)) {
            return result;
        }
        try {
            Properties properties = loadConfig(fileName);
            result = properties.getProperty(params);
            if (isEmpty(result)) {
                result = defaultValue;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 判断字符为空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        boolean b = false;
        if (null == str || "".equals(str)) {
            b = true;
        }
        return b;
    }

    /**
     * 判断字符不为空
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        boolean b = false;
        if (null != str && !"".equals(str)) {
            b = true;
        }
        return b;
    }

    /**
     * 内部方法，获取Properties对象
     *
     * @param fileName
     * @return
     */
    public static Properties loadConfig(String fileName) {
        Properties properties = new Properties();
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            if (classLoader == null) {
                classLoader = StringUtil.class.getClassLoader();
            }
            InputStream is = classLoader.getResourceAsStream(fileName);
            properties.load(is);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return properties;
    }


    public static List<String> ConvertStringToList(String s1) {
        List<String> ls = new ArrayList<String>();
        String[] s2 = s1.split(",");
        ls.addAll(Arrays.asList(s2));
        return ls;
    }

    public static Integer CountNumber(String s1) {
        String[] s2 = s1.split(",");
        return s2.length;
    }


    //替换掉回车，换行
    public static String deleteRNB(String s1) {
        String reg = "\r|\n";
        return s1.replaceAll(reg, "");
    }
    public static void main(String[] args) {
        System.out.println(deleteRNB("<p style=\"text-align:center;\">\n" +
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
                "</p>"));
    }
}
