package idmb.admin.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface AdminProductService {
	
	public List<Map<String, Object>> adminProductList() throws Exception;
	
	public List<Map<String, Object>> adminSearchProduct(String searchValue) throws Exception;

	public Map<String, Object> adminSearchProductCode(ProductBean product) throws Exception;
	
	public void adminInsertProduct(ProductBean product) throws Exception;
	
	public void adminUpdateProduct(ProductBean product) throws Exception;
	
}
