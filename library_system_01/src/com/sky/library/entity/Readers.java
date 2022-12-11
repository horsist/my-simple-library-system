package com.sky.library.entity;

public class Readers {
    private int readerNo;  //借阅证编号
    private String reader_name;
    private String reader_password;  //借阅证密码
    private String reader_expiration;  //借阅证到期时间


    @Override
    public String toString() {
        return "Readers{" +
                "readerNo=" + readerNo +
                ", reader_name='" + reader_name + '\'' +
                ", reader_password='" + reader_password + '\'' +
                ", reader_expiration='" + reader_expiration + '\'' +
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

    public String getReader_password() {
        return reader_password;
    }

    public void setReader_password(String reader_password) {
        this.reader_password = reader_password;
    }

    public String getReader_expiration() {
        return reader_expiration;
    }

    public void setReader_expiration(String reader_expiration) {
        this.reader_expiration = reader_expiration;
    }

    public Readers(String reader_name, String reader_password, String reader_expiration) {
        this.reader_name = reader_name;
        this.reader_password = reader_password;
        this.reader_expiration =reader_expiration;
    }

    public Readers() {
    }

    public Readers(int readerNo, String reader_name, String reader_password, String reader_expiration) {
        this.readerNo = readerNo;
        this.reader_name = reader_name;
        this.reader_password = reader_password;
        this.reader_expiration = reader_expiration;
    }
}
