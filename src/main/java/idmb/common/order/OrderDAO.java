package idmb.common.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("orderDAO")
public class OrderDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//주문리스트 출력
	public List<Map<String,Object>> myOrderList(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectList("order.myOrderList", map);
	}; 
		
	//주문 등록
	public void insertOrder(Map<String,Object> map) throws Exception{
		sqlSessionTemplate.insert("order.insertOrder", map);	
	};
		
	//주문 취소
	public void deleteOrder(Map<String,Object> map) throws Exception{
		sqlSessionTemplate.delete("order.deleteOrder", map);	
	};
	
	//주문 상태 갯수
	public List<Map<String, Object>> countOrderStatus(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("order.countOrderStatus", map);
	};	

}
