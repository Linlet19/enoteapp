package com.enoteapp.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class NoteDAO {

	private final DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;
	
	public NoteDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	private void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public NoteDetails getNoteById(Long id){
		NoteDetails noteDetails = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from notetb where id='"+id+"';");
			while(rs.next()) {
				
				noteDetails =  new NoteDetails(
						rs.getLong("id"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getLong("userId"),
						rs.getDate("date").toLocalDate()
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return noteDetails;
	}
	
	public List<NoteDetails> getAllNotes(Long userId){
		List<NoteDetails> noteDetails = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from notetb where status='active' and userId='"+userId+"';");
			while(rs.next()) {
				noteDetails.add(new NoteDetails(
						rs.getLong("id"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getLong("userId"),
						rs.getDate("date").toLocalDate()
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return noteDetails;
	}
	
	public boolean createNote(NoteDetails noteDetail) {
		
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("insert into notetb "
					+ "(title,content,date,userId,status) values(?,?,?,?,?);");
			pStmt.setString(1, noteDetail.getTitle());
			pStmt.setString(2, noteDetail.getContent());
			pStmt.setDate(3, Date.valueOf(noteDetail.getDate()));
			pStmt.setLong(4, noteDetail.getUserId());
			pStmt.setString(5, "active");
			int rowEffected = pStmt.executeUpdate();
			success = rowEffected > 0 ? true : false;
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
		
	}
	
	public boolean updateNote(NoteDetails noteDetail) {
		
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update notetb set "
					+ "title=?,"
					+ "content=? where id=?;");
			pStmt.setString(1, noteDetail.getTitle());
			pStmt.setString(2, noteDetail.getContent());
			pStmt.setLong(3, noteDetail.getId());
			int rowEffected = pStmt.executeUpdate();
			success = rowEffected > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
		
	}
	
	public boolean deleteNote(Long id) {
		
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from notetb where id=?;");
			pStmt.setLong(1,id);		
			int rowEffected = pStmt.executeUpdate();
			success = rowEffected > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
}
	
	public boolean flashDeleteNote(Long id) {
		
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update notetb set status=? where id=?;");
			pStmt.setString(1,"deleted");	
			pStmt.setLong(2,id);
			
			int rowEffected = pStmt.executeUpdate();
			success = rowEffected > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
}
	
}