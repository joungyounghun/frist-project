package cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO dao;
	@Autowired
	private MemberDAO mdao;
	
	@Override
	public int addCart(CartDTO dto) {
		return dao.cart_write(dto);
	}

	@Override
	public List<CartDTO> getCartList(int startNum, int endNum) {
		return dao.cartList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return dao.getTotalA();
	}

	@Override
	public CartDTO cartView(int cart_num) {
		
		return dao.cartView(cart_num);
	}

	@Override
	public int cartDelete(int cart_num) {

		return dao.cartDelete(cart_num);
	}

	@Override
	public int cartModify(int cart_num) {
		// TODO Auto-generated method stub
		return dao.cartModify(cart_num);
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return mdao.getMember(id);
	}
	
	
	


}
