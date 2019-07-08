package GIFT;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.*;



public class MerchandiseDA
{


		private Connection conn; 

		private ResultSet rs;

		private PreparedStatement pstmt;
		

		public MerchandiseDA() {

			

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
		
		
		
		
		
		public int login(String MerchandiseAccount, String MerchandisePIN) {

			String SQL = "SELECT mdid FROM merchandise WHERE account = ?";

			try {

		

				pstmt = conn.prepareStatement(SQL);

		

				pstmt.setString(1, MerchandiseAccount);

		

				rs = pstmt.executeQuery();

		

				if (rs.next()) {

		

					if (rs.getString(1).equals(MerchandisePIN)) {
							
						return 1; 

					} else

						return 0; 

				}

				return -1; 



			} catch (Exception e) {
				conn.close();
				e.printStackTrace();

			}
			
			return -2; 

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
		
		public int Registration_MD(String MDPIN, String MDAccount,String ProductID, String Price) {

			String SQL = "insert into merchandise (mdid,productid,mdprice,account) values(?,?,?,?)";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, MDPIN);

				pstmt.setString(2, ProductID);

				pstmt.setString(3, Price);
				pstmt.setString(4, MDAccount);
				return pstmt.executeUpdate();



			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1;

		}
		
		
		
		public ArrayList<MerchandiseDT> GetMDPrice(String MDPIN){ 

			String SQL = "select account,mdprice from merchandise where mdid=? and productid = (select productid from product where sell=0);";

			ArrayList<MerchandiseDT> list = new ArrayList<MerchandiseDT>();

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, MDPIN);
				rs = pstmt.executeQuery();

				while (rs.next()) {

					MerchandiseDT MDT = new MerchandiseDT();

					MDT.setMerchandiseAccount(rs.getString(1));

					MDT.setMDPrice(rs.getInt(2));

					
					list.add(MDT);

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return list; 

		}
	
	
}


