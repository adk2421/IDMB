package idmb.admin.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.ProductBean;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService{
	
	@Resource(name="adminProductDAO")
	private AdminProductDAO adminProductDAO;

	// 상품 리스트
	@Override
	public List<Map<String, Object>> adminProductList() throws Exception{
	
	return adminProductDAO.adminProductList();
	
	}

	// 상품 검색
	@Override
	public List<Map<String, Object>> adminSearchProduct(String searchValue) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("searchValue", searchValue);
		
		return adminProductDAO.adminSearchProduct(map);
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
	
		map.put("p_name", product.getP_name());
		map.put("p_image", product.getP_image());
		map.put("p_price", product.getP_price());
		map.put("p_stock", product.getP_stock());
		map.put("p_sell", product.getP_sell());
		map.put("p_kind", product.getP_kind());
		map.put("p_detail",product.getP_detail());
		
		adminProductDAO.adminInsertProduct(map);
	}
	

	
	// 상품 삭제(비활성)
	@Override
	public void adminDeleteProduct() throws Exception{
	
	adminProductDAO.adminDeleteProduct();
}
}
