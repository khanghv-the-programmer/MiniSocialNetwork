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
public class ReactionDTO implements Serializable{
    private String reactID, status, username, articleID, fullName, userImg;
    private Date date;

    public ReactionDTO(String reactID, String status, String username, String articleID, Date date) {
        this.reactID = reactID;
        this.status = status;
        this.username = username;
        this.articleID = articleID;
        this.date = date;
    }
    
    public ReactionDTO() {
    }

    public ReactionDTO(String status, String fullName, String userImg) {
        this.status = status;
        this.fullName = fullName;
        this.userImg = userImg;
    }
    
    
    public ReactionDTO(String reactID, String status, String username, String articleID, String fullName, String userImg, Date date) {
        this.reactID = reactID;
        this.status = status;
        this.username = username;
        this.articleID = articleID;
        this.fullName = fullName;
        this.userImg = userImg;
        this.date = date;
    }

    public String getReactID() {
        return reactID;
    }

    public void setReactID(String reactID) {
        this.reactID = reactID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
} 
