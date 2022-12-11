package com.sky.library.entity;
//翻页查询专用
public class Page {
    private Integer pageIndex;    //页码

    private Integer pageSize;     //页大小，显示多少行数

    private Integer totalCounts;   //数据总行数

    private Integer totalPages;   //总页数

    private Integer startRows;      //起始行



    public Page(Integer pageIndex, Integer pageSize) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.setStartRows((pageIndex-1)*pageSize);
    }

    public Page(Integer pageIndex) {
        this(pageIndex,5);
    }


    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCounts() {
        return totalCounts;
    }

    public void setTotalCounts(Integer totalCounts) {
        this.totalCounts = totalCounts;

        this.setTotalPages(totalCounts % pageSize == 0 ?totalCounts/pageSize:totalCounts/pageSize+1);
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getStartRows() {
        return startRows;
    }

    public void setStartRows(Integer startRows) {
        this.startRows = startRows;
    }
}
