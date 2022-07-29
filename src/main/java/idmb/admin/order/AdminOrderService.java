package idmb.admin.order;

import java.util.List;
import java.util.Map;

import idmb.model.OrderBean;

public interface AdminOrderService {
	
	public List<Map<String, Object>> adminOrderList(int START, int END) throws Exception;
	
	public List<Map<String, Object>> adminSearchOrder(
			String searchValue, String ostatus, int START, int END) throws Exception;
	
	public int adminOrderCount() throws Exception;
	
	public int adminSearchOrderCount(String searchValue, String ostatus) throws Exception;
	
	public Map<String, Object> adminOrderDetail(OrderBean order) throws Exception;
	
	public void adminUpdateOrder(OrderBean order) throws Exception;
	
	public void adminCancelOrder(OrderBean order) throws Exception;
	
}
