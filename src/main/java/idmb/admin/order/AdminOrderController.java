package idmb.admin.order;

import java.util.ArrayList;
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
		
		String searchValue = null;
		searchValue = request.getParameter("searchValue");
		
		String ostatus = null;
		ostatus = request.getParameter("ostatus");
				
		//Order들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
		if(searchValue == null || searchValue.trim() =="") {
			if(ostatus == null) {
				list = adminOrderService.adminOrderList();
			} else {
				list = adminOrderService.adminSearchOrder(searchValue,ostatus);
			}
		}		
		
		else {
			list = adminOrderService.adminSearchOrder(searchValue,ostatus);
		}
		
		model.addAttribute("ostatus", ostatus);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminOrderList", list);		
				
		return "adminOrderList";
	}
	
	

}
