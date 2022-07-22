package idmb.common.order;

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

import idmb.common.member.MyInfoService;
import idmb.common.product.ProductService;
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
	public String orderForm (HttpServletRequest request, ProductBean product, Model model) throws Exception {
		
		//P_CODE를 불러와 상품 정보를 읽어 옴.
	   Map<String, Object> pMap = new HashMap<String, Object>();
	   pMap = productService.productDetail(product);
	    
	   
	   //로그인 한 id의 정보를 읽어오기 
	   //HttpSession session  = request.getSession();
	   //String id = (String) session.getAttribute("id");
	   String id =  request.getParameter("id");
	   MemberBean member = new MemberBean();
	   member.setId(id);
	   
	   Map<String,Object> map =  myInfoService.selectMember(member);
	   
	   //주문 수량 정보를 읽어옴 
	   String p_count = request.getParameter("p_count");
	    
	   model.addAttribute("productDetail", pMap);
	   model.addAttribute("p_count", p_count);
	   model.addAttribute("myInfo", map);
	   	
	    //tiles.xml로 넘김
	    return "orderForm";
	
	
	}
    
    @RequestMapping(value = "/orderDo.do", method = RequestMethod.POST)
    public String orderDo(OrderBean order, Model model) throws Exception {

    	orderService.insertOrder(order);
    	    	
    	model.addAttribute("msg", "주문이 등록되었습니다.");
		model.addAttribute("url", "/m");
		
        return "/order/orderDo.do";

    }

}