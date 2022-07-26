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
	
	// 메인페이지 상품리스트
	public List<Map<String, Object>> mainpageProductList() throws Exception {
		return sqlSessionTemplate.selectList("product.mainpageProductList");
	}
	
	//상품 검색
	public List<Map<String, Object>> searchProduct(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.searchProduct", map);
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
}
