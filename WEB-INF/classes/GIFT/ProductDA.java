package GIFT;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.*;



public class ProductDA
{


		private Connection conn; 

		private ResultSet rs;

		private PreparedStatement pstmt;
		

		public ProductDA() {

			

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
		
		
		
		
	/*	
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

				e.printStackTrace();

			}

			return -2; 

		}
		
		*/
public void disconnect() {
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		public int ChangeSell(String ProductID) {

			String SQL = "update product set sell = 0 WHERE productid = ?";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, ProductID);


				return pstmt.executeUpdate();



			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1;

		}	
		
		
			public ArrayList<ProductDT> GetProduct_List(String Categorycode,String Brandcode){ 

				String SQL = "select * from product where categorycode=? and brandcode =? and sell=1";

				ArrayList<ProductDT> list = new ArrayList<ProductDT>();

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setString(1, Categorycode);
					pstmt.setString(2, Brandcode);

					rs = pstmt.executeQuery();

					while (rs.next()) {

						ProductDT PDT = new ProductDT();

						PDT.setProductID(rs.getString(1));

						PDT.setCategoryCode(rs.getString(2));

						PDT.setBrandCode(rs.getString(3));

						PDT.setMDID(rs.getString(4));

						PDT.setName(rs.getString(5));

						PDT.setPrice(rs.getString(6));
						PDT.setAvail_Date(rs.getString(7));
						PDT.setImage(rs.getString(8));
						
						list.add(PDT);

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return list; 

			}
		
		
		
			public ArrayList<ProductDT> CategoryProduct_List(){ 

				String SQL = "select * from product where sell=1";

				ArrayList<ProductDT> list = new ArrayList<ProductDT>();

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					rs = pstmt.executeQuery();

					while (rs.next()) {

						ProductDT PDT = new ProductDT();

						PDT.setProductID(rs.getString(1));

						PDT.setCategoryCode(rs.getString(2));

						PDT.setBrandCode(rs.getString(3));

						PDT.setMDID(rs.getString(4));

						PDT.setName(rs.getString(5));

						PDT.setPrice(rs.getString(6));
						PDT.setAvail_Date(rs.getString(7));
						PDT.setImage(rs.getString(8));
						
						list.add(PDT);

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return list; 

			}
		
		
		public ProductDT GetProduct(String PID) {

				String SQL = "SELECT * FROM product WHERE productid = ?";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setString(1, PID);

					rs = pstmt.executeQuery();

					if (rs.next()) {

						ProductDT PDT = new ProductDT();

						PDT.setProductID(rs.getString(1));

						PDT.setCategoryCode(rs.getString(2));

						PDT.setBrandCode(rs.getString(3));

						PDT.setMDID(rs.getString(4));

						PDT.setName(rs.getString(5));

						PDT.setPrice(rs.getString(6));
						PDT.setAvail_Date(rs.getString(7));
						PDT.setImage(rs.getString(8));

					
						
						return PDT;

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return null;



			}

		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		public int Registration_Product(ProductDT PDT) {

			String SQL = "INSERT INTO product VALUES (?,?,?,?,?,?,?,?,?)";

			try {

				pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, PDT.getProductID());

				pstmt.setString(2, PDT.getCategoryCode());

				pstmt.setString(3, PDT.getBrandCode());

				pstmt.setString(4, PDT.getMDID());

				pstmt.setString(5, PDT.getName());
				pstmt.setString(6, PDT.getPrice());
				pstmt.setString(7, PDT.getAvail_Date());
				pstmt.setString(8, PDT.getImage());
				pstmt.setInt(9, 1);
				return pstmt.executeUpdate();

			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1; 
		}


}


