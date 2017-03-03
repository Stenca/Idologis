package org.rb.servlets;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB {

    
    public DB() {
       
    }
    
    Connection conn = null;
    Statement st = null;
    
    public Statement connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aeroclub", "root", "root");
            st = conn.createStatement();
        } catch (Exception e) {
            e.getStackTrace();
        }

        return st;
    }

    public void execute(String query) throws SQLException {
        String sql=query;
        try {
            st.execute(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet query(String query) throws SQLException {
        String sql = query;
        ResultSet rs = null;
        try {
           rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
}