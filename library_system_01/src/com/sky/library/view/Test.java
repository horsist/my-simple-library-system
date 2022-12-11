package com.sky.library.view;

import com.sky.library.dao.DAO;
import com.sky.library.dao.impl.BookDAOImpl;
import com.sky.library.entity.Book;
import com.sky.library.entity.Page;
import com.sky.library.service.Service;
import com.sky.library.service.impl.BookServiceImpl;
import com.sky.library.util.DBUtil;

import java.sql.Connection;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        Service<Book> bookService = new BookServiceImpl();

        Book book = new Book("水浒传", "施耐庵", "78", "小说", "新华书局");
//        Book book2 = new Book(3,"水浒传", "施耐庵", "79", "借出","小说", "商务印书馆");
//        bookService.add(book);  //ok
//        bookService.removeObject(2);  ok
//        bookService.modify(book2);   //ok  做一个 status 筛选框
//        bookService

//        List<Book> books = bookService.showAll();
////        Page page = new Page(0, 5);
////        List<Book> books = bookService.showAll(page);
//        for (Book temp:books) {
//            System.out.println(temp);
//        }
//        Book book1 = bookService.showOne(1);
//        System.out.println(book1);

        Book book2 = new Book("book_name", "author", "45", "book_type", "publisher");
        bookService.add(book2);
        bookService.showAll();
    }
}
