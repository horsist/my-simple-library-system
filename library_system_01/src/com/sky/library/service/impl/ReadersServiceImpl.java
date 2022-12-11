package com.sky.library.service.impl;

import com.sky.library.dao.DAO;
import com.sky.library.dao.impl.ReadersDAOImpl;
import com.sky.library.entity.Page;
import com.sky.library.entity.Readers;
import com.sky.library.service.Service;
import com.sky.library.util.DBUtil;

import java.util.ArrayList;
import java.util.List;

public class ReadersServiceImpl implements Service<Readers> {
    private DAO<Readers> readersDAO  = new ReadersDAOImpl();
    //分页显示读者信息表   管
    @Override
    public List<Readers> showAll(Page page) {
        List<Readers> readersList = new ArrayList<>();
        try {
            DBUtil.begin();
            List<Readers> readersList1 = readersDAO.selectAll(page);
            if (readersList1 != null){
                readersList=readersList1;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return readersList;
    }


    //读者登录
    @Override
    public Readers login(String username, String password) {
        //比对密码
        Readers reader = null;
        try {
            DBUtil.begin();
            Readers temp = readersDAO.select(username);
            if (temp!=null){  //有这人
                if (temp.getReader_password().equals(password)){
                    reader=temp;
                }
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }


        return reader;
    }


    //查询所有读者的信息 管
    @Override
    public List<Readers> showAll() {
        List<Readers> readersList = new ArrayList<>();
        try {
            DBUtil.begin();
            List<Readers> readers = readersDAO.selectAll();
            if (readers != null){
                readersList=readers;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return readersList;
    }


    //根据阅读号删除读者信息   管
    @Override
    public int removeObject(int readNo) {
        int result = 0;
        try {
            DBUtil.begin();
            int delete = readersDAO.delete(readNo);
            if (delete>0){
                result=delete;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return result;
    }


    //修改读者信息    管
    @Override
    public int modify(Readers readers) {
        int result = 0;
        try {
            DBUtil.begin();
            int update = readersDAO.update(readers);
            if (update>0){
                result=update;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return result;
    }

    //增加读者    管
    @Override
    public int add(Readers readers) {
        //新增图书好像不需要考虑什么，直接上架就行，回头有 新功能在增加，别忘了事务
        int result=0;
        try {
            DBUtil.begin();
            int insert = readersDAO.insert(readers);
            if (insert>1){//插入数据成功
                result=insert;
            }
            DBUtil.commit();
            return result;
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Readers showOne(int id) {
        return null;
    }
}
