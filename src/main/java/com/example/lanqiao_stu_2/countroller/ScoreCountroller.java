package com.example.lanqiao_stu_2.countroller;

import com.example.lanqiao_stu_2.dao.ScoreDao;
import com.example.lanqiao_stu_2.dao.StuDao;
import com.example.lanqiao_stu_2.entity.ScoreInfo;
import com.example.lanqiao_stu_2.entity.StuInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/score",loadOnStartup = 1)
public class ScoreCountroller extends HttpServlet {
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
         }
    }

    //=============================查询列表=================================
    protected void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         ScoreDao scoreDao = new ScoreDao();
        List<ScoreInfo> select = scoreDao.select();

        StuDao stuDao=new StuDao();
        List<StuInfo> select1 = stuDao.select();
        req.setAttribute("select",select);
        req.setAttribute("select1",select1);
        req.getRequestDispatcher("WEB-INF/templates/scoremanager.jsp").forward(req,resp);
    }

    //=============================添加分数=================================
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String score_type = req.getParameter("score_type");
        String score_value=req.getParameter("score_value");
        String score_contents=req.getParameter("score_contents");
        String time=req.getParameter("time");
        String ssss = req.getParameter("stu_name");
        String[] split = ssss.split(",");
        String stu_id = split[0];
        String class_id = split[1];
        ScoreDao scoreDao=new ScoreDao();
        int result = scoreDao.insert(score_type,score_value,stu_id,score_contents,time,class_id);
        // 根据插入结果进行处理
        if (result > 0) {
            // 插入成功
            resp.getWriter().println("<script>alert('添加成功'); window.location.href='score?method=select';</script>");
        } else {
            // 插入失败
            resp.getWriter().println("<script>alert('添加失败');  window.location.href='score?method=select';</script>");
        }
    }

    //=============================修改分数=================================
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String score_id = req.getParameter("score_id");
        String score_type = req.getParameter("score_type");
        String score_value = req.getParameter("score_value");
        String score_contents = req.getParameter("score_contents");
        String time = req.getParameter("time");
        ScoreDao scoreDao=new ScoreDao();
        int result = scoreDao.update(score_type,score_value,score_contents,time,score_id);
        // 根据插入结果进行处理
        if (result > 0) {
            // 插入成功
            resp.getWriter().println("<script>alert('修改成功'); window.location.href='score?method=select';</script>");
        } else {
            // 插入失败
            resp.getWriter().println("<script>alert('修改失败');  window.location.href='score?method=select';</script>");
        }

    }
    //=============================删除分数=================================
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ScoreDao scoreDao=new ScoreDao();
        String score_id = req.getParameter("score_id");
        System.out.println(score_id);
        int a =scoreDao.delete(score_id);
        if(a>0){
            resp.getWriter().println("<script>alert('删除成功'); window.location.href='score?method=select';</script>");
        }else {
            resp.getWriter().println("<script>alert('删除失败');  window.location.href='score?method=select';</script>");
        }

    }
    //=============================跳转修改分数=================================
    protected void toupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String score_id=req.getParameter("score_id");
        ScoreDao scoreDao = new ScoreDao();
        List<ScoreInfo> select = scoreDao.selectById(score_id);
        req.setAttribute("score",select);

        req.getRequestDispatcher("WEB-INF/templates/updatescore.jsp").forward(req,resp);
    }
}

