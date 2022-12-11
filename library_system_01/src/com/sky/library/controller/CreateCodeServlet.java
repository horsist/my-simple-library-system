package com.sky.library.controller;

import cn.dsna.util.images.ValidateCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
//验证码专用
@WebServlet(name = "CreateCodeServlet",value = "/createcode")
public class CreateCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("/createcode页面");

        //生成验证码
        ValidateCode validateCode = new ValidateCode(200, 30, 4, 3);
        //获取验证码的文字
        String code = validateCode.getCode();
        //将验证码保存再session中
        HttpSession session = request.getSession();
        session.setAttribute("code",code);

        //输出流写验证码
        validateCode.write(response.getOutputStream());






    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
