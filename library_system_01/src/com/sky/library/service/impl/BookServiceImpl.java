package com.sky.library.service.impl;

import com.sky.library.dao.DAO;
import com.sky.library.dao.impl.BookDAOImpl;
import com.sky.library.entity.Book;
import com.sky.library.entity.Page;
import com.sky.library.service.Service;
import com.sky.library.util.DBUtil;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class BookServiceImpl implements Service<Book> {
    private DAO<Book> bookDAO  = new BookDAOImpl();

    //查询所有书籍信息分页显示
    @Override
    public List<Book> showAll(Page page) {
        List<Book> bookList = new ArrayList<>();
        try {
            DBUtil.begin();
            long count = bookDAO.selectCount();
            page.setTotalCounts((int)count);
            List<Book> books = bookDAO.selectAll(page);
            if (books != null){
                bookList=books;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return bookList;
    }

    //弃用
    @Override
    public Book login(String username, String password) {
        return null;
    }

    //弃用
    @Override
    public List<Book> showAll() {

        return null;
    }


    //移除书本   管
    @Override
    public int removeObject(int book_id) {
        int result = 0;
        try {
            DBUtil.begin();
            int delete = bookDAO.delete(book_id);
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


    //修改书本信息
    @Override
    public int modify(Book book) {
        int result = 0;
        try {
            DBUtil.begin();
            int update = bookDAO.update(book);
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


    //增加书本    管
    @Override
    public int add(Book book) {
        //新增图书好像不需要考虑什么，直接上架就行，回头有 新功能在增加，别忘了事务
        int result=0;
        try {
            DBUtil.begin();
            int insert = bookDAO.insert(book);
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
    public Book showOne(int id) {
        Book book = null;
        try {
            DBUtil.begin();
            Book booktemp = bookDAO.selectOne(id);
            if (booktemp != null){
                book=booktemp;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public List<Book> showBorrowedBook(int reader_no) {
        List<Book> books = null;
        try {
            DBUtil.begin();
            List<Book> bookstemp = bookDAO.selectborrowedbook(reader_no);
            if (bookstemp != null){
                books=bookstemp;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }
        return books;
    }

    @Override
    public List<Book> showAll(Page page, String root) {
        List<Book> bookList = new ArrayList<>();
        try {
            DBUtil.begin();
            long count = bookDAO.selectCount();
            page.setTotalCounts((int)count);
            List<Book> books = bookDAO.selectAll(page,"root");
            if (books != null){
                bookList=books;
            }
            DBUtil.commit();
        } catch (Exception e) {
            DBUtil.rollback();
            e.printStackTrace();
        }

        return bookList;
    }
}
