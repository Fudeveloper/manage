package com.summer.manage.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Formula;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.*;

@Entity
public class User extends BaseEntity implements UserDetails {


    @Column(nullable = false, unique = true)
    @Pattern(regexp = "[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}", message = "用户名由字母数字下划线组成且开头必须是字母，不能超过16位")
    String username;//用户名

    @Column(nullable = false)
    @NotBlank(message = "密码不能为空")
//    @Pattern(regexp = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$", message = " 密码应该是 8-16位数字或这字母组成")
            String password;//密码


    @Column(nullable = false)
    int state = 0;//用户状态 0 or 1

    @Formula("(select d.name from dictionary d where d.id = state)")
    String userState;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    Teacher teacher;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
    /*
    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
*/

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    Timestamp lastLoginTime;//最后登陆时间

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_roles", joinColumns = {
            @JoinColumn(name = "user_id", nullable = false)
    }, inverseJoinColumns = {
            @JoinColumn(name = "role_id", nullable = false)
    })
    Set<Role> roles = new HashSet<>(0);

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        Iterator<Role> mRoles = getRoles().iterator();
        while (mRoles.hasNext()) {
            authorities.add(new SimpleGrantedAuthority(mRoles.next().getName()));
        }
        return authorities;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Timestamp getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Timestamp lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }


    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User() {

    }
}
