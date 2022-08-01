package idmb.common.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import idmb.model.ProductBean;

@Controller
public class ProductController {
	
	
	@Resource(name="productService")
	private ProductService productService;
	
	//메인 페이지 상품 리스트
	@RequestMapping(value="/mainpageProductList.do")
	public String mainpageProductList(Model model) throws Exception{
		
		List<Map<String, Object>> productBeanList = new ArrayList<Map<String, Object>>();
		productBeanList = productService.mainpageProductList();
			
		model.addAttribute("productBeanList", productBeanList);
			
			
		//tiles.xml에서 defination name="mainpageProductList" 로 보냄
		return "mainpageProductList";
		
	}


			//상품 검색
			@RequestMapping(value="/searchProduct.do") // URL mapping
			public String searchProduct(HttpServletRequest request, Model model) throws Exception{		
				
			//Product들의 리스트가 필요하므로 ArrayList형의 'list' 생성
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			
			// 검색어 입력받기	
				String searchValue = null;
				String SORT = null;
				
				int priceValue1 = -1;
				int priceValue2 = -1;
				
			
			// 변수값 설정
				searchValue = request.getParameter("searchValue");
				SORT = request.getParameter("SORT");
				
				if(request.getParameter("priceValue1") == null || request.getParameter("priceValue1").trim()=="") {
					priceValue1 = 0;
				} else {
					priceValue1 = Integer.parseInt(request.getParameter("priceValue1"));
				}
				
				if(request.getParameter("priceValue2") == null || request.getParameter("priceValue2").trim()=="") {
					priceValue2 = 99999999;
				} else {
					priceValue2 = Integer.parseInt(request.getParameter("priceValue2"));
				}
				
				list = productService.searchProduct(searchValue, priceValue1, priceValue2, SORT);
	
				model.addAttribute("searchValue",searchValue);
				model.addAttribute("priceValue1",priceValue1);
				model.addAttribute("priceValue2",priceValue2);
				model.addAttribute("SORT", SORT);
				model.addAttribute("searchList", list);
					
				//tiles.xml에서 defination name="searchProduct.jsp" 로 보냄
				return "searchProduct";
			}



//			// 신상품순 상품 리스트
//			@RequestMapping(value="/newProductList.do") // URL mapping
//			public String newProductList(HttpServletRequest request, Model model) throws Exception{		
//				
//			//Product들의 리스트가 필요하므로 ArrayList형의 'list' 생성
//				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//				
//			// 검색어 입력받기	
//				String searchValue = null;
//				int priceValue1 = 0;
//				int priceValue2 = 99999999;
//				
//			
//			// 변수값 설정
//				searchValue = request.getParameter("searchValue");
//				priceValue1 = Integer.parseInt(request.getParameter("priceValue1"));
//				priceValue2 = Integer.parseInt(request.getParameter("priceValue2"));
//				
//				list = productService.newProductList(searchValue, priceValue1, priceValue2);
//	
//				model.addAttribute("searchValue",searchValue);
//				model.addAttribute("priceValue1",priceValue1);
//				model.addAttribute("priceValue2",priceValue2);
//				model.addAttribute("newList", list);
//				
//				//tiles.xml에서 defination name="newProductList.jsp" 로 보냄
//				return "newProductList";
//			}
			

			
//			// 인기순 상품 리스트
//			@RequestMapping(value="/bestProductList.do")
//			public String bestProductList(HttpServletRequest request, Model model)throws Exception{
//				
//				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//				
//				String searchValue = null;
//				int priceValue1 = 0;
//				int priceValue2 = 99999999;
//				
//				searchValue = request.getParameter("searchValue");
//				priceValue1 = Integer.parseInt(request.getParameter("priceValue1"));
//				priceValue2 = Integer.parseInt(request.getParameter("priceValue2"));
//				
//				list = productService.bestProductList(searchValue, priceValue1, priceValue2);
//				
//				model.addAttribute("bestList", list);
//				model.addAttribute("searchValue", searchValue);
//				model.addAttribute("priceValue1", priceValue1);
//				model.addAttribute("priceValue2", priceValue2);
//				
//				return "bestProductList";
//				
//				
//			}
//}
	
			//상품별 리스트
	
	

			// 상품 디테일
			@RequestMapping(value="/productDetail.do")
			public String ProductDetail(ProductBean product, HttpServletRequest request, Model model)throws Exception{
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map = productService.productDetail(product);
				
				model.addAttribute("product", map);
				
				return "productDetail";
			}
			
			/*
			// 상품 디테일 Ajax
			@ResponseBody
			@RequestMapping(method = RequestMethod.POST, value = "/productDetailAjax.do")
			public String productDetailAjax(@RequestParam Map<String, Object> p_code, Model model, HttpSession session) throws Exception {
				
				ProductBean product = new ProductBean();
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				System.out.println("P_CODE : " + p_code);
				
				product.setP_code(Integer.parseInt((String) p_code.get("P_CODE")));
				
				map = productService.productDetail(product);
				
				model.addAttribute("product", map);
				
				System.out.println("model : " + model);
						
				return "redirect:productDetail";
			}
			*/
}
			
		


	 	
