package idmb.admin.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class AdminProductController {
	
	@Resource(name="AdminProductService")
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

}
