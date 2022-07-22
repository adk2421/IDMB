package idmb.common.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//(DB나 파일같은 외부 I/O작업처리)
//@Repository(BeanID이름)
@Repository("basketDAO")
public class BasketDAO { //이 클래스를 루트 컨테이너에 빈(Bean)객체로 생성

	//빈(Bean)객체 이용시 코드를 간결하게 해줘서 필수로 사용.(sql연동)
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	//장바구니 List불러오기 
	public List<Map<String,Object>> basketList(Map<String, Object>map) throws
	Exception{ 
		return sqlSessionTemplate.selectList("basket.basketList",map);
	}
	
	//장바구니 상품추가
	public void insertBasket(Map<String,Object>map) throws 
	Exception{
		sqlSessionTemplate.insert("basket.insertBasket",map);
	}
	
	//상품 수정
	public void updateBasket(Map<String,Object>map) throws 
	Exception{
		sqlSessionTemplate.update("basket.updateBasket", map);
	}
	
	//장바구니 삭제
	public void deleteBasket(Map<String,Object>map) throws 
	Exception{
		sqlSessionTemplate.delete("basket.deleteBasket", map);
	}
	
	public Map<String, Object> deleteBasketSearch(Map<String, Object>map) throws Exception{
		return sqlSessionTemplate.selectOne("basket.deleteBasketSearch", map);
	}
	
}
