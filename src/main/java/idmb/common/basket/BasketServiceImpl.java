package idmb.common.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.BasketBean;


//@Service("객체이름") : Service객체임을 @Service을 통해 선언
//BasketSeviceImpl 생성뒤 Service를 basketService라는 이름으로 선언한것을 사용하겠다.
@Service("basketService") 
public class BasketServiceImpl implements BasketService{ //Service 인터페이스를 통해 정의된 메서드를 실제로 구현하는 클래스
	
	@Resource(name="basketDAO") 
	private BasketDAO basketDAO; //서비스에서 데이터 접근을 위한 DAO객체 선언
	
		//장바구니 상품 목록
		@Override //메소드 재정의
		public List<Map<String, Object>> basketList(BasketBean basket) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			
			//map.put(key(식별),value(사용값)) : Key값 중복불가,value 값 중복가능
			map.put("b_id",basket.getB_id());
		
			return basketDAO.basketList(map);
			//basketList결과값으로 basketDAO클래스의 basketList메서드 호출 후 바로 반환(return).
		}
		
		//장바구니 상품추가
		@Override
		public void insertBasket(BasketBean basket) throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("b_id", basket.getB_id());
			map.put("b_code", basket.getB_code());
			map.put("b_name", basket.getB_name());
			map.put("b_price", basket.getB_price());
			map.put("b_count", basket.getB_count());
			map.put("b_image", basket.getB_image());
			map.put("b_kind", basket.getB_kind());
			
			basketDAO.insertBasket(map);
		}
		//장바구니 수량 수정
		@Override
		public void updateBasket(BasketBean basket) throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("b_count", basket.getB_count());
			map.put("b_id", basket.getB_id());
			map.put("b_code", basket.getB_code());
			
			basketDAO.updateBasket(map);
		}
		//장바구니 상품 삭제
		@Override
		public void deleteBasket(BasketBean basket) throws Exception{
			Map<String, Object>map = new HashMap<String, Object>();
			
			map.put("b_id", basket.getB_id());
			map.put("b_code", basket.getB_code());
			
			basketDAO.deleteBasket(map);
		}
	
	
	
}
