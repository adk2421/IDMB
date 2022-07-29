package idmb.common.order;

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
import idmb.common.member.MyInfoService;
import idmb.common.product.ProductService;
import idmb.model.BasketBean;
import idmb.model.OrderBean;
import idmb.model.ProductBean;
import idmb.util.MapToBean;;

@Controller
public class OrderController {

    @Resource (name="orderService")
    private OrderService orderService;
    
    @Resource (name="productService")
    private ProductService productService;
    
    @Resource (name="myInfoService")
    private MyInfoService myInfoService;
    
    @Resource (name="basketService")
    private BasketService basketService;

    @RequestMapping("/myOrderList.do")
    public String myOrderList (OrderBean order, Model model, HttpServletRequest request) throws Exception {

        //내 주문 목록들의 List 생성
        List<Map<String, Object>> myOrderList = new ArrayList<Map<String, Object>>();
        
        // 세션 id 값 받아오기
        String id = (String) request.getSession().getAttribute("id");
        order.setO_id(id);

        myOrderList = orderService.myOrderList(order);

        model.addAttribute("myOrderList", myOrderList);

        return "myOrderList";
    }

    // 주문 폼 작성
	@RequestMapping("/orderForm.do")
	public String orderForm (ProductBean product,
			HttpServletRequest request,  Model model) throws Exception {
		
		String p_count = request.getParameter("p_count");

		Map<String, Object> pMap = new HashMap<String, Object>();
		
		pMap = productService.productDetail(product);
	    
	    
	   model.addAttribute("productDetail", pMap);
	   model.addAttribute("p_count", p_count);
	   	
	    //tiles.xml로 넘김
	    return "orderForm";
	
	}
    
    @RequestMapping(value = "/insertOrder.do")
    public String insertOrder(OrderBean order, HttpServletRequest request, Model model) throws Exception {
    	
    	orderService.insertOrder(order);
    	
    	model.addAttribute("msg", "주문이 등록되었습니다.");
		model.addAttribute("url", "/myOrderList.do");
		
        return "order/insertOrder";

    }
    
    //장바구니 주문 폼
    @RequestMapping(value = "/basketOrderForm.do")
    public String basketOrderForm(BasketBean basket, HttpServletRequest request, Model model) throws Exception {
    	
    	//장바구니 num를 통해 MAP를 가져온다.
    	Map<String,Object> bmap = new HashMap<String, Object>();
    	bmap = basketService.searchBasket(basket);	

    	model.addAttribute("basketBean",bmap);
    	
    	//tiles로 이동 
    	return "basketOrderForm";
    }
    
    @RequestMapping(value = "/basketOrder.do")
    public String basketOrder(BasketBean basket, OrderBean order, Model model) throws Exception {
    	
    	orderService.insertOrder(order);
    	basketService.deleteBasket(basket);
    	
    	model.addAttribute("msg", "주문이 등록되었습니다.");
		model.addAttribute("url", "/myOrderList.do");
    	
    	return "order/basketListOrder";
    }    
        
    //장바구니 전체 주문 폼
    @RequestMapping(value = "/basketListOrderForm.do")
    public String basketListOrderForm(BasketBean basket, HttpServletRequest request, Model model) throws Exception {
    	
    	//장바구니 id를 통해 list를 가져온다.
    	List<Map<String,Object>> blist = new ArrayList<Map<String,Object>>();
    	blist = basketService.basketList(basket);
  
    	model.addAttribute("basketList",blist);
    	model.addAttribute("Size", blist.size());
    	
    	//tiles로 이동 
    	return "basketListOrderForm";
    }
    
    
    @RequestMapping(value = "/basketListOrder.do")
    public String basketListOrder(OrderBean order, HttpServletRequest request, Model model) throws Exception {
    	System.out.println(order.getO_id());
		BasketBean basket = new BasketBean();
		String id = (String) request.getSession().getAttribute("id");
		basket.setB_id(id);
    	
    	List<Map<String,Object>> blist = new ArrayList<Map<String,Object>>();
    	blist = basketService.basketList(basket);
		
		List<BasketBean> basketBeanList = new ArrayList<BasketBean>();
		  
		for(Map<String, Object> mapObject : blist) {
			basketBeanList.add(MapToBean.mapToBasket(mapObject));
		}
    	
		for(BasketBean bas : basketBeanList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map = basketService.searchBasket(bas);
			
			order.setO_id((String)map.get("B_ID"));
			order.setO_code(Integer.parseInt(String.valueOf(map.get("B_CODE"))));
			order.setO_name((String)map.get("B_NAME"));
			order.setO_price(Integer.parseInt(String.valueOf(map.get("B_PRICE"))));
			order.setO_count(Integer.parseInt(String.valueOf(map.get("B_COUNT"))));
			order.setO_total((Integer.parseInt(String.valueOf(map.get("B_PRICE"))))
					*(Integer.parseInt(String.valueOf(map.get("B_COUNT")))));
			
	    	orderService.insertOrder(order);
	    	basketService.deleteBasket(bas);
		}    
 	
    	model.addAttribute("msg", "주문이 등록되었습니다.");
		model.addAttribute("url", "/myOrderList.do");
    	
    	return "order/basketListOrder";
    }

}