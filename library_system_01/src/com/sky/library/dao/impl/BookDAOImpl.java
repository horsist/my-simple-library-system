package com.sky.library.dao.impl;

import com.sky.library.dao.DAO;
import com.sky.library.entity.Book;
import com.sky.library.entity.Page;
import com.sky.library.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl  implements DAO<Book> {
    private QueryRunner queryRunner = new QueryRunner();
    @Override
    public List<Book> selectAll() {
        List<Book> books =null;
        try {
            books = queryRunner.query(DBUtil.getConnection(), "select * from sky.book", new BeanListHandler<Book>(Book.class));
            return books;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }

    @Override
    public int insert(Book book) {
        int result = 0;
        try {
            int insert = queryRunner.update(DBUtil.getConnection(), "insert into sky.book(book_name, author, book_price, book_type,publisher) " +
                            "values(?,?,?,?,?);"
                    , book.getBook_name(), book.getAuthor(), book.getBook_price(), book.getBook_type(), book.getPublisher());

            if (insert>0){
                result=insert;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    @Override
    public int update(Book book) {
        int result = 0;
        try {
            int update = queryRunner.update(DBUtil.getConnection()
                    ,"update sky.book set book_name=?,author=?,book_price=?,book_status=?,book_type=?,publisher=?,readerNo=?,reader_name=? ,book_expiration=? where id=?;" ,
              book.getBook_name(), book.getAuthor(), book.getBook_price(),book.getBook_status(), book.getBook_type(), book.getPublisher(),book.getReaderNo(),book.getReader_name(),book.getBook_expiration(),book.getId());
            if (update>0){
                result=update;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Book> selectAll(Page page) {
        List<Book> bookList =new ArrayList<>();

        try {
            List<Book> bookList1 = queryRunner.query(DBUtil.getConnection(), "select * from sky.book where book_status = '未借出' limit ? , ?", new BeanListHandler<Book>(Book.class), page.getStartRows(), page.getPageSize());
            if (bookList1!=null){
                bookList=bookList1;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookList;
    }

    @Override
    public List<Book> selectAll(Page page,String root) {
        List<Book> bookList =new ArrayList<>();

        try {
            List<Book> bookList1 = queryRunner.query(DBUtil.getConnection(), "select * from sky.book  limit ? , ?", new BeanListHandler<Book>(Book.class), page.getStartRows(), page.getPageSize());
            if (bookList1!=null){
                bookList=bookList1;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookList;
    }

    @Override
    public Book select(String username) {
        return null;
    }

    @Override
    public int delete(int id) {
        int result = 0;

        try {
            int delete = queryRunner.update(DBUtil.getConnection(), "delete from sky.book where id=?", id);
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
            return queryRunner.query(DBUtil.getConnection(),"select count(*) from sky.book;",new ScalarHandler<>());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    @Override
    public Book selectOne(int id) {
        Book book =null;
        try {
            book = queryRunner.query(DBUtil.getConnection(), "select * from sky.book where id=?", new BeanHandler<Book>(Book.class),id);
            return book;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }


    @Override
    public List<Book> selectborrowedbook(int reader_no) {
        List<Book> bookList =new ArrayList<>();

        try {
            List<Book> bookList1 = queryRunner.query(DBUtil.getConnection(), "select * from sky.book where book_status = '借出' and readerNo = ?", new BeanListHandler<Book>(Book.class), reader_no);
            if (bookList1!=null){
                bookList=bookList1;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookList;
    }
}
