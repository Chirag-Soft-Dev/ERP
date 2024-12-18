package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.GetConnection;

public class RegisterModel {

	private String fname;
	private String email ;
	private String username;
	private String pass;
	
	public RegisterModel() {}
	
	public RegisterModel(String fname, String email, String username, String pass) {
		super();
		this.fname = fname;
		this.email = email;
		this.username = username;
		this.pass = pass;
	}



	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}	
	
	
	public boolean validateUserCredentials(String username, String password) {
        boolean isValid = false;

        String query = "SELECT * FROM users WHERE username = ? AND pass = ?";

        try (Connection con = GetConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            System.out.println("data validate successfully");
            if (rs.next()) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }
	
	
	public boolean registerUser(RegisterModel user) {
		boolean isRegistered = false;

		String query = "INSERT INTO users (fname, email,username, pass ) VALUES (?, ?, ?, ?)";

		try (Connection con = GetConnection.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(query)) {

			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getPass());

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				isRegistered = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isRegistered;
	}


}
