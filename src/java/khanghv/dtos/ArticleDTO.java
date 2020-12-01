/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.dtos;

import java.io.Serializable;
import java.sql.Date;
import java.util.Comparator;

/**
 *
 * @author USER
 */
public class ArticleDTO implements Serializable, Comparable<ArticleDTO> {

    private String id, title, description, image, username, fullName, userImg, status;
    private Date uploadDate;

    public ArticleDTO() {
    }

    public ArticleDTO(String id, String title, String description, String image, String username, Date uploadDate, String fullName, String userImg) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.username = username;
        this.uploadDate = uploadDate;
        this.fullName = fullName;
        this.userImg = userImg;
    }
    
    public ArticleDTO(String id, String title, String description, String image, String username, Date uploadDate, String fullName, String userImg, String status) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.username = username;
        this.uploadDate = uploadDate;
        this.fullName = fullName;
        this.userImg = userImg;
        this.status = status;
    }

    public ArticleDTO(String id, String title, String description, String image, String username, String status, Date uploadDate) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.username = username;
        this.status = status;
        this.uploadDate = uploadDate;
    }

    public ArticleDTO(String id, String title, String description, String username, String status, Date uploadDate) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.username = username;
        this.status = status;
        this.uploadDate = uploadDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    

    @Override
    public int compareTo(ArticleDTO t) {
        if (t.uploadDate.after(this.uploadDate)) {
            return 1;
        } else if (t.uploadDate.before(this.uploadDate)) {
            return -1;
        }
        else
        {
            if(Integer.parseInt(t.id) > Integer.parseInt(this.id))
                return 1;
            else if(Integer.parseInt(t.id) < Integer.parseInt(this.id))
                return -1;
            return 0;    
        }
    }

}
