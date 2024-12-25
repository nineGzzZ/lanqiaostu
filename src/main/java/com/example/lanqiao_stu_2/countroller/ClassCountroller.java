package com.example.lanqiao_stu_2.countroller;

import com.example.lanqiao_stu_2.dao.ClassDao;
import com.example.lanqiao_stu_2.entity.ClassInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/clazz",loadOnStartup = 1)
public class ClassCountroller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求字符编码
        // 设置响应内容类型和字符编码

         String method = req.getParameter("method");
         if (method.equals("select")){
            select(req,resp);
         }else if (method.equals("add")){
             add(req,resp);
         }else if (method.equals("delete")){
             delete(req,resp);
         }else if (method.equals("toupdate")){
             toupdate(req,resp);
         }else if (method.equals("update")){
             update(req,resp);
         }
    }

    //=============================查询列表=================================
    protected void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClassDao classDao=new ClassDao();
        List<ClassInfo> classinfolist = classDao.select();
        req.setAttribute("classinfolist",classinfolist);

        req.getRequestDispatcher("WEB-INF/templates/classmanager.jsp").forward(req,resp);
    }

    //============================增加班级=====================================
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置响应内容类型和字符编码

        String class_name = req.getParameter("class_name");
        ClassDao classDao=new ClassDao();
        int result = classDao.insert(class_name);


        // 根据插入结果进行处理
        if (result > 0) {
            // 插入成功
            resp.getWriter().println("<script>alert('添加成功'); window.location.href='clazz?method=select';</script>");
        } else {
            // 插入失败
            resp.getWriter().println("<script>alert('添加失败');  window.location.href='clazz?method=select';</script>");
        }
    }


    // =====================================删除班级=======================================
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClassDao classDao =new ClassDao();
        String class_id = req.getParameter("class_id");
        System.out.println(class_id);
        int a =classDao.delete(class_id);
        if(a>0){
            resp.getWriter().println("<script>alert('删除成功'); window.location.href='clazz?method=select';</script>");
        }else {

            resp.getWriter().println("<script>alert('删除失败');  window.location.href='clazz?method=select';</script>");
        }
    }


    // =========================跳转修改班级===============================
    protected void toupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String class_name =req.getParameter("class_name");
        req.setAttribute("class_name",class_name);
        String class_id =req.getParameter("class_id");
        req.setAttribute("class_id",class_id);
        req.getRequestDispatcher("WEB-INF/templates/updateclass.jsp").forward(req,resp);

    }

    // ==============================修改班级==========================
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String class_id = req.getParameter("class_id");
        String class_name = req.getParameter("class_name");
        ClassDao classDao=new ClassDao();
        int update = classDao.update(class_id, class_name);
        if (update>0){
            resp.getWriter().println("<script>alert('修改成功'); window.location.href='clazz?method=select';</script>");
        }else {
            resp.getWriter().println("<script>alert('修改失败'); window.location.href='clazz?method=select';</script>");
        }
    }
}
