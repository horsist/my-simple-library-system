show databases ;

create database if not exists  sky default character set utf8mb4 collate utf8mb4_general_ci;

show create database sky;

create table if not exists sky.test(
    id int
)default charset =utf8mb4 engine =innodb auto_increment= 56;


show create table sky.test;
insert into sky.test values (1);

select * from sky.test;


/*图书信息表*/

create table if not exists sky.book
(
   id int primary key auto_increment comment '图书编号'
    ,book_name varchar(20) not null comment '书名'
    ,author    varchar(20) not null  comment '作者'
    ,book_price decimal(10,2)  comment '书籍价格'
    ,book_status enum('借出','未借出') default '未借出' comment '书籍借阅状态'
    ,book_type varchar(20) not null  comment '图书类别'
    ,publisher varchar(20) default '人民教育出版社' comment '出版社'
    ,readerNo int
    ,reader_name varchar(20)
    ,book_expiration varchar(20) default '2022-12-31' comment '归还日期'
) default charset =utf8mb4 engine =innodb;
/*读者信息表*/
create table if not exists sky.readers(
    readerNo int primary key auto_increment comment '借阅证编号 自增主键'
    ,reader_name varchar(20) not null  comment '借阅人姓名'
    ,reader_password varchar(20) not null default '123456' comment '借阅证密码默认123456'
    ,reader_expiration varchar(20) not null default '9999-12-31' comment '借阅证到期时间'
)default charset =utf8mb4 engine =innodb;
/*管理员信息表*/
create table if not exists sky.manager(
     manager_name varchar(20) not null  comment '管理员姓名'
    ,manager_password varchar(20) not null  comment '管理员密码'
)default charset =utf8mb4 engine =innodb;

alter table sky.book Add column readerNo varchar(20) ;
alter table sky.book Add column book_expiration varchar(20) default '2022-12-31' comment '归还日期';
alter table sky.book modify column readerNo  bigint ;
alter table sky.book modify column id  bigint ;
alter table sky.readers modify column readerNo  bigint ;
alter table sky.book Add column reader_name varchar(20) ;
insert into sky.book(book_name, author, book_price, book_type) values('三国演义','罗贯中','56','小说');
insert into sky.book(book_name, author, book_price, book_type,publisher) values('三国演义','罗贯中','56','小说','北师大版');

select * from sky.book;

insert into sky.readers(reader_name)
values ('tom');

select * from sky.readers;

show create table  sky.readers;

insert into sky.manager (manager_name, manager_password)
values ('root','root');

select * from sky.manager;

UPDATE sky.book SET book_status = '未借出' , readerNo = NULL,reader_name=NULL  where reader_name='?';

