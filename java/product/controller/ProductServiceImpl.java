package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

@Service
public class ProductServiceImpl  implements ProductService{
	@Autowired
	private ProductDAO pdao;
	@Autowired
	private MemberDAO mdao;

	@Override
	public List<ProductDTO> productList(int strartNum, int endNum) {
		return pdao.productList(strartNum, endNum);		
	}

	@Override
	public int getTotalA() {	
		return pdao.getTotalA();
	}

	@Override
	public int product_write(ProductDTO dto) {
		return pdao.product_write(dto);
	}

	@Override
	public ProductDTO productView(int prod_num) {
		return pdao.productView(prod_num);
	}

	@Override
	public int productDelete(int prod_num) {
		return pdao.productDelete(prod_num);
	}

	@Override
	public MemberDTO getMember(String id) {
		return mdao.getMember(id);
	}
}
