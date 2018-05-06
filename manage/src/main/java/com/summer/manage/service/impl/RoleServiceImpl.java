package com.summer.manage.service.impl;

import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.dao.PermissionDao;
import com.summer.manage.dao.RoleDao;
import com.summer.manage.entity.Permission;
import com.summer.manage.entity.Role;
import com.summer.manage.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Iterator;
import java.util.List;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public boolean findRoleIsHasPermission(String roleName, String permissionName) {
        Role role = roleDao.findByName(roleName);
        if (role == null) return false;
        Iterator<Permission> i = role.getPermissions().iterator();
        while (i.hasNext()) {
            if (i.next().getUrl().equals(permissionName)) return true;
        }
        return false;
    }

    @Override
    public Role findByName(String roleName) {
        return roleDao.findByName(roleName);
    }

}
