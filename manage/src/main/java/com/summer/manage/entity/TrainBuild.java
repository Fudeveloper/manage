package com.summer.manage.entity;


import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class TrainBuild extends BaseEntity {

    @NotBlank(message = "名称不能为空")
    String name;

    String relatedFileName;

    @ManyToOne
    Dictionary level;

    @ManyToOne
    Teacher teacher;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

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
}
