package com.summer.manage.dao;

import com.summer.manage.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserDao extends JpaRepository<User, Long> {

    @Query("select t0 from User t0 where t0.username = :username")
    User findByUserName(@Param("username") String username);

}
