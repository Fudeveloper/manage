package com.summer.manage.service;


import com.summer.manage.common.BaseService;
import com.summer.manage.entity.Permission;
import com.summer.manage.entity.Role;

import javax.transaction.Transactional;
import java.util.List;

public interface RoleService extends BaseService<Role>{

    boolean findRoleIsHasPermission(String roleName, String permissionName);

    Role findByName(String roleName);

}