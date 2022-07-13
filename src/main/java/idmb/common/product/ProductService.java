package idmb.common.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface ProductService {
	
	// 메인페이지 상품리스트
	public List<Map<String, Object>> mainpageProductList() throws Exception;
	
	//상품 검색
	public List<Map<String, Object>> searchProduct(String searchValue, int priceValue1, int priceValue2, String SORT) throws Exception;
	
	// 신상품순 상품리스트
	public List<Map<String, Object>> newProductList(String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	// 인기순 상품리스트
	public List<Map<String, Object>> bestProductList (String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	// 종류별 상품리스트
	public List<Map<String, Object>> kindProductList (ProductBean product, String searchValue, int priceValue1, int priceValue2 ) throws Exception;
	
	// 상품 상세
	public Map<String, Object> productDetail(ProductBean product) throws Exception;
	

}
