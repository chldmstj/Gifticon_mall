package GIFT;

public class MerchandiseDT {

	private String MerchandisePIN;

	private String MerchandiseAccount;

	private String ProductID;

	private int MDPrice;
	
	public MerchandiseDT(String mdpin,String mdaccount) {
		this.MerchandisePIN = mdpin;
		this.MerchandiseAccount = mdaccount;
	}

	public String getMerchandisePIN() {
		return MerchandisePIN;
	}

	public void setMerchandisePIN(String merchandisePIN) {
		this.MerchandisePIN = merchandisePIN;
	}

	public String getMerchandiseAccount() {
		return MerchandiseAccount;
	}

	public void setMerchandiseAccount(String merchandiseAccount) {
		this.MerchandiseAccount = merchandiseAccount;
	}

	public String getProductID() {
		return ProductID;
	}

	public void setProductID(String productID) {
		this.ProductID = productID;
	}

	public int getMDPrice() {
		return MDPrice;
	}

	public void setMDPrice(int mDPrice) {
		this.MDPrice = mDPrice;
	}

}
