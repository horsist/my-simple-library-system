<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.Reader" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.ReadersServiceImpl" %>
<%@ page import="com.sky.library.entity.Readers" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.entity.Page" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sky.library.entity.Manager" %>
<%@ page import="com.sky.library.service.impl.ManagerServiceImpl" %><%--
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
<%System.out.println("managerlogin.jsp页面");%>
<%
    //获取html提交的三个信息 姓名 密码和验证码
    String username = request.getParameter("username");
    String password = request.getParameter("password");
        //调用业务逻辑实现登录
        Service<Manager> managerService = new ManagerServiceImpl();
        Manager manager = managerService.login(username, password);
        if (manager!=null){//登录成功
            String manager_name = manager.getManager_name();
            //存入session作用域
            request.getSession().setAttribute("manager",manager);


            //直接跳转过去
            response.sendRedirect(request.getContextPath()+"/manager/safe/ManagerChoosePre.jsp");

        }else {
            //重定向到登录页面
            response.sendRedirect(request.getContextPath()+"/managerlogin.html");

        }
%>

</body>
</html>
