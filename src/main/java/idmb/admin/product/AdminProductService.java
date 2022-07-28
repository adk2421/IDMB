package idmb.admin.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface AdminProductService {
	
	public List<Map<String, Object>> adminProductList(int START, int END) throws Exception;
	
	public List<Map<String, Object>> adminSearchProduct(String searchValue, int START, int END) throws Exception;

	public Map<String, Object> adminSearchProductCode(ProductBean product) throws Exception;
	
	public void adminInsertProduct(ProductBean product) throws Exception;
	
	public void adminUpdateProduct(ProductBean product) throws Exception;
	
	public int adminProductCount() throws Exception;
	
	public int adminSearchProductCount(String searchValue) throws Exception;
}
