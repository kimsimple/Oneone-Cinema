package com.shxt.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.jolbox.bonecp.BoneCPDataSource;


/**
 * 连接池版JDBC 引包5个
 * @author Administrator
 *
 */
public class JdbcUtils01 {

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement ps = null;
	private static final String URL = "jdbc:mysql://localhost:3306/";
	private ResultSet rs = null;
	private BoneCPDataSource bc=new BoneCPDataSource();
	/*static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�����ʧ�ܣ�");
		}
	}*/
	
	public JdbcUtils01(){
		this("cinema","root","root");
	}
	/**
	 * 连接驱动
	 * @param db
	 * @param username
	 * @param password
	 */
	public JdbcUtils01(String db,String username,String password){
/*		try {
			conn = DriverManager.getConnection(URL+db, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		//设置JDBC连接驱动
		bc.setDriverClass("com.mysql.jdbc.Driver");
		bc.setUsername(username);
		bc.setPassword(password);
		bc.setJdbcUrl(URL+db);
		//获取最大连接数
		bc.setMaxConnectionsPerPartition(10);
		//最小连接数
		bc.setMinConnectionsPerPartition(5);
		//没60秒检查所有连接池中空闲链接
		bc.setIdleConnectionTestPeriod(60);
		//最长连接时间 min
		bc.setIdleMaxAge(240);
		//当连接数耗尽时以此获取的连接数
		bc.setAcquireIncrement(5);
		//连接释放处理
		bc.setReleaseHelperThreads(3);
		//启用此连接的日志记录
		bc.setLogStatementsEnabled(true);
		//设置为真实，记录所有事物活动，在连接失败的情况下重放事物
		bc.setTransactionRecoveryEnabled(true);
		try {
			conn=bc.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 员工登录验证
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean login(String username,String password){
		ResultSet rs = query("select password from user where account = '"+username+"' and status>0",new Object[]{});
		try {
			if(rs.next()){
				return rs.getString("password").equals(password)?true:false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null&&!rs.isClosed())
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	

	/**
	 * 修改信息
	 * @param sql
	 * @param params
	 * @return
	 */
	public int update(String sql,Object[] params){
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			result = ps.executeUpdate();
		} catch (SQLException e) {
			result = -1;
			System.out.println("SQL语句错误！！！");
			//e.printStackTrace();
		} finally{
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	/**
	 * 查询一条
	 * @param sql
	 * @param params
	 * @return
	 */
	private ResultSet query(String sql,Object[] params){
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			return ps.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL语句错啦！！！");
		}
		return null;
	}
	/**
	 * 查询总数
	 * @param sql
	 * @return
	 */
	public int count(String sql){
		String count_sql = "select count(*) as records from("+sql+") temp";
		rs=query(count_sql,new Object[]{});
		if(rs!=null){	
			try {
				if(rs.next()){
					return rs.getInt("records");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 1; 
	}
	
	/**
	 * 根据ID查询一个对象
	 * @param sql
	 * @return
	 */
	public Map<String,Object> findById(String sql){
		List<Map<String,Object>> list = list(sql,new Object[]{});
		return list==null?null:list.get(0);
	}
	/**
	 * 多条查询
	 * @param sql 
	 * @param params 条件数组 可将条件写入sql语句 后面数组为空
	 * @return
	 */
	public List<Map<String,Object>> list(String sql,Object[] params){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		rs = query(sql,params);
		String columnName = null;
		try {
			//可以让我们获取结果中有多少个字段及字段名称
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<rsmd.getColumnCount();i++){
					columnName = rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null&&!rs.isClosed()){
					rs.close();
				}	
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	/**
	 * 多条修改
	 * @param sqls sql数组
	 * @return
	 */
	public int[] updateBatch(String[] sqls){
		int[] results = new int[sqls.length];
		try {
			//将JDBC的事务设置为手动控制
			conn.setAutoCommit(false);//改为手动提交
			stmt = conn.createStatement();
			for(int i=0;i<sqls.length;i++){
				stmt.addBatch(sqls[i]);
			}
			results = stmt.executeBatch();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				conn.commit();
				conn.setAutoCommit(true);
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return results;
	}
	
	/**
	 * ps:预处理语句对象
	 * @param sql
	 * @param params
	 * @return
	 */
	public int[] updateBatchForPs(String sql,List<Map<Integer,Object>> params){
		int[] results = null;
		try {
			ps = conn.prepareStatement(sql);
			for(Map<Integer,Object> param:params){
				for(Map.Entry<Integer, Object> p:param.entrySet()){
					ps.setObject(p.getKey(), p.getValue());
				}
				ps.addBatch();
			}
			results = ps.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return results;
	}
	
	public List<Map<String,Object>> listForPage(String sql,int page,int records){
		return listForPage(sql,page,records,new Object[]{});
	}
	
	/**
	 * 
	 * @param sql 查询语句
	 * @param page 页码
	 * @param records 每页显示记录数
	 * @param params 语句的参数
	 * @return
	 */
	public List<Map<String,Object>> listForPage(String sql,int page,int records,Object[] params){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String pageSql = "SELECT * FROM ("+sql+") ccshxt LIMIT "+(page-1)*records +","+records;
		String columnName = null;
		try {
			ps = conn.prepareStatement(pageSql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();
			//可以让我们获取结果中有多少个字段及字段名称
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<rsmd.getColumnCount();i++){
					columnName = rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null&&!rs.isClosed()){
					rs.close();
				}
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	/**
	 * 关闭
	 * @throws SQLException
	 */
	public void close() throws SQLException{
		if(stmt!=null&&!stmt.isClosed()){
			stmt.close();
		}
		if(ps!=null&&!ps.isClosed()){
			ps.close();
		}
	}
	
}
