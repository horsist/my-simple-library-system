package com.sky.library.filter;

import com.sky.library.entity.Manager;
import com.sky.library.entity.Readers;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 读者鉴权
 */
@WebFilter(filterName = "ManagerFilter",value = "/manager/safe/*")
public class ManagerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        if (manager!=null){
            chain.doFilter(req, resp);
        }else{
            response.sendRedirect(request.getContextPath()+"/managerLogin.html");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
