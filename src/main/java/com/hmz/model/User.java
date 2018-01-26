package com.hmz.model;

import java.io.Serializable;

public class User implements Serializable{
    private Integer userId;

    private String userName;

    private String password;

    private String email;

    private Integer sex;

    private String location;

    private String avatar;

    private String phone;

    private Integer vip;

    private String introduction;

    public User(Integer userId, String userName, String password, String email, Integer sex, String location, String avatar, String phone, Integer vip, String introduction) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.sex = sex;
        this.location = location;
        this.avatar = avatar;
        this.phone = phone;
        this.vip = vip;
        this.introduction = introduction;
    }

    public User() {
        super();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getVip() {
        return vip;
    }

    public void setVip(Integer vip) {
        this.vip = vip;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}