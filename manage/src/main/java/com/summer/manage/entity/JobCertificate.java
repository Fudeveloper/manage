package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//职业资格证书
@Entity
public class JobCertificate extends BaseEntity {


    @NotBlank(message = "等级不能为空")
    String level;//等级

    @NotBlank(message = "名称不能为空")
    String name;//名称

    @NotBlank(message = "发证单位不能为空")
    String fzdw;//发证单位

    @NotNull(message = "获取日期不能为空")
    Date getDate;//获取日期

    @ManyToOne
    Teacher teacher;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    String annex;//附件

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFzdw() {
        return fzdw;
    }

    public void setFzdw(String fzdw) {
        this.fzdw = fzdw;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate(Date getDate) {
        this.getDate = getDate;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }
}
