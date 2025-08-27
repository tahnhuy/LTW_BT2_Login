package com.nhathuy.baitap2_login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dataBaseConnection {
    String serverName = "localhost";
    String dbName = "testIntell";
    String portNumber = "1433";
    String instance = "";
    String userID = "sa";
    String password = "nhathuy";

    public Connection getConnection() throws Exception {

        String url =
                "jdbc:sqlserver://" + serverName + "\\" + instance + ":" + portNumber +
                        ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;";
        if (instance == null || instance.trim().isEmpty())
            url =
                    "jdbc:sqlserver://"+ serverName +":"+portNumber
                            +";databaseName="+dbName + ";encrypt=true;trustServerCertificate=true;";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    public static void main(String[] args) {
        try {
            Connection connection = new dataBaseConnection().getConnection();
            System.out.println("Kết nối thành công");
        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }
    }
}
