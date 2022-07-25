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
import idmb.model.MemberBean;
import idmb.model.OrderBean;
import idmb.model.ProductBean;

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

    //내 주문목록 보기
    @RequestMapping("/myOrderList.do")
    public String myOrderList (OrderBean order, Model model) throws Exception {

        //내 주문 목록들의 List 생성
        List<Map<String, Object>> myOrderList = new ArrayList<Map<String, Object>>();

        myOrderList = orderService.myOrderList(order);

        model.addAttribute("myOrderList", myOrderList);

        return "myOrderList";
    }

    // 주문 폼 작성
	@RequestMapping("/orderForm.do")
	public String orderForm (
			MemberBean member, ProductBean product,
			HttpServletRequest request,  Model model) throws Exception {
		
		String p_count = request.getParameter("p_count");
		
		Map<String,Object> map =  myInfoService.selectMember(member);
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		map =  myInfoService.selectMember(member);
		pMap = productService.productDetail(product);
	    
	    
	   model.addAttribute("productDetail", pMap);
	   model.addAttribute("p_count", p_count);
	   model.addAttribute("myInfo", map);
	   	
	    //tiles.xml로 넘김
	    return "orderForm";
	
	}
    
    @RequestMapping(value = "/insertOrder.do")
    public String insertOrder(OrderBean order, Model model) throws Exception {

    	String id = order.getO_id();
    	
    	orderService.insertOrder(order);
    	    	
    	model.addAttribute("msg", "주문이 등록되었습니다.");
		model.addAttribute("url", "/myOrderList.do?o_id="+id+"");
		
        return "order/insertOrder";

    }
    
    //장바구니 목록 주문 폼
    @RequestMapping(value = "/basketOrderForm.do")
    public String basketOrderForm(BasketBean basket, MemberBean member, Model model) throws Exception {
    	//장바구니 id를 통해 list를 가져온다.
    	List<Map<String,Object>> bmap = new ArrayList<Map<String,Object>>();
    	bmap = basketService.basketList(basket);
    
    	Map<String,Object> mmap =  myInfoService.selectMember(member);
    	mmap =  myInfoService.selectMember(member);
    	
    	model.addAttribute("basketList",bmap);
    	model.addAttribute("myInfo", mmap);
    	
    	return "basketOrderForm";
    }

}