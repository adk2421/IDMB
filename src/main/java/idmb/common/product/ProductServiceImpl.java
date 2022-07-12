package idmb.common.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.ProductBean;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Resource(name="productDAO")
	private ProductDAO productDAO;
	
	// 메인 페이지 상품리스트
	@Override
	public List<Map<String, Object>> mainpageProductList() throws Exception{
	
		return productDAO.mainpageProductList();
	
	}
		
	//상품 검색
	@Override
	public List<Map<String, Object>> searchProduct(
			String searchValue, int priceValue1, int priceValue2, int SORT) 
			throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue",searchValue);
		map.put("priceValue1",priceValue1);
		map.put("priceValue2",priceValue2);
		
		return productDAO.searchProduct(map);
		
	}
	// 신상품순 상품리스트
	@Override
	public List<Map<String, Object>> newProductList(String searchValue, int priceValue1, int priceValue2)
			throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
	
		return productDAO.newProductList(map);
	
	}
	
	// 인기순 상품리스트
	@Override
	public List<Map<String, Object>> bestProductList (String searchValue, int priceValue1, int priceValue2) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		
		return productDAO.bestProductList(map);
		
	}
	
	// 종류별 상품리스트
	@Override
	public List<Map<String, Object>> kindProductList (ProductBean product, String searchValue, int priceValue1, int priceValue2 )throws Exception{
	
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_kind", product.getP_kind());
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
	
		return productDAO.kindProductList(map);
	
	}
	
	// 상품 상세
	@Override
	public Map<String, Object> productDetail(ProductBean product) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_code", product.getP_code());
		
		return productDAO.productDetail(map);
	}
}
	
