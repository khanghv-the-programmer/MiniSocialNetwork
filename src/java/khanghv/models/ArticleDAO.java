/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.models;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.Vector;
import khanghv.db.MyConnection;
import khanghv.dtos.ArticleDTO;
import khanghv.dtos.CommentDTO;
import khanghv.dtos.NotificationDTO;
import khanghv.dtos.ReactionDTO;

/**
 *
 * @author USER
 */
public class ArticleDAO implements Serializable {

    Connection conn;
    PreparedStatement preStm;
    ResultSet rs;

    public ArticleDAO() {
    }

    public void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
        }
    }

    public Vector<ArticleDTO> loadNewfeed() throws Exception {
        Vector<ArticleDTO> aList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select AR.ArticleID, AR.Date, AR.Description, AR.Image, AR.Title, A.Email, A.Fullname, A.Image As UserImg"
                    + "  From Account A, Article AR"
                    + "  Where A.Email = AR.Username And AR.Status = 'active'";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            aList = new Vector<>();
            while (rs.next()) {
                String aID = rs.getString("ArticleID");
                String desc = rs.getString("Description");
                String img = rs.getString("Image");
                String title = rs.getString("Title");
                String username = rs.getString("Email");
                String fullName = rs.getString("Fullname");
                String userImg = rs.getString("UserImg");
                Date uploadDate = rs.getDate("Date");
                ArticleDTO dto = new ArticleDTO(aID, title, desc, img, username, uploadDate, fullName, userImg);
                aList.add(dto);
            }
        } finally {
            closeConnection();
        }
        return aList;
    }

    public Vector<ArticleDTO> searchNewfeed(String search) throws Exception {
        Vector<ArticleDTO> aList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select AR.ArticleID, AR.Date, AR.Description, AR.Image, AR.Title, A.Email, A.Fullname, A.Image As UserImg"
                    + "  From Account A, Article AR"
                    + "  Where A.Email = AR.Username And AR.Status = 'active' And AR.Description LIKE ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();

            aList = new Vector<>();
            while (rs.next()) {
                String aID = rs.getString("ArticleID");
                String desc = rs.getString("Description");
                String img = rs.getString("Image");
                String title = rs.getString("Title");
                String username = rs.getString("Email");
                String fullName = rs.getString("Fullname");
                String userImg = rs.getString("UserImg");
                Date uploadDate = rs.getDate("Date");
                ArticleDTO dto = new ArticleDTO(aID, title, desc, img, username, uploadDate, fullName, userImg);
                aList.add(dto);
            }
        } finally {
            closeConnection();
        }
        return aList;
    }

    public Vector<CommentDTO> loadCommentList(String articleID) throws Exception {
        Vector<CommentDTO> cmtList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select C.CommentID, C.Content, A.Email, A.Fullname, C.Date, A.Image From Comment C, Account A, Article Ar Where C.Username = A.Email AND C.ArticleID = Ar.ArticleID And C.Status = 'active' And Ar.ArticleID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            rs = preStm.executeQuery();
            cmtList = new Vector<>();
            while (rs.next()) {
                String cmtID = rs.getString("CommentID");
                String content = rs.getString("Content");
                String email = rs.getString("Email");
                String fullName = rs.getString("Fullname");
                Date uploadDate = rs.getDate("Date");
                String usrImg = rs.getString("Image");
                CommentDTO dto = new CommentDTO(cmtID, content, email, fullName, articleID, uploadDate, usrImg);
                cmtList.add(dto);
            }
            Collections.sort(cmtList);
        } finally {
            closeConnection();
        }
        return cmtList;
    }

    public int getLikesNumber(String articleID) throws Exception {
        Vector<String> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select R.ReactionID From Reaction R, Article Ar Where R.ArticleID = Ar.ArticleID AND R.Status = 'Like' And Ar.ArticleID = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            list = new Vector<>();
            rs = preStm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ReactionID");
                list.add(id);
            }
        } finally {
            closeConnection();
        }
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    public Vector<ReactionDTO> getLikePeople(String articleID) throws Exception {
        Vector<ReactionDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select A.Fullname, A.Image, R.Status From Reaction R, Article Ar, Account A Where R.Username = A.Email And R.ArticleID = Ar.ArticleID And Ar.ArticleID = ? And R.Status = 'Like'";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            list = new Vector<>();
            rs = preStm.executeQuery();
            while (rs.next()) {
                String fullName = rs.getString("Fullname");
                String userImg = rs.getString("Image");
                String status = rs.getString("Status");
                ReactionDTO dto = new ReactionDTO(status, fullName, userImg);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public Vector<ReactionDTO> getDislikePeople(String articleID) throws Exception {
        Vector<ReactionDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select A.Fullname, A.Image, R.Status From Reaction R, Article Ar, Account A Where R.Username = A.Email And R.ArticleID = Ar.ArticleID And Ar.ArticleID = ? And R.Status = 'Dislike'";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            list = new Vector<>();
            rs = preStm.executeQuery();
            while (rs.next()) {
                String fullName = rs.getString("Fullname");
                String userImg = rs.getString("Image");
                String status = rs.getString("Status");
                ReactionDTO dto = new ReactionDTO(status, fullName, userImg);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getDislikesNumber(String articleID) throws Exception {
        Vector<String> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select R.ReactionID From Reaction R, Article Ar Where R.ArticleID = Ar.ArticleID AND R.Status = 'Dislike' And Ar.ArticleID = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            list = new Vector<>();
            rs = preStm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ReactionID");
                list.add(id);
            }
        } finally {
            closeConnection();
        }
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    public ArticleDTO loadNewfeedDetail(String articleID) throws Exception {
        ArticleDTO dto = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select AR.ArticleID, AR.Date, AR.Description, AR.Image, AR.Title, A.Email, A.Fullname, A.Image As UserImg, AR.Status"
                    + "  From Account A, Article AR"
                    + "  Where A.Email = AR.Username AND AR.ArticleID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            rs = preStm.executeQuery();

            if (rs.next()) {
                String aID = rs.getString("ArticleID");
                String desc = rs.getString("Description");
                String img = rs.getString("Image");
                String title = rs.getString("Title");
                String username = rs.getString("Email");
                String fullName = rs.getString("Fullname");
                String userImg = rs.getString("UserImg");
                Date uploadDate = rs.getDate("Date");
                String status = rs.getString("Status");
                dto = new ArticleDTO(aID, title, desc, img, username, uploadDate, fullName, userImg, status);

            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public int getLastId() throws Exception {
        Vector<Integer> idList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select ArticleID From Article";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            idList = new Vector<>();
            while (rs.next()) {
                String id = rs.getString("ArticleID");
                idList.add(Integer.parseInt(id));
            }
            Collections.sort(idList);
        } finally {
            closeConnection();
        }
        if (idList != null) {
            return idList.get(idList.size() - 1);
        }
        return 0;

    }

    public int getLastCommentId() throws Exception {
        Vector<Integer> idList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select CommentID From Comment";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            idList = new Vector<>();
            while (rs.next()) {
                String id = rs.getString("CommentID");
                idList.add(Integer.parseInt(id));
            }
            Collections.sort(idList);
        } finally {
            closeConnection();
        }
        if (idList != null) {
            return idList.get(idList.size() - 1);
        }
        return 0;

    }

    public boolean postArticle(ArticleDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Article (ArticleID, Title, Description, Image, Date, Username, Status) Values ( ? , ?, ?, ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getId());
            preStm.setString(2, dto.getTitle());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getImage());
            preStm.setDate(5, dto.getUploadDate());
            preStm.setString(6, dto.getUsername());
            preStm.setString(7, dto.getStatus());
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean postArticleNoImg(ArticleDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Article (ArticleID, Title, Description, Image, Date, Username, Status) Values ( ? , ?, ?, ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getId());
            preStm.setString(2, dto.getTitle());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getImage());
            preStm.setDate(5, dto.getUploadDate());
            preStm.setString(6, dto.getUsername());
            preStm.setString(7, dto.getStatus());
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public int getLastReactionId() throws Exception {
        Vector<Integer> idList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select ReactionID From Reaction";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            idList = new Vector<>();
            while (rs.next()) {
                String id = rs.getString("ReactionID");
                idList.add(Integer.parseInt(id));
            }
            Collections.sort(idList);
        } finally {
            closeConnection();
        }
        if (idList != null) {
            return idList.get(idList.size() - 1);
        }
        return 0;

    }

    public boolean addReaction(ReactionDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Reaction (ReactionID, Status, Date, Username, ArticleID) Values ( ? , ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getReactID());
            preStm.setString(2, dto.getStatus());
            preStm.setDate(3, dto.getDate());
            preStm.setString(4, dto.getUsername());
            preStm.setString(5, dto.getArticleID());
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public String getStatus(String username, String articleId) throws Exception {
        String status = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select Status From Reaction Where Username = ? And ArticleID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, articleId);
            rs = preStm.executeQuery();

            if (rs.next()) {
                status = rs.getString("Status");

            }
        } finally {
            closeConnection();
        }
        return status;
    }

    public boolean updateReaction(String status, String username, String articleID, Date date) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Reaction Set Status = ?, Date = ? Where Username = ? And ArticleID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setDate(2, date);
            preStm.setString(3, username);
            preStm.setString(4, articleID);

            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean postArticlComment(CommentDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Comment (CommentID, Content, Date, Username, ArticleID, Status) Values ( ? , ?, ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getCommentID());
            preStm.setString(2, dto.getContent());
            preStm.setDate(3, dto.getUploadDate());
            preStm.setString(4, dto.getEmail());
            preStm.setString(5, dto.getArticleID());
            preStm.setString(6, dto.getStatus());
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean deleteArticle(String articleID, String email) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Article Set Status = 'deleted' Where ArticleID = ? And Username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            preStm.setString(2, email);
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean deleteArticleAdmin(String articleID) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Article Set Status = 'deleted' Where ArticleID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, articleID);
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean deleteComment(String cmtID, String username) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Comment Set Status = 'deleted' Where CommentID = ? And Username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, cmtID);
            preStm.setString(2, username);
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean deleteCommentAdmin(String cmtID) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Comment Set Status = 'deleted' Where CommentID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, cmtID);
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public Vector<NotificationDTO> getListNotification(String email) throws Exception {
        Vector<NotificationDTO> notiList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select N.NotificationID, N.notiTime, N.ArticleID, N.Content, N.Status From Notification N Where N.EmailGet = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            notiList = new Vector<>();
            while (rs.next()) {
                String id = rs.getString("NotificationID");
                String content = rs.getString("Content");
                String articleID = rs.getString("ArticleID");
                String status = rs.getString("Status");
                Date dateNoti = new Date(rs.getTimestamp("notiTime").getTime());
                NotificationDTO dto = new NotificationDTO(id, content, status, articleID, email, dateNoti);
                notiList.add(dto);
            }
        } finally {
            closeConnection();
        }
        return notiList;
    }

    public boolean addNotifications(Vector<NotificationDTO> list) throws Exception {

        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Notification (NotificationID, Content, notiTime, Status, ArticleID, EmailGet) values (?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            for (NotificationDTO dto : list) {
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getId());
                preStm.setString(2, dto.getContent());
                preStm.setTimestamp(3, new Timestamp(dto.getNotiTime().getTime()));
                preStm.setString(4, dto.getStatus());
                preStm.setString(5, dto.getArticleId());
                preStm.setString(6, dto.getEmailGet());
                preStm.executeUpdate();
                conn.commit();
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            conn.rollback();
        } finally {
            closeConnection();
        }
        return false;
    }

    public int getLastNotiId() throws Exception {
        Vector<Integer> idList = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select NotificationID From Notification";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            idList = new Vector<>();
            while (rs.next()) {
                String id = rs.getString("NotificationID");
                idList.add(Integer.parseInt(id));
            }
            Collections.sort(idList);
        } finally {
            closeConnection();
        }
        if (idList != null) {
            return idList.get(idList.size() - 1);
        }
        return 0;

    }

    public boolean addOneNotification(NotificationDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Notification (NotificationID, Content, notiTime, Status, ArticleID, EmailGet) values (?,?,?,?,?,?)";

            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getId());
            preStm.setString(2, dto.getContent());
            preStm.setTimestamp(3, new Timestamp(dto.getNotiTime().getTime()));
            preStm.setString(4, dto.getStatus());
            preStm.setString(5, dto.getArticleId());
            preStm.setString(6, dto.getEmailGet());
            isOk = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return isOk;

    }

    public boolean updateNotification(String notiId) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "  Update Notification Set Status = 'read' Where NotificationID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, notiId);
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;

    }

}
