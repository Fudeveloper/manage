package com.summer.manage.service.impl;

import com.summer.manage.common.BaseService;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.constant.Dictionary;
import com.summer.manage.dao.RoleDao;
import com.summer.manage.dao.UserDao;
import com.summer.manage.entity.User;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    DictionaryService ds;

    @Override
    public User findByUsername(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public List<User> findAll(int page, int limit, Map<String, Object> params) {

        return null;
    }

    @Override
    public void updateLoginTime(Long id) {
        System.out.println("更新登录时间");
        User user = userDao.findOne(id);
        user.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
        userDao.saveAndFlush(user);
    }

    @Override
    public void updatePassword(Long id, String password) {
        User user = userDao.findOne(id);
        user.setPassword(new BCryptPasswordEncoder().encode(password));
        userDao.saveAndFlush(user);
    }


}
