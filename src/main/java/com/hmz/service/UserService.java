package com.hmz.service;

import com.hmz.model.User;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/22.
 */
public interface UserService {

    List<User> selectAll();

    User loginUser(User user);

}
