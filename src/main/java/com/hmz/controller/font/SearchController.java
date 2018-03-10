package com.hmz.controller.font;

import com.hmz.lucene.InitParams;
import com.hmz.lucene.api.FullTextResult;
import com.hmz.lucene.api.FullTextSearchParams;
import com.hmz.lucene.api.FullTextService;
import com.hmz.lucene.api.ServerFactory;
import com.hmz.lucene.index.IndexServer;
import com.hmz.lucene.spi.LuceneService;
import com.hmz.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/10.
 */
@Controller
public class SearchController {
    private LuceneService luceneService = null;
    private FullTextService searchService = null;
    public static FullTextService solrService = null;


    public void beginService(){
        Map<String,String> params = new HashMap<String,String>();
        String type = StringUtil.getConfigParam(InitParams.SERVERTYPE, "", InitParams.SEARCH_PROPERTIES);
        params.put("type", type);
        String serverName = StringUtil.getConfigParam(InitParams.SERVERNAME, "", InitParams.SEARCH_PROPERTIES);
        params.put("serverName", serverName);
        String url = StringUtil.getConfigParam(InitParams.SOLR_URL, "", InitParams.SEARCH_PROPERTIES);
        params.put("url", url);
        params.put("className", IndexServer.class.getName());
        ServerFactory serverFactory = new ServerFactory();
        searchService = serverFactory.beginService(params);
        searchService.setServerName(serverName);
    }

    @RequestMapping("/search")
    public String doQuery(String queryString, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(queryString);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("klTitle");
        assignmentFields.add("klIntro");
        assignmentFields.add("klContent");
        assignmentFields.add("klAppendix1");
        assignmentFields.add("klAppendix2");
        assignmentFields.add("klAppendix3");
        assignmentFields.add("klAppendix4");
        assignmentFields.add("klAppendix5");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","klTitle","klIntro","klContent","klAppendix1","klAppendix2","klAppendix3","klAppendix4","klAppendix5"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(30);
        fullTextSearchParams.setIsHighlight(true);
        String[] highlightFields = {"klTitle","klIntro","klContent","klAppendix1","klAppendix2","klAppendix3","klAppendix4","klAppendix5"};
        fullTextSearchParams.setHighlightFields(highlightFields);
        fullTextSearchParams.setPreHighlight("<font color='red'>");
        fullTextSearchParams.setPostHighlight("</font>");

        //guolv
        /*Map<String,String> filterField = new HashMap<String,String>();
        filterField.put("columnId", columnId+"");
        fullTextSearchParams.setFilterField(filterField);*/

        FullTextResult result = searchService.doQuery(fullTextSearchParams);
        long numFound = result.getNumFound();
        List tempList = result.getResultList();

        int pageRow = tempList.size();
        int pageSize = 10;

        model.addAttribute("searchList", tempList);
//        List<KlKnowledge> all = klKnowledgeService.getAll();
//        model.addAttribute("Knowledges", all);
//        model.addAttribute("queryString", queryString);

//        lucene
        /*String indexPath = ConstantParams.INDEXPATH;
        if (StringUtil.isNotEmpty(queryString)) {
            beginService("search", indexPath);
            FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
            fullTextSearchParams.setQueryWord(queryString);
            fullTextSearchParams.setReturnNums(1000);

            List<String> assignmentFields = new ArrayList<String>();
            assignmentFields.add("klTitle");
            assignmentFields.add("klIntro");
            assignmentFields.add("klContent");

            fullTextSearchParams.setAssignmentFields(assignmentFields);

            String[] viewFields = new String[]{"klTitle", "klIntro","klContent"};
            fullTextSearchParams.setViewFields(viewFields);

            fullTextSearchParams.setViewNums(150);
            fullTextSearchParams.setIsHighlight(true);
            fullTextSearchParams.setPreHighlight("<font color='red'>");
            fullTextSearchParams.setPostHighlight("</font>");
            FullTextResult result = luceneService.doQuery(fullTextSearchParams);
            long numFound = result.getNumFound();
            List tempList = result.getResultList();

            int pageRow = tempList.size();
            int pageSize = 10;

            model.addAttribute("searchList", tempList);
            List<KlKnowledge> all = klKnowledgeService.getAll();
            model.addAttribute("Knowledges", all);
        }*/

        return "search/search";
    }

}
