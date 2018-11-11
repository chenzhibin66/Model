package cn.binean.test;

import java.sql.*;

public class SqlSrvDBConm {
    private Statement statement;
    private Connection connection;
    ResultSet rs;

    public SqlSrvDBConm() {
        statement = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true", "root", "even0704");
        } catch (Exception e) {
            e.printStackTrace();
        }
        rs = null;
    }

    //执行查询类的SQL语句
    public ResultSet executeQuery(String sql) {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("Data.execueQuery:" + e.getMessage());
        }
        return rs;
    }

    //关闭对象
    public void closeStmt() {
        try {
            statement.close();
        } catch (SQLException e) {
            System.err.println("Data.executeQuery:" + e.getMessage());
        }
    }

    public void closeConn() {
        try {
            connection.close();
        } catch (SQLException e) {
            System.err.println("Data.executeQuery:" + e.getMessage());
        }
    }
}
