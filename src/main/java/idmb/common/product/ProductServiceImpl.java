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
	

	@Override
	public List<Map<String, Object>> mainpageProductList() throws Exception{
	
		return productDAO.mainpageProductList();
	
	}
		
	@Override
	public List<Map<String, Object>> searchProduct(
			String searchValue, int priceValue1, int priceValue2, String SORT) 
			throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue",searchValue);
		map.put("priceValue1",priceValue1);
		map.put("priceValue2",priceValue2);
		
		return productDAO.searchProduct(map);
		
	}

	@Override
	public List<Map<String, Object>> newProductList(String searchValue, int priceValue1, int priceValue2)
			throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
	
		return productDAO.newProductList(map);
	
	}	

	@Override
	public List<Map<String, Object>> bestProductList (String searchValue, int priceValue1, int priceValue2) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		
		return productDAO.bestProductList(map);
		
	}

	@Override
	public List<Map<String, Object>> kindProductList (ProductBean product, String searchValue, int priceValue1, int priceValue2, String SORT)throws Exception{
	
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_kind", product.getP_kind());
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
	
		return productDAO.kindProductList(map);
	
	}
	
	@Override
	public Map<String, Object> productDetail(ProductBean product) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_code", product.getP_code());
		
		return productDAO.productDetail(map);
	}
}
	
