package com.zjnu.model;

import java.io.Serializable;

public class Admin implements Serializable{
    private Integer adminId;

    private String adminName;

    private String registerTime;

    private String phone;

    private Integer roleId;

    private String roleName;

    public Admin(Integer adminId, String adminName, String registerTime, String phone, Integer roleId, String roleName) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.registerTime = registerTime;
        this.phone = phone;
        this.roleId = roleId;
        this.roleName = roleName;
    }

    public Admin() {
        super();
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime == null ? null : registerTime.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}