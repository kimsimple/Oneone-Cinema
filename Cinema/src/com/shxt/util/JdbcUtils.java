package com.shxt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class JdbcUtils {

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement ps = null;
	private static final String URL = "jdbc:mysql://localhost:3306/";
	private ResultSet rs = null;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("��������ʧ�ܣ�");
		}
	}
	
	public JdbcUtils(){
		this("cinema","root","root");
	}
	
	public JdbcUtils(String db,String username,String password){
		try {
			conn = DriverManager.getConnection(URL+db, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean login(String username,String password){
		ResultSet rs = query("select password from user where account = '"+username+"' and status>0 ",new Object[]{});
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
			System.out.println("��磬������sqlд���ˣ�");
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
	
	private ResultSet query(String sql,Object[] params){
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			System.out.println(ps);
			return ps.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("��磬������sqlд���ˣ�");
		}
		return null;
	}
	
	public int count(String sql){
		String count_sql = "select count(*) records from("+sql+") temp";
		rs=query(count_sql,new Object[]{});
		try {
			if(rs.next()){
				return rs.getInt("records");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1; 
	}
	
	/**
	 * ��id��ѯһ����¼
	 * @param sql
	 * @return
	 */
	public Map<String,Object> findById(String sql){
		List<Map<String,Object>> list = list(sql,new Object[]{});
		return list==null?null:list.get(0);
	}
	
	public List<Map<String,Object>> list(String sql,Object[] params){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		rs = query(sql,params);
		String columnName = null;
		try {
			//���������ǻ�ȡ������ж��ٸ��ֶμ��ֶ�����
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
	
	public int[] updateBatch(String[] sqls){
		int[] results = new int[sqls.length];
		try {
			//��JDBC����������Ϊ�ֶ�����
			conn.setAutoCommit(false);
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
	 * ps:Ԥ����������
	 * 
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
	 * @param sql ��ѯ���
	 * @param page ҳ��
	 * @param records ÿҳ��ʾ��¼��
	 * @param params ���Ĳ���
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
			//���������ǻ�ȡ������ж��ٸ��ֶμ��ֶ�����
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
	
	public void close() throws SQLException{
		if(stmt!=null&&!stmt.isClosed()){
			stmt.close();
		}
		if(ps!=null&&!ps.isClosed()){
			ps.close();
		}
	}
	
}
