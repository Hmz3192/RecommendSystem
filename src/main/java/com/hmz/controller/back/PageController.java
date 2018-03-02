package com.hmz.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/1.
 */
@Controller
public class PageController {

    @RequestMapping("/b")
    public String toBack() {
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
}
