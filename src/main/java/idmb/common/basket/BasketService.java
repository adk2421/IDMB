package idmb.common.basket;

import java.util.List;
import java.util.Map;

import idmb.model.BasketBean;

public interface BasketService {
	
	//장바구니 상품 목록
	public List<Map<String,Object>> basketList(BasketBean basket) throws Exception;
	//장바구니 상품추가
	public void insertBasket(BasketBean basket) throws Exception;
	//장바구니 수량 수정
	public void updateBasket(BasketBean basket) throws Exception;
	//장바구니 상품 삭제
	public void deleteBasket(BasketBean basket) throws Exception;
	
}
