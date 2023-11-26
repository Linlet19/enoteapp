package com.enoteapp.model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.enoteapp.crypto.PasswordEncoder;
import com.enoteapp.model.UserDetails;
import com.enoteapp.crypto.PasswordValidator;

public class UserDAO {

	private final DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;

	public UserDAO(DataSource dataSource) {
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

	private boolean checkUserExists(String nickname,String email) {
		if(getUserByEmail(email) != null || getUserByNickname(nickname) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean isEmail(String username) {
		if(username.contains("@") && username.contains(".")) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean validateUser(String username, String password) {
		UserDetails user = null;
		
		if(isEmail(username)) {
			user = getUserByEmail(username);
		}else {
			user = getUserByNickname(username);
		}

		if (user != null) {
			try {
				if (!PasswordValidator.validatePassword(password, user.getPassword()) || user.getLocked()) {
					return false;
				}
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return true;
			
		} else {
			return false;
		}
	}
	
	public UserDetails getUserByNickname(String nickname) {
		UserDetails user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where nickname='" + nickname + "';");
			while (rs.next()) {
				user = new UserDetails(rs.getLong("id"), rs.getString("name"), rs.getString("nickname"),
						rs.getString("email"), rs.getString("password"), rs.getBoolean("locked"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	public UserDetails getUserByEmail(String email) {
		UserDetails user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where email='" + email + "';");
			while (rs.next()) {
				user = new UserDetails(rs.getLong("id"), rs.getString("name"), rs.getString("nickname"),
						rs.getString("email"), rs.getString("password"), rs.getBoolean("locked"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	public UserDetails getUserById(Long id) {
		UserDetails user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where id='" + id + "';");
			while (rs.next()) {
				user = new UserDetails(
						rs.getLong("id"),
						rs.getString("name"),
						rs.getString("nickname"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getBoolean("locked"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	public List<UserDetails> getAllUsers() {
		List<UserDetails> users = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user;");
			while (rs.next()) {
				users.add(new UserDetails(
						rs.getLong("id"),
						rs.getString("name"),
						rs.getString("nickname"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getBoolean("locked")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return users;
	}
	
	public boolean createUser(UserDetails user) {
		
		boolean success = false;
		if(checkUserExists(user.getNickname(), user.getEmail())) {
			return success;
		}
		try {
			connection = dataSource.getConnection();
			pStmt=connection.prepareStatement("insert into user "+"(name,nickname,email,password,locked) "+"values(?,?,?,?,?);");
			pStmt.setString(1,user.getName());
			pStmt.setString(2,user.getNickname());
			pStmt.setString(3,user.getEmail());

			try {
				pStmt.setString(4, PasswordEncoder.encode(user.getPassword()));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pStmt.setBoolean(5, false);
			int rowEffected = pStmt.executeUpdate();
			
			success = rowEffected > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return success;

	}
	
	public int updateUser(UserDetails user) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update user set "
					+ "name=?,"
					+ "nickname"
					+ "email=?,"
					+ "password=? where id=?;"); 
			pStmt.setString(1,user.getName());
			pStmt.setString(2,user.getEmail());
			pStmt.setString(3,user.getPassword());
			pStmt.setLong(4, user.getId());
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;

	}
	
	public int deleteUser(Long id) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from user where id=?;");
			pStmt.setLong(1, id);
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;
	}
	
	public int lockUser(Long id) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update user set locked=? where id=?;");
			pStmt.setBoolean(1, true);
			pStmt.setLong(2, id);
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;
}
}
