package com.sky.library.dao;

import com.sky.library.entity.Page;

import java.util.List;

public interface DAO <T>{
    public List<T> selectAll();
    //表增加一条数据
    public int insert(T t);
    //修改一条数据
    public int update(T t);
    //给一个查询全部的方法 分页显示
    public List<T> selectAll(Page page);
    //给一个登录的方法 管理员或读者
    public T select(String username);
    //给一个删除数据的方法
    public int delete(int id);
    //查询总行数
    public long selectCount();


    //给一个登录的方法 管理员或读者
    public T selectOne(int id);

    default List<T> selectborrowedbook(int reader_no){
        return null;
    }

    default List<T> selectAll(Page page, String root){
        return null;
    }
}
