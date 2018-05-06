package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//出版书籍
@Entity
public class PublishingBooks extends BaseEntity {

    @NotBlank(message = "出版书籍不能为空")
    String name;

    @NotBlank(message = "出版社或杂志社不能为空")
    String press;

    @NotBlank(message = "ISBN不能为空")
    String ISBN;

    @NotNull(message = "本人排名不能为空")
    @ManyToOne
    Dictionary myRanking;//本人排名

    @NotNull(message = "出版日期不能为空")
    Date publicationDate;//出版日期

    @ManyToOne
    Teacher teacher;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
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

    String remark;//备注

    String annex;//附件

}
