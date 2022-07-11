package idmb.common.order;

import java.util.List;
import java.util.Map;

import idmb.model.OrderBean;

public interface OrderService {
	
	//주문리스트 출력
	public List<Map<String,Object>> myOrderList(OrderBean order) throws Exception; 
	
	//주문 등록
	public void insertOrder (OrderBean order) throws Exception;
	
	//주문 취소
	public void deleteOrder (OrderBean order) throws Exception; 

}