package com.summer.manage.dao;

import com.summer.manage.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionDao extends JpaRepository<Permission,Long>{

}
