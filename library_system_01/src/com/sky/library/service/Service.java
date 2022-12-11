package com.sky.library.service;

import com.sky.library.entity.Page;

import java.util.List;

public interface Service<T> {
    //给一个查询全部的方法 分页显示
    public List<T> showAll(Page page);

    //给一个登录的方法 管理员或读者
    public T login(String username,String password);
    //给一个查询全部的方法
    public List<T> showAll();
    //给一个删除数据的方法
    public int removeObject(int id);
    //给一个修改数据的方法
    public int modify(T t);

    //读者注册的方法  reader专用
    public int add(T t);
    public T showOne(int id);

   default List<T> showBorrowedBook(int reader_no){
       return null;
   }



    default  List<T> showAll(Page page1, String root){
       return null;
    }
}
