package idmb.admin.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.ProductBean;

@Controller
public class AdminProductController {
	
	@Resource(name="adminProductService")
	private AdminProductService adminProductService;
	
	//RequestMapping 모음
	@RequestMapping(value="/adminProductList.do")
	public String adminProductList(
			HttpServletRequest request, Model model) throws Exception {
		
		//검색어
		String searchValue = null;
		searchValue = request.getParameter("searchValue");
		
		//Product들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//검색어가 없는 경우는 ProductList()
		if(searchValue == null || searchValue.trim() =="") {
			list = adminProductService.adminProductList();
		}
		//검색어가 있는 경우는 SearchProduct()
		else {
			list = adminProductService.adminSearchProduct(searchValue);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminProductList", list);
		
		//tiles.xml의 definition name="adminProductList"로 이동
		return "adminProductList";
	}
	
	@RequestMapping(value="/adminInsertProductForm.do")
	public String adminInsertProductForm(Model model) throws Exception {
		//tiles.xml의 definition name="adminInsertProductForm"로 이동
		return "adminInsertProductForm";	
	}
	
	@RequestMapping(value="/adminInsertProduct.do")
	public String adminInsertProduct(
			ProductBean product, HttpServletRequest request, Model model) throws Exception {
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String p_detail = request.getParameter("p_detail");
		p_detail = p_detail.replace("\r\n","<br>");
		
		product.setP_detail(p_detail);
			
		//새로운 product 삽입
		adminProductService.adminInsertProduct(product);
		
		model.addAttribute("msg", "상품이 등록되었습니다.");
		model.addAttribute("url", "/adminProductList.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/product/adminInsertProduct";
		
	}
	
	@RequestMapping(value="/adminUpdateProductForm.do")
	public String adminUpdateProductForm(ProductBean product, Model model) throws Exception {
		
		//P_CODE 값을 파라미터로 넘겨받음
		Map<String, Object> map = new HashMap<String, Object>();
		
		//P_CODE 값을 이용하여 상품 정보를 읽어와 전달
		map = adminProductService.adminSearchProductCode(product);
		
		
	//	String pd = (String) product.getP_detail();		
	//	pd = pd.replace("<br>","\r\n");
	//	map.put("p_detail", pd);
	//	해결방법 못찾음
		
		
		model.addAttribute("adminProductBean", map);
		
		//tiles.xml의 definition name="adminUpdateProductForm"로 이동
		return "adminUpdateProductForm";	
	}
	
	@RequestMapping(value="/adminUpdateProduct.do")
	public String adminUpdateProduct(
			ProductBean product, HttpServletRequest request, Model model) throws Exception {
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String p_detail = request.getParameter("p_detail");
		p_detail = p_detail.replace("\r\n","<br>");
		
		product.setP_detail(p_detail);
		
		//Delflag 체크박스가 빈상태면 null로 입력되어 넘어오기 때문에
		//다시 그대로 "N"을 입력해 주어야 함.
		if(product.getP_delflag() == null) {
			product.setP_delflag("N");
		}
		//체크된 경우 "Y" 값 입력
		else if(product.getP_delflag() == "Y") {
			product.setP_delflag("Y");
		}
		
		//상품 수정
		adminProductService.adminUpdateProduct(product);
		
		model.addAttribute("msg", "상품이 수정되었습니다.");
		model.addAttribute("url", "/adminProductList.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/product/adminUpdateProduct";
		
	}	

}
