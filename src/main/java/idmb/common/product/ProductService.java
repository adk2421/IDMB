package idmb.common.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface ProductService {
	
	public List<Map<String, Object>> mainpageProductList() throws Exception;
	
	public List<Map<String, Object>> searchProduct(String searchValue, int priceValue1, int priceValue2, String SORT) throws Exception;
	
	public List<Map<String, Object>> newProductList(String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	public List<Map<String, Object>> bestProductList (String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	public List<Map<String, Object>> kindProductList (ProductBean product, String searchValue, int priceValue1, int priceValue2 ,String SORT) throws Exception;
	
	public Map<String, Object> productDetail(ProductBean product) throws Exception;
	

}
