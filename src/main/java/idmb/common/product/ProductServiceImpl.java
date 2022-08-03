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
	public List<Map<String, Object>> mainBestList() throws Exception{
	
		return productDAO.mainBestList();
	
	}
	
	@Override
	public List<Map<String, Object>> mainNewList() throws Exception{
	
		return productDAO.mainNewList();
	
	}
		
	@Override
	public List<Map<String, Object>> searchProduct(
			String searchValue, int priceValue1, int priceValue2, String SORT, int START, int END) 
			throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		map.put("SORT", SORT);
		map.put("START", START);
		map.put("END", END);
		
		return productDAO.searchProduct(map);
	}
	
	@Override
	public int searchProductCount(String searchValue, int priceValue1, int priceValue2) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		
		Map<String, Object> countMap = productDAO.searchProductCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}

	@Override
	public List<Map<String, Object>> newProductList(
			String searchValue, int priceValue1, int priceValue2, int START, int END) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		map.put("START", START);
		map.put("END", END);
		
		return productDAO.newProductList(map);
	}	

	@Override
	public List<Map<String, Object>> bestProductList(
			String searchValue, int priceValue1, int priceValue2, int START, int END) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		map.put("START", START);
		map.put("END", END);
		
		return productDAO.bestProductList(map);	
	}

	@Override
	public List<Map<String, Object>> kindProductList(
			ProductBean product, String searchValue, int priceValue1, int priceValue2, String SORT,
			 int START, int END) throws Exception{
	
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_kind", product.getP_kind());
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		map.put("SORT", SORT);
		map.put("START", START);
		map.put("END", END);
		
		return productDAO.kindProductList(map);
	}
	
	@Override
	public int kindProductCount(ProductBean product,String searchValue, int priceValue1, int priceValue2) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("p_kind", product.getP_kind());
		map.put("searchValue", searchValue);
		map.put("priceValue1", priceValue1);
		map.put("priceValue2", priceValue2);
		
		Map<String, Object> countMap = productDAO.kindProductCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}
	
	
	
	@Override
	public Map<String, Object> productDetail(ProductBean product) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_code", product.getP_code());
		
		return productDAO.productDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> productReviewList(ProductBean product, int START, int END) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("p_code", product.getP_code());
		map.put("START", START);
		map.put("END", END);
		
		return productDAO.productReviewList(map);	
	}
	
	@Override
	public int productReviewCount(ProductBean product) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("p_code", product.getP_code());
		
		Map<String, Object> countMap = productDAO.productReviewCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}
}
	
