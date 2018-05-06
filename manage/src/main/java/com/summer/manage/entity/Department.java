package com.summer.manage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Department extends BaseEntity {

    @Column(unique = true,nullable = false)
    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
