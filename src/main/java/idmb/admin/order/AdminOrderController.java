package idmb.admin.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.OrderBean;

@Controller
public class AdminOrderController {
	
	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrderList.do")
	public String adminOrderList(OrderBean order,
			HttpServletRequest request, Model model) throws Exception{
		
		//검색어 입력받기
		String searchValue = null;
		searchValue = request.getParameter("searchValue");
		
		//주문상태 입력받기
		String ostatus = null;
		ostatus = request.getParameter("ostatus");
				
		//Order들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
		if(searchValue == null || searchValue.trim() =="") {
			if(ostatus == null) {
				//검색어도 없고, 주문상태 검색도 없는(전체)인 경우 
				list = adminOrderService.adminOrderList();
			} else {
				//검색어는 없지만, 주문상태 검색은 있는 경우
				list = adminOrderService.adminSearchOrder(searchValue,ostatus);
			}
		}		
		else {
			//검색어와 주문상태 둘다 검색하는 경우
			list = adminOrderService.adminSearchOrder(searchValue,ostatus);
		}
		
		model.addAttribute("ostatus", ostatus);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminOrderList", list);		
		
		//tiles.xml의 definition name="adminOrderList"로 이동
		return "adminOrderList";
	}
	
	@RequestMapping(value="/adminOrderDetail.do")
	public String adminOrderDetail(
			OrderBean order, Model model) throws Exception{
		
		//특정 order의 map만 필요하므로 HashpMap형태의 'map' 생성	
		Map<String, Object> map = new HashMap<String, Object>();
		
		//adminOrderList에서 o_num=? 로 입력받은 o_num값을 order에 주어 상세정보 검색
		map = adminOrderService.adminOrderDetail(order);
		
		model.addAttribute("adminOrderBean",map);
		
		//tiles.xml의 definition name="adminOrderDetail"로 이동
		return "adminOrderDetail";
	}
	
	@RequestMapping(value="/adminUpdateOrder.do")
	public String adminUpdateOrder(OrderBean order, Model model) throws Exception{
		
		if(order.getO_status() == "배송대기") {
			order.setO_status("배송대기");
		}
		else if(order.getO_status() == "배송중") {
			order.setO_status("배송중");
		}
		else if(order.getO_status() == "배송완료") {
			order.setO_status("배송완료");
		}
		
		adminOrderService.adminUpdateOrder(order);
		
		model.addAttribute("msg", "주문정보가 수정되었습니다.");
		model.addAttribute("url", "/adminOrderList.do");
		
		//tiles로 보내지 않고 바로 adminUpdateOrder.jsp 실행.
		return "admin/order/adminUpdateOrder";
	}
	
	@RequestMapping(value="/adminCancelOrder.do")
	public String adminCancelOrder(OrderBean order, Model model) throws Exception{
		
		adminOrderService.adminCancelOrder(order);
		
		model.addAttribute("msg", "주문이 취소되었습니다.");
		model.addAttribute("url", "/adminOrderList.do");
		
		//tiles로 보내지 않고 바로 adminCancelOrder.jsp 실행.
		return "admin/order/adminCancelOrder";
		
	}

}
