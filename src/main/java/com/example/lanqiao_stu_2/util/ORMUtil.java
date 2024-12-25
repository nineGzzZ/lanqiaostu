package com.example.lanqiao_stu_2.util;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * ORM（对象关系映射）
 * O：object对象  			->java实体类
 * R：relational关系		->数据库的表
 * M：mapping映射
 *
 *
 * 企业级框架<持久层框架>都是应用了ORM这种技术（通过反射来实现）：
 * mybatis、hibernate
 *
 * @author Administrator
 *
 */
public class ORMUtil extends DBUtil_v4 {

//    private static ORMUtil instance=null;
//
//    private ORMUtil(){
//
//    }
//
//    public static ORMUtil getInstance(){
//        if (instance==null) {
//            instance=new ORMUtil();
//        }
//        return instance;
//    }


    /**
     * 执行增、删、改语句的方法
     * @param sql			要执行的SQL语句，如果需要拼接参数就用?号占位
     * @param paramList		按照?号的顺序，填充对应的值
     * @return
     */
    public int executeDML(String sql, Object... paramList) {
        return super.executeDML(sql, paramList);
    }


    /**
     * 执行Insert语句（可以返回自增长的ID值）
     *
     * @throws SQLException
     */
    public int executeDMLByInsert(String sql, Object... paramList){
        return super.executeDMLByInsert(sql, paramList);
    }


    /**
     * 执行查询语句，返回列表
     * @param clazz
     * @param sql
     * @param paramList
     * @return
     */
    public <T> List<T> selectList(Class<T> clazz,String sql,Object... paramList){
        //最后要返回的list
        List<T> list=new ArrayList<T>();
        //从数据库取出来的mapList
        List<Map<String, Object>> listMap=executeDQL(sql, paramList);

        try {
            for (Map<String, Object> map : listMap) {
                Set<String> allKeys=map.keySet();

                //获取clazz的所有字段
                Field[] fieldArray=clazz.getDeclaredFields();
                T obj=clazz.newInstance();


                for (String key : allKeys) {

                    for (Field field : fieldArray) {
                        if (field.getName().toLowerCase().equals(key.toLowerCase())) {
                            field.setAccessible(true);

                            try {
                                field.set(obj, map.get(key));
                            } catch (Exception e) {
                                //捕获到了IllegalArgumentException异常才会进入
                                //数据库结果集中字段的类型   与  java实体类中属性的类型   不匹配
                                //map.get(key)          field

                                Object value=map.get(key);

                                if (value!=null) {
                                    if (value.getClass() == Date.class) {//数据库那边是datetime
                                        if (field.getType().getName()
                                                .equals("java.lang.String")) {//java这边是String
                                            Date dateValue = (Date) value;

                                            SimpleDateFormat sdf = new SimpleDateFormat(
                                                    "yyyy-MM-dd");
                                            String strValue = sdf
                                                    .format(dateValue);

                                            field.set(obj, strValue);

                                        }
                                    }
                                    if (field.getType() == char.class) {//java这边是char
                                        if (value.getClass() == String.class) {//数据库那边是String
                                            String str = (String) value;
                                            field.set(obj, str.charAt(0));
                                        }
                                    }
                                    if (field.getType() == double.class) {//java这边是double
                                        if (value.getClass() == BigDecimal.class) {//数据库那边是BigDecimal
                                            BigDecimal str = (BigDecimal) value;
                                            field.set(obj, str.doubleValue());
                                        }
                                    }
                                }


//								if (value.getClass()==BigDecimal.class) {//数据库是number类型
//									if (field.getType()==int.class) {//java这边是int
//
//									}
//									if (field.getType()==double.class) {//java这边是double
//
//									}
//								}

                            }


                        }
                    }
                }
                list.add(obj);
            }

        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return list;
    }

    /**
     * 执行查询语句，返回单个对象的信息
     * @param clazz
     * @param sql
     * @param paramList
     * @return
     */
    public <T> T selectOne(Class<T> clazz,String sql,Object... paramList){
        List<T> list = this.selectList(clazz,sql,paramList);
        return list.size()>0 ? list.get(0) : null;
    }


    /**
     * 查询单个值得时候使用该方法
     * @param key			查询到的列的名称 或 别名
     * @param sql			要执行查询的SQL语句
     * @param paramList		填充?号的参数列表
     * @return	返回null代表没有获取到你要的列名的值
     */
    public Object selectSingleValue(String key,String sql,Object... paramList){
        List<Map<String, Object>> listMap = executeDQL(sql, paramList);
        return listMap.size()>0 ? listMap.get(0).get(key) : null;
    }







}
