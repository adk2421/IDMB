package idmb.admin.order;

import java.util.List;
import java.util.Map;

import idmb.model.OrderBean;

public interface AdminOrderService {
	
	public List<Map<String, Object>> adminOrderList() throws Exception;
	
	public List<Map<String, Object>> adminSearchOrder(String searchValue
			,String ostatus) throws Exception;
	
	public Map<String, Object> adminOrderDetail(OrderBean order) throws Exception;
	
	public void adminUpdateOrder(OrderBean order) throws Exception;
	
}
