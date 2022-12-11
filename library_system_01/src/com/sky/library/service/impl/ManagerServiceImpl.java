package com.sky.library.service.impl;

import com.sky.library.dao.DAO;
import com.sky.library.dao.impl.ManagerDAOImpl;
import com.sky.library.entity.Manager;
import com.sky.library.entity.Page;
import com.sky.library.entity.Readers;
import com.sky.library.service.Service;
import com.sky.library.util.DBUtil;

import java.util.List;

public class ManagerServiceImpl implements Service<Manager> {
    DAO<Manager> managerDAO = new ManagerDAOImpl();
    @Override
    public List<Manager> showAll(Page page) {
        return null;
    }

    @Override
    public Manager login(String username, String password) {
        //比对密码
        Manager manager = null;
        try {
            DBUtil.begin();
            Manager temp = managerDAO.select(username);
            if (temp!=null){  //有这人
                if (temp.getManager_password().equals(password)){
                    manager=temp;
                }
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }


        return manager;
    }

    @Override
    public List<Manager> showAll() {
        return null;
    }

    @Override
    public int removeObject(int id) {
        return 0;
    }

    @Override
    public int modify(Manager manager) {
        return 0;
    }

    @Override
    public int add(Manager manager) {
        return 0;
    }

    @Override
    public Manager showOne(int id) {
        return null;
    }



}
