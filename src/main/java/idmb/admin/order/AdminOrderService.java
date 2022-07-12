package idmb.admin.order;

import java.util.Date;
import java.util.List;
import java.util.Map;

import idmb.model.OrderBean;

public interface AdminOrderService {
	
	public List<Map<String, Object>> adminOrderList() throws Exception;
	
	public List<Map<String, Object>> adminSearchOrder(OrderBean order,
			String searchValue, Date searchDate1, Date searchDate2) throws Exception;
	
	public Map<String, Object> adminOrderDetail(OrderBean order) throws Exception;
	
	public void adminUpdateOrder(OrderBean order) throws Exception;
	
}
