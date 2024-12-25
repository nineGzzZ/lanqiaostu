package com.example.lanqiao_stu_2.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

public abstract class DBUtil_v4 {

    /*
     * 数据库连接属性
     */


    private static DataSource ds = null;
    //连接
    private  Connection conn = null;
    //句柄
    private  PreparedStatement stmt = null;
    //结果集
    private  ResultSet rs = null;

    static {
        //调用上面的方法来获取Druid数据源对象
        ds = getDataSourceWithDruid() ;
    }

    //打开连接
    private void open() throws SQLException {
        // 通过Druid数据库连接池获取连接对象
        conn = ds.getConnection();
    }
    //该方法用于获取Druid数据源对象
    public static DataSource getDataSourceWithDruid() {
        // 创建数据源对象
        DataSource dataSource = null;
        // 创建数据源配置对象
        Properties properties = new Properties();
        InputStream is = DBUtil_v4.class.getResourceAsStream("/druid.properties");
        try {
            properties.load(is);
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 返回数据源
        return dataSource;
    }
    /**
     * 执行DQL
     *
     * @throws SQLException
     */
    public  List<Map<String, Object>> executeDQL(String sql, Object... paramList) {
        List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();

        try {
            open();
            stmt = conn.prepareStatement(sql);
            if (paramList!=null) {
                // 3.1>填充参数(参数个数？，参数类型？)
                for (int i = 0; i < paramList.length; i++) {
                    stmt.setObject(i + 1, paramList[i]);
                }
            }
            // 4>执行DML语句
            rs = stmt.executeQuery();

            while (rs.next()) {//每次循环读取“一行记录”
                Map<String, Object> mapObj=new HashMap<String, Object>();

                /*
                 * 解析结果集，赋值给mapObj
                 */
                //获取结果集中的结构信息（包括字段名、字段总数量）
                ResultSetMetaData metaData=rs.getMetaData();
                //获取“字段总数量”
                int columnCount=metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    //metaData.getColumnName(i)  取出对应第几列的“列名”
                    //>mysql取出的列名是小写字母
                    //>oracle取出的列名是大写字母
                    //*****数据库是不区分大小写，而java是区分大小写。所以为了保证统一性，统一将取出来的列名转换大写/小写*****

                    Object valueObj=rs.getObject(i);

//					if (valueObj instanceof BigDecimal) {
//						//把BigDecimal类型统一转成了Integer
//						//如果是double呢？
//						//解决方案：
//						//如果实体类中对应的属性类型是int，那就转Integer
//						//如果实体类中对应的属性类型是double，那就转Double
//						valueObj=((BigDecimal) valueObj).intValue();
//					}

                    mapObj.put(metaData.getColumnLabel(i).toLowerCase(),valueObj);
                    //mapObj.put(metaData.getColumnName(i).toLowerCase(),valueObj);

                    //mapObj.put("字段名", rs.getObject("字段名/下标"));

                    /*
                     * rs.getObject(i)；
                     * 编译时类型是Object，而运行时类型取决于数据库中对应的那个字段的类型
                     *
                     * MySQL：
                     * int				-》	java中的Integer
                     * double			-》	java中的Double
                     * decimal			-》	java中的BigDecimal
                     * char				-》	java中的String
                     * varchar、text		-》	java中的String
                     * datetime			-》	java中的"java.sql.Date"
                     *
                     *
                     * Oracle：
                     * number					-》	java中的BigDecimal
                     * char						-》	java中的String
                     * varchar2、nvarchar2		-》	java中的String
                     * datetime					-》	java中的"java.sql.Date"
                     */

                }


                list.add(mapObj);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            close();
        }

        return list;// 返回的是解析结果集过后的“List集合”

    }

    /**
     * 执行DML
     *
     * @throws SQLException
     */
    public  int executeDML(String sql, Object... paramList) {

        // 4>执行DML语句
        int result=0;
        try {
            open();
            // 3>创建Statement对象
            stmt = conn.prepareStatement(sql);

            if (paramList!=null) {
                // 3.1>填充参数(参数个数？，参数类型？)
                for (int i = 0; i < paramList.length; i++) {
                    stmt.setObject(i +1, paramList[i]);
                }
            }
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            close();
        }

        return result;
    }


    /**
     * 执行Insert语句（可以返回自增长的ID值）
     *
     * @throws SQLException
     */
    public int executeDMLByInsert(String sql, Object... paramList) {

        // 4>执行DML语句
        int result=0;
        try {
            open();

            //设置自动提交事务（false）
            conn.setAutoCommit(false);

            // 3>创建Statement对象
            stmt = conn.prepareStatement(sql);

            if (paramList!=null) {
                // 3.1>填充参数(参数个数？，参数类型？)
                for (int i = 0; i < paramList.length; i++) {
                    stmt.setObject(i +1, paramList[i]);
                }
            }

            //执行DML语句
            result = stmt.executeUpdate();

            //查询刚刚插入语句的自增长ID值
            //select LAST_INSERT_ID() id
            String sql2="select LAST_INSERT_ID() id";
            stmt = conn.prepareStatement(sql2);
            rs = stmt.executeQuery();
            rs.next();
            result = rs.getInt(1);

            //提交事务（才会真正影响数据库的改动）
            conn.commit();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            close();
        }

        return result;
    }


    //释放资源
    private  void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
