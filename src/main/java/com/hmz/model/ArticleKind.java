package com.hmz.model;

import java.io.Serializable;

public class ArticleKind implements Serializable{
    private Integer kindId;

    private String kindName;

    private Integer kindNumber;

    private Integer parentId;

    public ArticleKind(Integer kindId, String kindName, Integer kindNumber, Integer parentId) {
        this.kindId = kindId;
        this.kindName = kindName;
        this.kindNumber = kindNumber;
        this.parentId = parentId;
    }

    public ArticleKind() {
        super();
    }

    public Integer getKindId() {
        return kindId;
    }

    public void setKindId(Integer kindId) {
        this.kindId = kindId;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName == null ? null : kindName.trim();
    }

    public Integer getKindNumber() {
        return kindNumber;
    }

    public void setKindNumber(Integer kindNumber) {
        this.kindNumber = kindNumber;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}