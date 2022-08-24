package order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import order.bean.OrderDTO;
import order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;
	@Autowired
	private MemberDAO mdao;
	
	@Override
	public List<OrderDTO> orderList(int startNum, int endNum) {
		return dao.orderList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return dao.getTotalA();
	}

	@Override
	public int orderWrite(OrderDTO dto) {
		return dao.order_write(dto);
	}

	@Override
	public OrderDTO orderView(int order_num) {
		return dao.orderView(order_num);
	}

	@Override
	public int orderDelete(int order_num) {
		return dao.orderDelete(order_num);
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return mdao.getMember(id);
	}

}
