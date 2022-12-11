package com.sky.library.controller;

import com.sky.library.entity.Readers;
import com.sky.library.service.Service;
import com.sky.library.service.impl.ReadersServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *这个页面做读者登录用，记录读者登录后的信息，并且向调用业务代码验证读者信息
 */
@WebServlet(name = "ReaderLoginServlet",value = "/readerlogin")
public class ReaderLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("/readerlogin界面");
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
                String reader_name = readers.getReader_name();
                //存入session作用域
                request.getSession().setAttribute(reader_name,readers);
                //跳转到查询所有controller
//                response.sendRedirect(request.getContextPath()+"");
                response.getWriter().println("登录成功!");
            }else {
                //重定向到登录页面
                response.sendRedirect(request.getContextPath()+"/reader/readerlogin.html");

            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
