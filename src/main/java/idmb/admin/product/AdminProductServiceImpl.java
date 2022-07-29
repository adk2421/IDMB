package idmb.admin.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.ProductBean;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService{
	
	@Resource (name="adminProductDAO")
	private AdminProductDAO adminProductDAO;
	
	// 상품 리스트
	@Override
	public List<Map<String, Object>> adminProductList(int START, int END) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("START", START);
		map.put("END", END);
		
		return adminProductDAO.adminProductList(map);		
	}

	// 상품 검색
	@Override
	public List<Map<String, Object>> adminSearchProduct(String searchValue, int START, int END) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		map.put("START", START);
		map.put("END", END);
		
		return adminProductDAO.adminSearchProduct(map);
	}
	
	public Map<String, Object> adminSearchProductCode(ProductBean product) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("p_code", product.getP_code());
		
		return adminProductDAO.adminSearchProductCode(map);
	}


	// 상품 등록
	@Override
	public void adminInsertProduct(ProductBean product) throws Exception{
	
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("p_name", product.getP_name());
		map.put("p_image", product.getP_image());
		map.put("p_price", product.getP_price());
		map.put("p_stock", product.getP_stock());
		map.put("p_sell", product.getP_sell());
		map.put("p_kind", product.getP_kind());
		map.put("p_detail",product.getP_detail());
		
		adminProductDAO.adminInsertProduct(map);
	}
	
	
	// 상품 정보 수정 
	@Override
	public void adminUpdateProduct(ProductBean product) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("p_code", product.getP_code());
		map.put("p_name", product.getP_name());
		map.put("p_image", product.getP_image());
		map.put("p_price", product.getP_price());
		map.put("p_stock", product.getP_stock());
		map.put("p_sell", product.getP_sell());
		map.put("p_kind", product.getP_kind());
		map.put("p_detail",product.getP_detail());
		map.put("p_delflag",product.getP_delflag());
		
		adminProductDAO.adminUpdateProduct(map);
	}
	
	@Override
	public int adminProductCount() throws Exception{
		
		Map<String,Object> map = adminProductDAO.adminProductCount();
		
		return Integer.parseInt(String.valueOf(map.get("COUNT")));
	}
	
	
	
	@Override
	public int adminSearchProductCount(String searchValue) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		
		Map<String, Object> countMap = adminProductDAO.adminSearchProductCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}
}
