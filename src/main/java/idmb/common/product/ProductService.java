package idmb.common.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface ProductService {
	
	public List<Map<String, Object>> mainBestList() throws Exception;
	
	public List<Map<String, Object>> mainNewList() throws Exception;
	
	public List<Map<String, Object>> searchProduct(
			String searchValue, int priceValue1, int priceValue2, String SORT, int START, int END) throws Exception;
	
	public int searchProductCount(String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	public List<Map<String, Object>> newProductList(
			String searchValue, int priceValue1, int priceValue2, int START, int END) throws Exception;
	
	public List<Map<String, Object>> bestProductList (
			String searchValue, int priceValue1, int priceValue2, int START, int END) throws Exception;
	
	public List<Map<String, Object>> kindProductList (
			ProductBean product, String searchValue, int priceValue1, int priceValue2 ,String SORT, int START, int END) throws Exception;
	
	public int kindProductCount(ProductBean product, String searchValue, int priceValue1, int priceValue2) throws Exception;
	
	public Map<String, Object> productDetail(ProductBean product) throws Exception;
	
	public List<Map<String, Object>> productReviewList(ProductBean product, int START, int END) throws Exception;
	
	public int productReviewCount(ProductBean product) throws Exception;
	
	public void productZim(ProductBean product) throws Exception;
	
	public void zimDb(ProductBean product, String id) throws Exception;
	
	public Map<String, Object> zimCheck(ProductBean product, String id) throws Exception;
	
}
