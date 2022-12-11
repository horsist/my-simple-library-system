package com.sky.library.filter;

import com.sky.library.entity.Readers;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 读者鉴权
 */
@WebFilter(filterName = "ReaderFilter",value = "/reader/book/*")
public class ReaderFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Readers readers = (Readers) request.getSession().getAttribute("reader");
        if (readers!=null){
            chain.doFilter(req, resp);
        }else{
            response.sendRedirect(request.getContextPath()+"/readerlogin.html");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
