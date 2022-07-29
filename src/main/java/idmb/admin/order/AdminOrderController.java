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
import idmb.util.Paging;

@Controller
public class AdminOrderController {
	
	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrderList.do")
	public String adminOrderList(OrderBean order,
			HttpServletRequest request, Model model) throws Exception{
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 주문의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 상품의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminOrderList.do";
		String searchUrl = "";
		
		//검색어 입력받기
		String searchValue = request.getParameter("searchValue");
		//주문상태 입력받기
		String ostatus = request.getParameter("ostatus");
		
		//검색조건이 유무에 따른 searchUrl 설정
		if(ostatus != null) {
			if(searchValue != null) {
				searchUrl = "&ostatus="+ostatus+"&searchValue="+searchValue;
			} else {
				searchUrl = "&ostatus="+ostatus+"&searchValue=";
			}
		} else {
			if(searchValue != null) {
				searchUrl = "&ostatus=&searchValue="+searchValue;
			} else {
				searchUrl = "";
			}
		}
		
		//기본 페이지가 아닌 경우
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
			START = 1 + pageSize * (currentPage-1); //1,11,21 단위로 상품 출력
			END = pageSize * currentPage;
		}
		
		//검색 조건 유무에 따른 totalCount 개수 확인
		if(ostatus != null) {
			if(searchValue != null) {
				totalCount = adminOrderService.adminSearchOrderCount(searchValue, ostatus);
			} else {
				totalCount = adminOrderService.adminSearchOrderCount(searchValue, ostatus);
			}
		} else {
			if(searchValue != null) {
				totalCount = adminOrderService.adminSearchOrderCount(searchValue, ostatus);
			} else {
				totalCount = adminOrderService.adminOrderCount();
			}
		}
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);

		//Order들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		
		//검색어가 있는 경우
		if(ostatus != null) {
			if(searchValue != null) {
				list = adminOrderService.adminSearchOrder(searchValue, ostatus, START, END);
			} else {
				list = adminOrderService.adminSearchOrder(searchValue, ostatus, START, END);
			}
		} else {
			if(searchValue != null) {
				list = adminOrderService.adminSearchOrder(searchValue, ostatus, START, END);
			} else { //검색어도 없고, 주문상태 검색도 없는(전체)인 경우 
				list = adminOrderService.adminOrderList(START, END);
			}
		}
		
		
		model.addAttribute("ostatus", ostatus);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminOrderList", list);	
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);
		
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
