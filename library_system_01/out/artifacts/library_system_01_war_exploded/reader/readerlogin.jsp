<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.Reader" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.ReadersServiceImpl" %>
<%@ page import="com.sky.library.entity.Readers" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.entity.Page" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/11/28
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者登录处理</title>
</head>
<body>
<%System.out.println("readerlogin.jsp页面");%>
<%
    //获取html提交的三个信息 姓名 密码和验证码
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String inputVcode = request.getParameter("inputVcode");
    //验证验证码
    String code = (String) request.getSession().getAttribute("code");
    if (!inputVcode.isEmpty()&& inputVcode.equalsIgnoreCase(code)){
        //调用业务逻辑实现登录
        Service<Readers> readersService = new ReadersServiceImpl();
        Readers readers = readersService.login(username, password);
        if (readers!=null){//登录成功
            //存入session作用域
            request.getSession().setAttribute("reader",readers);

            //开始查询所有的书籍
//            Service<Book> bookService = new BookServiceImpl();
//            String pageIndex = request.getParameter("pageIndex");
//            System.out.println("页码"+pageIndex);
//            Page page1 = new Page(pageIndex==null ? 1:Integer.valueOf(pageIndex));
//            Page page1 = new Page(1);
//            List<Book> bookList = bookService.showAll(page1);
            //将所有书存到当前页面中
//            session.setAttribute("bookList",bookList);
//            session.setAttribute("page1",page1);

            //直接跳转过去
            response.sendRedirect(request.getContextPath()+"/reader/book/ShowAllPagePre.jsp");

        }else {
            //重定向到登录页面
            response.sendRedirect(request.getContextPath()+"/readerlogin.html");

        }
    }
%>

</body>
</html>
