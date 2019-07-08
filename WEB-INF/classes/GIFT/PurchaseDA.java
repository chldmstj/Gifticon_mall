package GIFT;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.*;



public class PurchaseDA
{


		private Connection conn; 

		private ResultSet rs;

		private PreparedStatement pstmt;
		

		public PurchaseDA() {

			

			try {

				String dbURL = "jdbc:mysql://right.jbnu.ac.kr:3306/A201514800";

				String dbID = "A201514800";

				String dbPassword = "chldmstj016!";

				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

			} catch (Exception e) {

				e.printStackTrace();

			}

		}
public void disconnect() {
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		public int R_Purchase(String PurchaseID,String ProductID, String PayDate) {

			String SQL = "insert into purchase (purchaseid,productid,paydate) values(?,?,?)";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, PurchaseID);

				pstmt.setString(2, ProductID);

				pstmt.setString(3, PayDate);
			
				return pstmt.executeUpdate();



			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1;

		}
		
		
		
		
		
}
		