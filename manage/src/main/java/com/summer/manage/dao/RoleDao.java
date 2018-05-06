package com.summer.manage.dao;

import com.summer.manage.entity.Permission;
import com.summer.manage.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoleDao extends JpaRepository<Role, Long> {

    @Query("select t0 from Role t0 where t0.name = ?1")
    Role findByName(String name);


}
