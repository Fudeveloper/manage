package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//论文
@Entity
public class Paper extends BaseEntity {

    @NotBlank(message = "名称不能为空")
    String name;

    @NotBlank(message = "刊物学报名称不能为空")
    String journalOfPublications;//刊物学报名称

    @NotBlank(message = "刊号不能为空")
    String issueNumber;//刊号

    @NotNull(message = "刊物类别不能为空")
    @ManyToOne
    Dictionary publicationCategory;//刊物类别

    @NotNull(message = "本人排名不能为空")
    @ManyToOne
    Dictionary myRanking;//本人排名

    @NotNull(message = "出版日期不能为空")
    Date publicationDate;//出版日期

    @ManyToOne
    Teacher teacher;

    String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    String annex;//附件

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJournalOfPublications() {
        return journalOfPublications;
    }

    public void setJournalOfPublications(String journalOfPublications) {
        this.journalOfPublications = journalOfPublications;
    }

    public String getIssueNumber() {
        return issueNumber;
    }

    public void setIssueNumber(String issueNumber) {
        this.issueNumber = issueNumber;
    }

    public Dictionary getPublicationCategory() {
        return publicationCategory;
    }

    public void setPublicationCategory(Dictionary publicationCategory) {
        this.publicationCategory = publicationCategory;
    }

    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
