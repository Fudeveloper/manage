package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//获奖荣誉
@Entity
public class Awards extends BaseEntity {


    @NotBlank(message = "获奖名称不能为空")
    String awardedName;//获奖名称

    @NotNull(message = "获奖日期不能为空")
    Date getDate;//获奖日期

    @NotNull(message = "获奖级别不能为空")
    @ManyToOne
    Dictionary awardLevel;//获奖级别

    @NotBlank(message = "颁奖单位不能为空")
    String awardingUnit;//颁奖单位

    @NotNull(message = "本人排名不能为空")
    @ManyToOne
    Dictionary myRanking;//本人排名

    @NotNull(message = "获奖金额不能为空")
    int awardAmount;//获奖金额

    @ManyToOne()
    Teacher teacher;

    String remark;

    String annex;

    public String getAwardedName() {
        return awardedName;
    }

    public void setAwardedName(String awardedName) {
        this.awardedName = awardedName;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate(Date getDate) {
        this.getDate = getDate;
    }


    public String getAwardingUnit() {
        return awardingUnit;
    }

    public void setAwardingUnit(String awardingUnit) {
        this.awardingUnit = awardingUnit;
    }

    public Dictionary getAwardLevel() {
        return awardLevel;
    }

    public void setAwardLevel(Dictionary awardLevel) {
        this.awardLevel = awardLevel;
    }

    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public int getAwardAmount() {
        return awardAmount;
    }

    public void setAwardAmount(int awardAmount) {
        this.awardAmount = awardAmount;
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
