package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//技术专利
@Entity
public class TechnologyPatent extends BaseEntity {

    @NotBlank(message = "名称不能为空")
    String name;

    @NotNull(message = "专利类型不能为空")
    @ManyToOne
    Dictionary patentType;//专利类型

    @NotBlank(message = "专利编号不能为空")
    String number;//专利编号

    @NotNull(message = "获取日期不能为空")
    Date getDate;//获取日期

    @NotNull(message = "本人排名不能为空")
    @ManyToOne
    Dictionary myRanking;//本人排名

    @ManyToOne
    Teacher teacher;

    String remark;

    String annex;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Dictionary getPatentType() {
        return patentType;
    }

    public void setPatentType(Dictionary patentType) {
        this.patentType = patentType;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate(Date getDate) {
        this.getDate = getDate;
    }

    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }
}
