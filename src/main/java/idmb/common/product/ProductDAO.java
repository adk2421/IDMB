package idmb.common.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("productDAO")
public class ProductDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 메인페이지 인기상품 리스트
	public List<Map<String, Object>> mainBestList() throws Exception {
		return sqlSessionTemplate.selectList("product.mainBestList");
	}
	
	// 메인페이지 신상품 리스트
	public List<Map<String, Object>> mainNewList() throws Exception {
		return sqlSessionTemplate.selectList("product.mainNewList");
	}	
	
	//상품 검색
	public List<Map<String, Object>> searchProduct(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.searchProduct", map);
	}
	
	//상품 검색 수량
	public Map<String, Object> searchProductCount(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("product.searchProductCount", map);
	}
	
	// 신상품순 상품리스트
	public List<Map<String, Object>> newProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.newProductList", map);
	}
	
	// 인기순 상품리스트
	public List<Map<String, Object>> bestProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.bestProductList", map);
	}
	
	// 종류별 상품리스트
	public List<Map<String, Object>> kindProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.kindProductList", map);
	}
	
	// 상품상세
	public Map<String, Object> productDetail(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("product.productDetail", map);
	}
	
	//상품 후기 목록
	public List<Map<String, Object>> productReviewList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.productReviewList",map);
	}
	
	//상품 후기 수
	public Map<String, Object> productReviewCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("product.productReviewCount",map);
	}
}
