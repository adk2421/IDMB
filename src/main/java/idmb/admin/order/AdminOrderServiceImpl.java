package idmb.admin.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.OrderBean;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Resource (name="adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;
	
	//-- 주문 관리 리스트 --
	@Override
	public List<Map<String, Object>> adminOrderList() throws Exception{
		return adminOrderDAO.adminOrderList();
	}
	
	//-- 주문 검색 --
	@Override
	public List<Map<String, Object>> adminSearchOrder(String searchValue
			,String ostatus) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchValue", searchValue);
		map.put("ostatus", ostatus);
		
		return adminOrderDAO.adminSearchOrder(map);
	}
	
	//-- 주문 상세 정보 --
	@Override
	public Map<String, Object> adminOrderDetail(OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("o_num", order.getO_num());
		
		return adminOrderDAO.adminOrderDetail(map);
		
	}
	
	//-- 주문 상태 수정 --
	@Override
	public void adminUpdateOrder(OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("o_status", order.getO_status());
		map.put("o_num", order.getO_num());
		
		adminOrderDAO.adminUpdateOrder(map);
		
	}

}
