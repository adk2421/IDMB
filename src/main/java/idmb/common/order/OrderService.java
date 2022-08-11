package idmb.common.order;

import java.util.List;
import java.util.Map;

import idmb.model.OrderBean;
import idmb.model.ProductBean;

public interface OrderService {
	
	//주문리스트 출력
	public List<Map<String,Object>> myOrderList(OrderBean order) throws Exception; 
	
	//주문 등록
	public void insertOrder (OrderBean order) throws Exception;
	
	//주문 취소
	public void deleteOrder (OrderBean order) throws Exception;
	
	//주문 상태 갯수
	public List<Map<String, Object>> countOrderStatus (OrderBean order) throws Exception;

	//주문 확인
	public Map<String,Object> orderCheck(ProductBean product, String id) throws Exception;
	
	//총 주문 금액
	public Map<String,Object> orderTotal(String id) throws Exception;
}