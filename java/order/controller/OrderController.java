package order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import order.bean.OrderDTO;

@Controller
public class OrderController {

		@Autowired
		OrderService orderService;
		
		@RequestMapping(value="/order/orderWriteForm.do")
		public String orderWriteForm() {
			return "../order/orderWriteForm.jsp";
		}
		
		
		@RequestMapping(value="/order/orderWrite.do")
		public ModelAndView orderWrite(HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			int order_num = Integer.parseInt(request.getParameter("order_num"));
			String order_date = request.getParameter("order_date");
			String order_zipcode = request.getParameter("order_zipcode");
			String order_address1 = request.getParameter("order_address1");    
			String order_address2 = request.getParameter("order_address2");
			String receiver_name = request.getParameter("receiver_name");       
			String receiver_phone1 = request.getParameter("receiver_phone1");     
			String receiver_phone2 = request.getParameter("receiver_phone2");
			String receiver_phone3 = request.getParameter("receiver_phone3");
			String receiver_email1 = request.getParameter("receiver_email1");     
			String receiver_email2 = request.getParameter("receiver_email2");
			int mem_num = Integer.parseInt(request.getParameter("mem_num"));                  
			int prod_num = Integer.parseInt(request.getParameter("prod_num"));                
			String prod_option = request.getParameter("prod_option");
			int pay_quan = Integer.parseInt(request.getParameter("pay_quan"));               
			int pay_price = Integer.parseInt(request.getParameter("pay_price"));                
			int coupon_num = Integer.parseInt(request.getParameter("coupon_num"));              
			String buis_name = request.getParameter("buis_name");        
			int delive_price = Integer.parseInt(request.getParameter("delive_price"));
			String delive_type = request.getParameter("delive_type");

			
			OrderDTO dto = new OrderDTO();
			dto.setOrder_num(order_num);
			dto.setOrder_date(order_date);
			dto.setOrder_zipcode(order_zipcode);
			dto.setOrder_address1(order_address1);
			dto.setOrder_address2(order_address2);
			dto.setReceiver_name(receiver_name);
			dto.setReceiver_phone1(receiver_phone1);
			dto.setReceiver_phone2(receiver_phone2);
			dto.setReceiver_phone3(receiver_phone3);
			dto.setReceiver_email1(receiver_email1);
			dto.setReceiver_email2(receiver_email2);
			dto.setMem_num(mem_num);
			dto.setProd_num(prod_num);
			dto.setProd_option(prod_option);
			dto.setPay_quan(pay_quan);
			dto.setPay_price(pay_price);
			dto.setCoupon_num(coupon_num);
			dto.setBuis_name(buis_name);
			dto.setDelive_price(delive_price);
			dto.setDelive_type(delive_type);
			
			int result = orderService.orderWrite(dto);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("result", result);
			modelAndView.setViewName("orderWrite.jsp");
			
			return modelAndView;
				
		}
		
		@RequestMapping(value="/order/orderList.do")
		public ModelAndView orderList(HttpServletRequest request) {
			int mem_auth = 0;
			HttpSession session = request.getSession();
			if(session.getAttribute("mem_id") != null) {
				String mem_id = (String) session.getAttribute("mem_id");
				MemberDTO memdto = orderService.getMember(mem_id);
				mem_auth = memdto.getMem_auth();
			}
			// ?????????
			int pg = 1;
			if (request.getParameter("pg") != null) {
				pg = Integer.parseInt(request.getParameter("pg"));
			}
			// 1. ???????????? : 5???
			int endNum = pg * 5;
			int startNum = endNum - 4;

			//BoardDAO dao = new BoardDAO();
			List<OrderDTO> list = orderService.orderList(startNum, endNum);

			// 2. ????????? ??????
			int totalA = orderService.getTotalA(); // ?????????
			int totalP = (totalA + 4) / 5; // ??? ????????????

			// ?????? ?????? : 3??????
			int startPage = (pg - 1) / 3 * 3 + 1;
			int endPage = startPage + 2;
			if (endPage > totalP)
				endPage = totalP;
			
			// 3. ?????? ??????????????? = ????????? ?????? + view ?????? ????????? ??????
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("pg", pg);
			modelAndView.addObject("list", list);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.setViewName("orderList.jsp");
			
			return modelAndView;
		}
		
		@RequestMapping(value="/order/orderView.do")
		public ModelAndView orderView(HttpServletRequest request) {
			int mem_auth = 0;
			HttpSession session = request.getSession();
			if(session.getAttribute("mem_id") != null) {
				String mem_id = (String) session.getAttribute("mem_id");
				MemberDTO memdto = orderService.getMember(mem_id);
				mem_auth = memdto.getMem_auth();
			}
			
			int order_num = Integer.parseInt(request.getParameter("order_num"));
			int pg = Integer.parseInt(request.getParameter("pg"));
			
			OrderDTO dto = orderService.orderView(order_num);
			
			// ?????? ??????????????? = ????????? ?????? + view ?????? ????????? ??????
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("order_num", order_num);
			modelAndView.addObject("pg", pg);
			modelAndView.addObject("dto", dto);
			modelAndView.setViewName("orderView.jsp");
			
			return modelAndView;
		}
		
		@RequestMapping(value="/order/orderDelete.do")
		public ModelAndView orderDelete(HttpServletRequest request) {
			int order_num = Integer.parseInt(request.getParameter("order_num"));
			int pg = Integer.parseInt(request.getParameter("pg"));
			
			int result = orderService.orderDelete(order_num);
			
			// ?????? ???????????????
			// ModelAndView : ?????? ???????????? view ?????? ???????????? ???????????? ?????????
			// => DispatcherServlet??? ??????????????? ?????????
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("pg", pg);
			modelAndView.addObject("result", result);
			modelAndView.setViewName("orderDelete.jsp");
			return modelAndView;
		}
		
		
}
