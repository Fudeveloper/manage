package com.summer.manage.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Role extends BaseEntity {
    @NotBlank(message = "用户组名称不能为空")
    @Column(nullable = false, unique = true)
    String name;

    public Set<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<Permission> permissions) {
        this.permissions = permissions;
    }


    @ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.REMOVE)
    @JoinTable(name = "roles_permissions", joinColumns = {
            @JoinColumn(name = "role_id", nullable = false)
    }, inverseJoinColumns = {
            @JoinColumn(name = "permissions_id", nullable = false)
    })
    Set<Permission> permissions = new HashSet<>(0);

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
