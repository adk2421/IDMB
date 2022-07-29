package idmb.common.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.common.basket.BasketService;
import idmb.common.order.OrderService;
import idmb.model.BasketBean;
import idmb.model.ProductBean;

@Controller
public class ProductController {
	
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource (name="orderService")
	private OrderService orderService;
	
	@Resource(name="basketService")
	private BasketService basketService;
	 
	
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



			// 신상품순 상품 리스트
			@RequestMapping(value="/newProductList.do") // URL mapping
			public String newProductList(HttpServletRequest request, Model model) throws Exception{		
				
			//Product들의 리스트가 필요하므로 ArrayList형의 'list' 생성
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
			// 검색어 입력받기	
				String searchValue = null;
				int priceValue1 = -1;
				int priceValue2 = -1;
				
			
			// 변수값 설정
				searchValue = request.getParameter("searchValue");
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
				
				
				list = productService.newProductList(searchValue, priceValue1, priceValue2);
	
				model.addAttribute("searchValue",searchValue);
				model.addAttribute("priceValue1",priceValue1);
				model.addAttribute("priceValue2",priceValue2);
				model.addAttribute("newList", list);
				
				//tiles.xml에서 defination name="newProductList.jsp" 로 보냄
				return "newProductList";
			}
			

			
			// 인기순 상품 리스트
			@RequestMapping(value="/bestProductList.do")
			public String bestProductList(HttpServletRequest request, Model model)throws Exception{
				
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
				String searchValue = null;
				int priceValue1 = -1;
				int priceValue2 = -1;
				
				searchValue = request.getParameter("searchValue");
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
				
				list = productService.bestProductList(searchValue, priceValue1, priceValue2);
				
				model.addAttribute("bestList", list);
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("priceValue1", priceValue1);
				model.addAttribute("priceValue2", priceValue2);
				
				return "bestProductList";
				
				
			}

	
			//상품별 리스트
			@RequestMapping(value="/kindProductList.do")
			public String kindProductList(ProductBean product, HttpServletRequest request, Model model)throws Exception{
				
				String p_kind = request.getParameter("p_kind");
				
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
				String searchValue = null;
				int priceValue1 = -1;
				int priceValue2 = -1;
				
				searchValue = request.getParameter("searchValue");
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
				
				list = productService.kindProductList(product, searchValue, priceValue1, priceValue2, searchValue);
				
				model.addAttribute("p_kind", p_kind);
				model.addAttribute("kindList", list);
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("priceValue1", priceValue1);
				model.addAttribute("priceValue2", priceValue2);
				
				return "kindProductList";
				
				
			}

			// 상품 디테일
			@RequestMapping(value="/productDetail.do")
			public String ProductDetail(ProductBean product, HttpServletRequest request, Model model)throws Exception{
				
				String p_count = request.getParameter("p_count");
				//int p_count = Integer.parseInt(String.valueOf(request.getParameter("p_count")));
				
				Map<String, Object> map = new HashMap<String, Object>();
				map = productService.productDetail(product);
				
				model.addAttribute("ProductDetail", map);
				model.addAttribute("p_count", p_count);
				
				return "productDetail";
			}
			
			
			@RequestMapping(value="/insertBasket.do")
			public String inputBasket(BasketBean basket, Model model ) throws Exception{
				
				basketService.insertBasket(basket);
				
				model.addAttribute("msg", "장바구니에 상품이 담겼습니다.");
				model.addAttribute("url", "/basketList.do");
				
				return "/product/insertBasket";
			}
			
			
}
			
		


	 	

