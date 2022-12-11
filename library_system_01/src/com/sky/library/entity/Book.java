package com.sky.library.entity;

import java.math.BigInteger;

public class Book {
    private int id;   //图书编号
    private String book_name;   //书名
    private String author;  //作者
    private String book_price;  //
    private String  book_status ;  //借阅状态
    private String  book_type ;   //
    private String  publisher ;  //出版社
    private int readerNo; //借阅证编号
    private String reader_name; //借阅人
    private String book_expiration; //归还日期


    public Book(int id, String book_name, String author, String book_price, String book_status, String book_type, String publisher, int readerNo, String reader_name, String book_expiration) {
        this.id = id;
        this.book_name = book_name;
        this.author = author;
        this.book_price = book_price;
        this.book_status = book_status;
        this.book_type = book_type;
        this.publisher = publisher;
        this.readerNo = readerNo;
        this.reader_name = reader_name;
        this.book_expiration = book_expiration;
    }

    public Book(String book_name, String author, String book_price, String book_type, String publisher) {
        this.book_name = book_name;
        this.author = author;
        this.book_price = book_price;
        this.book_type = book_type;
        this.publisher = publisher;
    }



    public Book(int id, String book_name, String author, String book_price, String book_status, String book_type, String publisher, int readerNo, String reader_name) {
        this.id = id;
        this.book_name = book_name;
        this.author = author;
        this.book_price = book_price;
        this.book_status = book_status;
        this.book_type = book_type;
        this.publisher = publisher;
        this.readerNo = readerNo;
        this.reader_name = reader_name;
    }


    public String getBook_expiration() {
        return book_expiration;
    }

    public void setBook_expiration(String book_expiration) {
        this.book_expiration = book_expiration;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", book_name='" + book_name + '\'' +
                ", author='" + author + '\'' +
                ", book_price='" + book_price + '\'' +
                ", book_status='" + book_status + '\'' +
                ", book_type='" + book_type + '\'' +
                ", publisher='" + publisher + '\'' +
                ", readerNo=" + readerNo +
                ", reader_name='" + reader_name + '\'' +
                ", book_expiration='" + book_expiration + '\'' +
                '}';
    }

    public int getReaderNo() {
        return readerNo;
    }

    public void setReaderNo(int readerNo) {
        this.readerNo = readerNo;
    }

    public String getReader_name() {
        return reader_name;
    }

    public void setReader_name(String reader_name) {
        this.reader_name = reader_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBook_price() {
        return book_price;
    }

    public void setBook_price(String book_price) {
        this.book_price = book_price;
    }

    public String getBook_status() {
        return book_status;
    }

    public void setBook_status(String book_status) {
        this.book_status = book_status;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Book() {
    }

    public Book(String book_name, String author, String book_price, String book_type) {
        this.book_name = book_name;
        this.author = author;
        this.book_price = book_price;
        this.book_type = book_type;
    }

    public Book(int id, String book_name, String author, String book_price, String book_status, String book_type, String publisher) {
        this.id = id;
        this.book_name = book_name;
        this.author = author;
        this.book_price = book_price;
        this.book_status = book_status;
        this.book_type = book_type;
        this.publisher = publisher;
    }
}
