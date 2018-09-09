package com.shxt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * ��ݿ�JAVA ����������װ�����
 * by KIM
 */
public class Util02 {
		//�輸������   ��ȫ��  ���ɸ�
	private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/cinema";
	private static final String USER="root";
	private static final String PASSWORD="root";
		//ȫ�ֱ���
	private static Connection conn;
	private static Statement stat;
	private static ResultSet rs;

		//1���������  ��ȡ
	static{//��̬�����     ����ִ��
			try {
				Class.forName(DRIVER);
				//System.out.println("========������ɹ�========");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("========������ʧ��========");
				e.printStackTrace();
			}
		}

		//��ȡ���� ���� ��ȡ
		public static Connection getConnection(){
			
			try {
				//2����·��
				//3��ȡ����
				conn=DriverManager.getConnection(URL, USER,PASSWORD);
				return conn;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		}
		
		//��ɾ��   ���� ������ȡ
		public static int executeUpdate(String sql){
			Statement stat=null;
			try {
				stat=getConnection().createStatement();
				return stat.executeUpdate(sql);//num ������Ӱ����У�ֻҪnum>0 ��ִ�гɹ�������ִ��ʧ��

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return  0;
			}finally{
				close(conn,stat,null);
			}
				
		}
		
		//�رղ���   һ������������30�����ɳ�
		public static void close(Connection conn,Statement stat,ResultSet rs){
			
			
				try {
					if(rs!=null){
						rs.close();
					}
					if(stat!=null){
						stat.close();
					}
					
					if(conn!=null){
						conn.close();
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		
		//��ȡ��ѯ����   ���ѵ㣺����װ��
		public static List list(String sql){
			Statement stat=null;
			try {
				stat=getConnection().createStatement();
				ResultSet rs=stat.executeQuery(sql);
				//���Ľṹ�����
				ResultSetMetaData rsmd=rs.getMetaData();
				//��ȡ��ѯ���ֶ�����
				int columnCount=rsmd.getColumnCount();
				//�����ֶ�����
				String[] columnNames=new String[columnCount];
				
				for(int i=0;i<columnCount;i++){
					columnNames[i]=rsmd.getColumnName(i+1);
				}//�ֶ�����洢���
				
				//����List
				List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
				while(rs.next()){
					Map<String,Object> map=new HashMap<String,Object>();
					for(int i=0;i<columnCount;i++){
						String value=rs.getString(columnNames[i]);
						map.put(columnNames[i], value);//һ����ݻ�óɹ�
					}
					list.add(map);
				}
				return list;
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
				}finally{
					close(conn,stat,rs);
				}
		}
		
		public static String[] columnNames(String sql){
			Statement stat=null;
			try {
				stat=getConnection().createStatement();
				ResultSet rs=stat.executeQuery(sql);
				//���Ľṹ�����
				ResultSetMetaData rsmd=rs.getMetaData();
				//��ȡ��ѯ���ֶ�����
				int columnCount=rsmd.getColumnCount();
				//�����ֶ�����
				String[] columnNames=new String[columnCount];
				
				for(int i=0;i<columnCount;i++){
					columnNames[i]=rsmd.getColumnName(i+1);
				}//�ֶ�����洢���

				return columnNames;
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
				}finally{
					close(conn,stat,rs);
				}
		}

		public static boolean login(String username,String password){
			String sqlLogin="select * from user007 where username='"+username+"' and password='"+password+"'";
			List<Map<String,Object>> listLogin=list(sqlLogin);
			if(listLogin==null||listLogin.size()<=0){
				return false;
			}
			return true;
		}
}



