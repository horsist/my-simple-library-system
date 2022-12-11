package com.sky.library.util;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//提供连接数据库  事务管理的
public class DBUtil {
    //静态变量  连接池和线程变量
    private static DruidDataSource ds;
    private static final ThreadLocal<Connection> THREAD_LOCAL = new ThreadLocal<>();
    //注册
    static {
        //获取properties
        Properties properties = new Properties();
        //获取本类的输入流
        InputStream inputStream = DBUtil.class.getResourceAsStream("/databases.properties");

        try {
            properties.load(inputStream);
            ds = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取连接
    public static Connection getConnection(){
        Connection connection = THREAD_LOCAL.get();
        if (connection==null){
            try {
                connection = ds.getConnection();
                THREAD_LOCAL.set(connection);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return connection;
    }
    //开启事务
    public static void begin(){
        Connection connection = null;
        try {
            connection= getConnection();
            connection.setAutoCommit(false);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    //提交事务方法
    public static void commit(){
        Connection connection = null;
        try {
            connection= getConnection();
            connection.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeAll(connection,null,null);
        }
    }
    //回滚事务
    public static void rollback(){
        Connection connection = null;
        try {
            connection= getConnection();
            connection.rollback();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeAll(connection,null,null);
        }
    }
    //关闭一切
    public static void closeAll(Connection connection, Statement statement, ResultSet resultSet){
        try {
            if (resultSet!=null) resultSet.close();
            if (statement!=null) statement.close();
            if (connection!=null)
            {
                connection.close();
                THREAD_LOCAL.remove();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
