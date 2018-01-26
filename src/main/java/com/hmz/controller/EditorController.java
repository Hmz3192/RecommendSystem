package com.hmz.controller;

import com.hmz.model.Article;
import com.hmz.model.ArticleAttach;
import com.hmz.model.ArticleKind;
import com.hmz.pojo.ArticleAttachPojo;
import com.hmz.pojo.ArticleEditPojo;
import com.hmz.pojo.Result;
import com.hmz.service.ArticleAttachService;
import com.hmz.service.ArticleKindService;
import com.hmz.service.ArticleService;
import com.hmz.utils.IDUtils;
import com.hmz.utils.StringUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.expression.TypeComparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
@Controller
public class EditorController {

    @Resource
    private ArticleService articleService;
    @Resource
    private ArticleAttachService articleAttachService;
    @Resource
    private ArticleKindService articleKindService;



    @ResponseBody
    @RequestMapping(value = "/getTags")
    public ArticleAttachPojo getTags(Integer articleId) {
        return articleAttachService.getOneByArticleId(articleId);
    }

    @RequestMapping(value = "loadPCKind")
    @ResponseBody
    public List<ArticleKind> loadPCKind(String pKindId,String cKindId){
        return articleKindService.getPCKind(Integer.valueOf(pKindId), Integer.valueOf(cKindId));
    }
    @RequestMapping(value = "/saveBlog", method = RequestMethod.POST)
    @ResponseBody
    public Result saveBlog(Integer articleId, String content, String title, String sumary, String tags, String pKind, String cKind) {

        Result result = new Result();
        Article article = new Article();
        ArticleAttach articleAttach = new ArticleAttach();
        Integer GenArticleId = IDUtils.genIntegerId();
        try {
            if (articleId != null) {
                article.setArticleId(articleId);
                articleAttach.setArticleId(articleId);
            } else {
                article.setArticleId(GenArticleId);
                articleAttach.setArticleId(GenArticleId);
            }
            article.setArticleContent(StringUtil.deleteRNB(content));
            article.setArticleTitle(title);
            article.setKindChildName(cKind);
            article.setKindParentName(pKind);
            article.setUserId(1);
            article.setArticleSummary(sumary);

            /*-------------*/
            articleAttach.setTags(tags);
            articleAttach.setTagNumber(StringUtil.CountNumber(tags));
        } catch (Exception e) {
            e.printStackTrace();
        }
        articleAttachService.saveAttache(articleAttach);
        articleService.saveBlog(article);
        result.setMessage("保存成功");
        return result;
    }


    @RequestMapping(value = "/editBlog")
    public String editBlog(/*Integer articleId,*/ Model model) {
        Integer articleId = 26;
        ArticleEditPojo articleEditPojo = new ArticleEditPojo();
        Article one = articleService.getOne(articleId);
        ArticleAttachPojo oneByArticleId = articleAttachService.getOneByArticleId(one.getArticleId());

        articleEditPojo.setArticle(one);
        articleEditPojo.setArticleAttachPojo(oneByArticleId);
        articleEditPojo.setBlog_state(1);
        model.addAttribute("articlePO", articleEditPojo);
        return "submission";
    }

    /**
     * 文件上传
     *
     * @param request  {@link HttpServletRequest}
     * @param response {@link HttpServletResponse}
     * @return json response
     */
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> fileUpload(HttpServletRequest request, HttpServletResponse response) {
        //文件保存本地目录路径
        String savePath = request.getServletContext().getRealPath("/") + "attached/";

        //文件保存目录URL
        String saveUrl = request.getContextPath() + "attached/";

        if(!ServletFileUpload.isMultipartContent(request)){
            return getError("请选择文件。");
        }

        //检查目录
        File uploadDir = new File(savePath);
        if(!uploadDir.isDirectory()){
            return getError("上传目录不存在。");
        }
        //检查目录写权限
        if(!uploadDir.canWrite()){
            return getError("上传目录没有写权限。");
        }


        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        if(!extMap.containsKey(dirName)){
            return getError("目录名不正确。");
        }

        //创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }


        //最大文件大小
        //上传文件大小限制为31M，31*1024*1024;
        long maxSize = 32505856;

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        List<?> items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException fe) {
            return getError("接收文件异常。");
        }
        Iterator<?> itr = items.iterator();
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            String fileName = item.getName();
            if (!item.isFormField()) {
                //检查文件大小
                if(item.getSize() > maxSize){
                    return getError("上传文件大小超过限制。");
                }
                //检查扩展名
                String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
                    return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
                }

                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
                try{
                    File uploadedFile = new File(savePath, newFileName);
                    item.write(uploadedFile);
                }catch(Exception e){
                    return getError("上传文件失败。");
                }

