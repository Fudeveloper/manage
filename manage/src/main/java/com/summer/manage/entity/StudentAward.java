package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class StudentAward extends BaseEntity {

    @NotBlank(message = "名称不能为空")
    String name;

    String relatedFileName;

    String awarding_unit;


    String student;


    String award_year;


    @ManyToOne
    Dictionary myRanking;

    @ManyToOne
    Dictionary level;

    @ManyToOne
    Teacher teacher;

    String remark;

    @Lob
    @Column(columnDefinition = "TEXT")
    String annex;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRelatedFileName() {
        return relatedFileName;
    }

    public void setRelatedFileName(String relatedFileName) {
        this.relatedFileName = relatedFileName;
    }

    public String getAwarding_unit() {
        return awarding_unit;
    }

    public void setAwarding_unit(String awarding_unit) {
        this.awarding_unit = awarding_unit;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getAward_year() {
        return award_year;
    }

    public void setAward_year(String award_year) {
        this.award_year = award_year;
    }

    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public Dictionary getLevel() {
        return level;
    }

    public void setLevel(Dictionary level) {
        this.level = level;
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

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
