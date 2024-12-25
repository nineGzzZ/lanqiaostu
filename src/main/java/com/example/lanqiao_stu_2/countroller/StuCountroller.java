package com.example.lanqiao_stu_2.countroller;

import cn.hutool.core.net.multipart.MultipartFormData;
import cn.hutool.core.net.multipart.UploadFile;
import cn.hutool.extra.servlet.ServletUtil;
import com.example.lanqiao_stu_2.dao.StuDao;
import com.example.lanqiao_stu_2.entity.StuInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/stu",loadOnStartup = 1)
public class StuCountroller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
         }else if (method.equals("toadd")){
             toadd(req,resp);
         }
    }

//    ===========================跳转添加学员===============================
    protected void toadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("WEB-INF/templates/addstu.jsp").forward(req,resp);
    }
    //==========================添加学员===================================
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //接收“多用途表单”请求传过来的整个数据包
        MultipartFormData multipart = ServletUtil.getMultipart(req);

        String stu_name = multipart.getParam("stu_name");
        System.out.println("name is " + stu_name);
        String stu_age = multipart.getParam("stu_age");
        System.out.println("age is " + stu_age);
        String stu_sex = multipart.getParam("stu_sex");
        System.out.println("sex is " + stu_sex);
        String stu_school = multipart.getParam("stu_school");
        System.out.println("school is " + stu_school);
        String stu_phone = multipart.getParam("stu_phone");
        System.out.println("phone is " + stu_phone);
        String stu_profession = multipart.getParam("stu_profession");
        System.out.println("profession is " + stu_profession);
        String stu_no = multipart.getParam("stu_no");
        System.out.println("stu_no is " + stu_no);
        String class_id = multipart.getParam("class_id");
        System.out.println("class_id is " + class_id);

        /*
        将文件存储到upload文件夹
         */


        //获取表单中的文件head
        UploadFile stu_head = multipart.getFile("stu_head");
        //读取web项目中upload文件夹的所在tomcat的真实路径
        String prefix = req.getServletContext().getRealPath("upload");
        //拼接完整路径（实际要存的路径）
        String fullPath = prefix+"/"+stu_head.getFileName();
        //将文件存入fullPath
        stu_head.write(fullPath);
        System.out.println("文件名："+stu_head.getFileName());
        StuDao stuDao=new StuDao();
        int result = stuDao.insert(stu_head.getFileName(),stu_name,stu_no,stu_age,stu_sex,stu_school,stu_phone,class_id,stu_profession);
        // 根据插入结果进行处理
        if (result > 0) {
            // 插入成功
            resp.getWriter().println("<script>alert('添加成功'); window.location.href='stu?method=select';</script>");
        } else {
            // 插入失败
            resp.getWriter().println("<script>alert('添加失败');  window.location.href='stu?method=select';</script>");
        }
    }
    //===========================查询学员===================================
    protected void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          StuDao stuDao = new StuDao();
        List<StuInfo> select = stuDao.select();
        req.setAttribute("select",select);
        req.getRequestDispatcher("WEB-INF/templates/stuinfomanager.jsp").forward(req,resp);
    }

    //==========================删除学员====================================
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StuDao stuDao=new StuDao();
        String stu_id = req.getParameter("stu_id");
        System.out.println(stu_id);
        int a =stuDao.delete(stu_id);
        if(a>0){
            resp.getWriter().println("<script>alert('删除成功'); window.location.href='stu?method=select';</script>");
        }else {
            resp.getWriter().println("<script>alert('删除失败');  window.location.href='stu?method=select';</script>");
        }

    }
    //=====================跳转至修改页面========================
    protected void toupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String stu_id =req.getParameter("stu_id");
        StuDao stuDao=new StuDao();
        List<StuInfo> select = stuDao.selectById(stu_id);
        req.setAttribute("stu",select);
        req.getRequestDispatcher("WEB-INF/templates/updatestu.jsp").forward(req,resp);
    }

    //========================修改学员==================================
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String stu_id = req.getParameter("stu_id");

        String stu_name = req.getParameter("stu_name");
        String stu_age = req.getParameter("stu_age");
        String stu_sex = req.getParameter("stu_sex");
        String stu_phone = req.getParameter("stu_phone");
        String stu_school = req.getParameter("stu_school");
        String stu_profession = req.getParameter("stu_profession");

        StuDao stuDao=new StuDao();
        int update = stuDao.update( stu_name, stu_age, stu_sex, stu_school, stu_phone, stu_profession,stu_id);
        if (update>0){
            resp.getWriter().println("<script>alert('修改成功'); window.location.href='stu?method=select';</script>");
        }else {
            resp.getWriter().println("<script>alert('修改失败'); window.location.href='stu?method=select';</script>");
        }
    }
}
