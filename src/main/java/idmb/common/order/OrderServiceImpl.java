package idmb.common.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.OrderBean;


@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;

	//주문리스트 출력
	@Override
	public List<Map<String,Object>> myOrderList(OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_id", order.getO_id());
		
		return orderDAO.myOrderList(map);	
	}
	
	//주문 등록
	@Override
	public void insertOrder (OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_id", order.getO_id());
		map.put("o_code", order.getO_code());
		map.put("o_name", order.getO_name());
		map.put("o_count", order.getO_count());
		map.put("o_price", order.getO_price());
		map.put("o_total", order.getO_total());
		map.put("o_postcode", order.getO_postcode());
		map.put("o_address1", order.getO_address1());
		map.put("o_address2", order.getO_address2());
		map.put("o_reciever", order.getO_reciever());
		map.put("o_phone", order.getO_phone());
		
		orderDAO.insertOrder(map);	
	}
	
	//주문 취소
	@Override
	public void deleteOrder (OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_num", order.getO_num());
		
		orderDAO.deleteOrder(map);
		
		
	}
	
	//주문 상태 갯수
	public List<Map<String, Object>> countOrderStatus (OrderBean order) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_id", order.getO_id());
		
		return orderDAO.countOrderStatus(map);

	}
	
}
