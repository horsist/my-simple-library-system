package com.sky.library.dao.impl;

import com.sky.library.dao.DAO;

import com.sky.library.entity.Manager;
import com.sky.library.entity.Page;
import com.sky.library.entity.Readers;
import com.sky.library.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.io.Reader;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReadersDAOImpl implements DAO<Readers> {
    private QueryRunner queryRunner = new QueryRunner();
    @Override
    public List<Readers> selectAll() {
        List<Readers> readers =null;
        try {
            readers = queryRunner.query(DBUtil.getConnection(), "select * from sky.readers;", new BeanListHandler<Readers>(Readers.class));
            return readers;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }

    @Override
    public int insert(Readers readers) {
        int result = 0;
        try {
            int insert = queryRunner.update(DBUtil.getConnection()
                    , "insert into sky.readers(reader_name,reader_password,reader_expiration) " +
                    "values(?,?,?);", readers.getReader_name(), readers.getReader_password(), readers.getReader_expiration());
            if (insert>0){
                result=insert;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    @Override
    public int update(Readers readers) {
        int result = 0;
        try {
            int update = queryRunner.update(DBUtil.getConnection()
                    , "update readers set reader_name=?,reader_password=?,reader_expiration=? where readerNo=?;"
                    , readers.getReader_name(), readers.getReader_password(), readers.getReader_expiration(),readers.getReaderNo());
            if (update>0){
                result=update;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Readers> selectAll(Page page) {
        List<Readers> readersList=new ArrayList<>();

        try {
            List<Readers> readersList1 = queryRunner.query(DBUtil.getConnection(), "select * from sky.readers limit ? , ?", new BeanListHandler<Readers>(Readers.class), page.getPageIndex(), page.getPageSize());
            if (readersList1!=null){
                readersList=readersList1;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return readersList;
    }

    @Override
    public Readers select(String name) {
        Readers reader =null;
        try {
            Readers temp = queryRunner.query(DBUtil.getConnection(), "select * from readers where reader_name = ?", new BeanHandler<Readers>(Readers.class), name);
            if (temp != null) {
                reader = temp;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return reader;
    }

    @Override
    public int delete(int readerNo) {
        int result = 0;

        try {
            int delete = queryRunner.update(DBUtil.getConnection(), "delete from sky.readers where readerNo=?", readerNo);
            if (delete>0){
                result=delete;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return result;
    }

    @Override
    public long selectCount() {
        try {
            return queryRunner.query(DBUtil.getConnection(),"select count(*) from sky.readers;",new ScalarHandler<>());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    @Override
    public Readers selectOne(int id) {
        return null;
    }


}
