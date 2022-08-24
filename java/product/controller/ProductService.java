package product.controller;

import java.util.List;

import member.bean.MemberDTO;
import product.bean.ProductDTO;

public interface ProductService {
	public MemberDTO getMember(String id);
	public List<ProductDTO> productList(int strartNum, int endNum);
	public int getTotalA();
	public int product_write(ProductDTO dto);
	public ProductDTO productView(int prod_num);
	public int productDelete(int prod_num);
}
	
