package com.sky.library.dao.impl;

import com.sky.library.dao.DAO;
import com.sky.library.entity.Manager;
import com.sky.library.entity.Page;
import com.sky.library.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;
import java.util.List;

public class ManagerDAOImpl implements DAO<Manager> {
    private QueryRunner queryRunner = new QueryRunner();
    @Override
    public List<Manager> selectAll() {
        return null;
    }

    @Override
    public int insert(Manager manager) {
        return 0;
    }

    @Override
    public int update(Manager manager) {
        return 0;
    }

    @Override
    public List<Manager> selectAll(Page page) {
        return null;
    }

    @Override
    public Manager select(String username) {
        Manager manager =null;
        try {
            Manager temp = queryRunner.query(DBUtil.getConnection(), "select * from manager where manager_name = ?", new BeanHandler<Manager>(Manager.class), username);
            if (temp != null) {
                manager = temp;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return manager;
    }

    @Override
    public int delete(int id) {
        return 0;
    }

    @Override
    public long selectCount() {
        return 0;
    }

    @Override
    public Manager selectOne(int id) {
        return null;
    }
}
