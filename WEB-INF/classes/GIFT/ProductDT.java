package GIFT;

public class ProductDT{
	
	private String ProductID;
	private String CategoryCode;
	private String BrandCode;
	private String MDID;
	private String Name;
	private String Price;
	private String Avail_Date;
	private String Image;

	
	public void R_ProductDT(String ProductIDs,String CategoryCodes,String BrandCodes,String MDIDs,String Names,String Prices,String Avail_Dates,String Images ) {
	
		ProductID =ProductIDs;
		CategoryCode=CategoryCodes;
		BrandCode=BrandCodes;
		MDID=MDIDs;
		Name=Names;
		Price=Prices;
		Avail_Date=Avail_Dates;
		Image=Images;
	}
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	public String getCategoryCode() {
		return CategoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		CategoryCode = categoryCode;
	}
	public String getBrandCode() {
		return BrandCode;
	}
	public void setBrandCode(String brandCode) {
		BrandCode = brandCode;
	}
	public String getMDID() {
		return MDID;
	}
	public void setMDID(String mDID) {
		MDID = mDID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getAvail_Date() {
		return Avail_Date;
	}
	public void setAvail_Date(String avail_Date) {
		Avail_Date = avail_Date;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	

}