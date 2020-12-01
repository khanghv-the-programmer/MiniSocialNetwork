/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.models;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import khanghv.db.MyConnection;
import khanghv.dtos.AccountDTO;

/**
 *
 * @author USER
 */
public class AccountDAO implements Serializable {

    Connection conn;
    PreparedStatement preStm;
    ResultSet rs;

    public AccountDAO() {
    }

    public AccountDTO checkLogin(String username, String password) throws Exception {
        AccountDTO dto = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "Select  Fullname, Role, Status, Image From Account Where Email = ? AND Password = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("Fullname");
                String role = rs.getString("Role");
                String status = rs.getString("Status");
                String image = rs.getString("Image");
                dto = new AccountDTO(username, fullName, role, status, image);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean registerAccount(AccountDTO dto) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Insert Into Account (Email, Password, Fullname, Role, Status, Image) Values (?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getEmail());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getFullName());
            preStm.setString(4, dto.getRole());
            preStm.setString(5, dto.getStatus());
            preStm.setString(6, dto.getImage());
            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public boolean verifyAccount(String id) throws Exception {
        boolean isOk = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "Update Account Set Status = 'active' Where Email = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            isOk = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return isOk;
    }

    public String checkVerify(String email) throws Exception {
        String isVerify = "not found";
        try {
            conn = MyConnection.getConnection();
            String sql = "Select Status From Account Where Email = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            if (rs.next()) {
                isVerify = rs.getString("Status");
            }
        } finally {
            closeConnection();
        }
        return isVerify;
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
}
