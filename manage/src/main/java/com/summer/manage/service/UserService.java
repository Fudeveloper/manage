package com.summer.manage.service;

import com.summer.manage.common.BaseService;
import com.summer.manage.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface UserService extends BaseService<User> {

    User findByUsername(String username);


    List<User> findAll(int page, int limit, Map<String, Object> params);

    void updateLoginTime(Long id);

    void updatePassword(Long id, String password);
}
