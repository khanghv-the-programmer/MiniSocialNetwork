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
public class NotificationDTO implements Serializable, Comparable<NotificationDTO> {

    private String id, content, status, articleId, emailGet;
    private Date notiTime;

    public NotificationDTO() {
    }

    public NotificationDTO(String id, String content, String status, String articleId, String emailGet, Date notiTime) {
        this.id = id;
        this.content = content;
        this.status = status;
        this.articleId = articleId;
        this.emailGet = emailGet;

        this.notiTime = notiTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getEmailGet() {
        return emailGet;
    }

    public void setEmailGet(String emailGet) {
        this.emailGet = emailGet;
    }

    public Date getNotiTime() {
        return notiTime;
    }

    public void setNotiTime(Date notiTime) {
        this.notiTime = notiTime;
    }

    @Override
    public int compareTo(NotificationDTO t) {
        if (t.notiTime.after(this.notiTime)) {
            return 1;
        } else if (t.notiTime.before(this.notiTime)) {
            return -1;
        } else {
            if (Integer.parseInt(t.id) > Integer.parseInt(this.id)) {
                return 1;
            } else if (Integer.parseInt(t.id) < Integer.parseInt(this.id)) {
                return -1;
            }
            return 0;
        }
    }

}
