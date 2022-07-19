package idmb.common.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.OrderBean;

@Controller
public class OrderController {

    @Resource (name="orderService")
    private OrderService orderService;

    //내 주문목록 보기
    @RequestMapping("/myOrderList.do")
    public String myOrderList (OrderBean order, Model model) throws Exception {

        //내 주문 목록들의 List 생성
        List<Map<String, Object>> myOrderList = new ArrayList<Map<String, Object>>();

        myOrderList = orderService.myOrderList(order);

        model.addAttribute("myOrderList", myOrderList);

        return "myOrderList";
    }


    @RequestMapping("/insertOrder.do")
    public String insertOrder (OrderBean order, Model model) throws Exception {

        Map<String, Object> oMap = new HashMap<String, Object>();

        orderService.insertOrder(order);

        model.addAttribute("insertOrder", oMap);

        return "order/insertOrder";


    }

}
	
//	@RequestMapping("/pOrder.do")
//	public String Order (MemberBean member, BindingResult result,
//							@RequestParam("o_num") int o_num,
//							@RequestParam("o_code") int o_code,
//							@RequestParam("o_name") String o_name,
//							@RequestParam("o_id") String o_id,
//							@RequestParam("o_price") int o_price,
//							@RequestParam("o_total") int o_total,
//							@RequestParam("o_count") int o_count, 
//							Model model) throws Exception{
//		OrderBean orderBean = new OrderBean();
//		
//		orderBean.setO_id(member.getId());
//		orderBean.setO_code(o_code);
//		orderBean.setO_name(o_name);
//		orderBean.setO_count(o_count);
//		orderBean.setO_price(o_price);
//		orderBean.setO_total(o_total);
//		orderBean.setO_address1(member.getAddress1());
//		orderBean.setO_address2(member.getAddress2());
//		
//	
//	//orderform에 내용이 제대로 들어갔는지 유효성 검사
//	new OrderValidator().validate(orderBean, result); 
//	
//	if(result.hasErrors()) {
//		// basketOrderForm의 MemberBean을 파라미터로 받으면 오류발생 가능성 있음
//		return "/basketOrderForm.al";	
//		}
//	
//	orderService.insertOrder(orderBean);
//	
//	return "/order/pOrder";
//	}