                Map<String, Object> succMap = new HashMap<String, Object>();
                String url = saveUrl + newFileName;
                succMap.put("error", 0);
                succMap.put("url", url);
                return succMap;
            }
        }

        return null;
    }

    /**
     * 文件空间
     * @param request {@link HttpServletRequest}
     * @param response {@link HttpServletResponse}
     * @return json
     */
    @RequestMapping(value = "/fileManager")
    @ResponseBody
    public Object fileManager(HttpServletRequest request, HttpServletResponse response) {
        //根目录路径，可以指定绝对路径
        String rootPath = request.getServletContext().getRealPath("/") + "attached/";

        //根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
        String rootUrl  = request.getContextPath() + rootPath.substring(2);
        //图片扩展名
        String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

        String dirName = request.getParameter("dir");
        if (dirName != null) {
            if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
                return "Invalid Directory name.";
            }
            rootPath += dirName + "/";
            rootUrl += dirName + "/";
            File saveDirFile = new File(rootPath);
            if (!saveDirFile.exists()) {
                saveDirFile.mkdirs();
            }
        }
        //根据path参数，设置各路径和URL
        String path = request.getParameter("path") != null ? request.getParameter("path") : "";
        String currentPath = rootPath + path;
        String currentUrl = rootUrl + path;
        String currentDirPath = path;
        String moveupDirPath = "";
        if (!"".equals(path)) {
            String str = currentDirPath.substring(0, currentDirPath.length() - 1);
            moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
        }

        //排序形式，name or size or type
        String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

        //不允许使用..移动到上一级目录
        if (path.indexOf("..") >= 0) {
            return "Access is not allowed.";
        }
        //最后一个字符不是/
        if (!"".equals(path) && !path.endsWith("/")) {
            return "Parameter is not valid.";
        }
        //目录不存在或不是目录
        File currentPathFile = new File(currentPath);
        if(!currentPathFile.isDirectory()){
            return "Directory does not exist.";
        }

        //遍历目录取的文件信息
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
        if(currentPathFile.listFiles() != null) {
            for (File file : currentPathFile.listFiles()) {
                Hashtable<String, Object> hash = new Hashtable<String, Object>();
                String fileName = file.getName();
                if(file.isDirectory()) {
                    hash.put("is_dir", true);
                    hash.put("has_file", (file.listFiles() != null));
                    hash.put("filesize", 0L);
                    hash.put("is_photo", false);
                    hash.put("filetype", "");
                } else if(file.isFile()){
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                    hash.put("is_dir", false);
                    hash.put("has_file", false);
                    hash.put("filesize", file.length());
                    hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
                    hash.put("filetype", fileExt);
                }
                hash.put("filename", fileName);
                hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
                fileList.add(hash);
            }
        }

        if ("size".equals(order)) {
            Collections.sort(fileList, new SizeComparator());
        } else if ("type".equals(order)) {
            Collections.sort(fileList, new TypeComparator());
        } else {
            Collections.sort(fileList, new NameComparator());
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("moveup_dir_path", moveupDirPath);
        result.put("current_dir_path", currentDirPath);
        result.put("current_url", currentUrl);
        result.put("total_count", fileList.size());
        result.put("file_list", fileList);

        return result;
    }


    private Map<String, Object> getError(String errorMsg) {
        Map<String, Object> errorMap = new HashMap<String, Object>();
        errorMap.put("error", 1);
        errorMap.put("message", errorMsg);
        return errorMap;
    }

    public class NameComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable)a;
            Hashtable hashB = (Hashtable)b;
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
            }
        }
    }
    public class SizeComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable)a;
            Hashtable hashB = (Hashtable)b;
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
                    return 1;
                } else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
                    return -1;
                } else {
                    return 0;
                }
            }
        }
    }
    public class TypeComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable)a;
            Hashtable hashB = (Hashtable)b;
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
            }
        }
    }
}
