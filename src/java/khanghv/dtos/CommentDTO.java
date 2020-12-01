/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author USER
 */
public class CommentDTO implements Serializable, Comparable<CommentDTO> {

    private String commentID, content, email, fullName, articleID, userImg, status;
    private Date uploadDate;

    public CommentDTO(String commentID, String content, String email, String fullName, String articleID, Date uploadDate, String userImg) {
        this.commentID = commentID;
        this.content = content;
        this.email = email;
        this.fullName = fullName;
        this.articleID = articleID;
        this.uploadDate = uploadDate;
        this.userImg = userImg;
    }

    public CommentDTO(String commentID, String content, String email, String articleID, Date uploadDate, String status) {
        this.commentID = commentID;
        this.content = content;
        this.email = email;
        this.articleID = articleID;
        this.uploadDate = uploadDate;
        this.status = status;
    }

    public String getUserImg() {
        return userImg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public CommentDTO() {
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    @Override
    public int compareTo(CommentDTO t) {
        if (t.uploadDate.after(this.uploadDate)) {
            return -1;
        } else if (t.uploadDate.before(this.uploadDate)) {
            return 1;
        }
        return 0;
    }

}
