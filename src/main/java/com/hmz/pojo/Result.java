package com.hmz.pojo;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class Result {

    private String message;
    private List<?> datas;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<?> getDatas() {
        return datas;
    }

    public void setDatas(List<?> datas) {
        this.datas = datas;
    }

    public Result() {

    }

    public Result(String message, List<?> datas) {

        this.message = message;
        this.datas = datas;
    }
}
