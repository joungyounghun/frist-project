package product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import product.bean.ProductDTO;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping (value="/product/productWriteForm.do")
	public String ProductWriteForm () {
		return "../product/productWriteForm.jsp";
	}
	
	@RequestMapping (value="/product/productWrite.do")
	public ModelAndView ProductWrite(HttpServletRequest request, MultipartFile img) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberDTO memdto = productService.getMember(mem_id);
		int mem_num = memdto.getMem_num(); 
		
		String filePath = request.getSession().getServletContext().getRealPath("/product_image");
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		// jsp에서 MultipartRequest가 자동으로 저장시키지만, 여기서는 수동으로 저장시킴
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String prod_name = request.getParameter("prod_name");
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
	    int delive_price = Integer.parseInt(request.getParameter("delive_price"));
	    String delive_type = request.getParameter("delive_type");
	    String prod_content = request.getParameter("prod_content");
	    String prod_img = fileName;
	    int prod_quan = Integer.parseInt(request.getParameter("prod_quan"));
	    String add_product = request.getParameter("add_product");
	    String prod_cate1 = request.getParameter("prod_cate1");
	    String prod_cate2 = request.getParameter("prod_cate2");
	    String prod_cate3 = request.getParameter("prod_cate3");
		
		ProductDTO dto = new ProductDTO();
		dto.setProd_name(prod_name);
		dto.setProd_price(prod_price);
		dto.setDelive_price(delive_price);
		dto.setDelive_type(delive_type);
		dto.setProd_content(prod_content);
		dto.setProd_img(prod_img);
		dto.setProd_quan(prod_quan);
		dto.setAdd_product(add_product);
		dto.setMem_num(mem_num);
		dto.setProd_cate1(prod_cate1);
		dto.setProd_cate2(prod_cate2);
		dto.setProd_cate3(prod_cate3);
		
		int result = productService.product_write(dto);
				
		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../product/productWrite.jsp");	
		return modelAndView;
	}
	
	@RequestMapping(value="/product/productList.do")
	public ModelAndView boardList(HttpServletRequest request) {
		int mem_auth = 0;
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") != null) {
			String mem_id = (String) session.getAttribute("mem_id");
			MemberDTO memdto = productService.getMember(mem_id);
			mem_auth = memdto.getMem_auth();
		}
		// 데이터
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		// 1. 목록보기 : 5개
		int endNum = pg * 5;
		int startNum = endNum - 4;

		List<ProductDTO> list = productService.productList(startNum, endNum);

		// 2. 페이징 처리
		int totalA = productService.getTotalA(); // 총글수
		int totalP = (totalA + 4) / 5; // 총 페이지수

		// 블럭 설정 : 3블럭
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP)
			endPage = totalP;
		
		// 3. 화면 네비게이션 = 데이터 공유 + view 처리 파일명 선택
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("mem_auth", mem_auth);
		modelAndView.setViewName("../product/productList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/product/productView.do")
	public ModelAndView boardView(HttpServletRequest request) {
		int mem_auth = 0;
		int mem_num = -1;
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") != null) {
			String mem_id = (String) session.getAttribute("mem_id");
			MemberDTO memdto = productService.getMember(mem_id);
			mem_auth = memdto.getMem_auth();
			mem_num = memdto.getMem_num();
		}
		int seq = Integer.parseInt(request.getParameter("prod_num"));
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		ProductDTO dto = productService.productView(seq);	// 상세보기 
		
		// 화면 네비게이션 = 데이터 공유 + view 처리 파일명 리턴
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod_num", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("mem_num", mem_num);
		modelAndView.addObject("mem_auth", mem_auth);
		modelAndView.setViewName("../product/productView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/product/productDelete.do")
	public ModelAndView boardDelete(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int result = productService.productDelete(seq);
		
		// 화면 네비게이션
		// ModelAndView : 공유 데이터와 view 처리 파일명을 저장하는 클래스
		// => DispatcherServlet이 리턴받아서 사용함
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../product/productDelete.jsp");
		return modelAndView;
	}
}
