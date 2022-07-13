package idmb.admin.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminProductDAO")
public class AdminProductDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminProductList() throws Exception{
		return sqlSessionTemplate.selectList("admin.adminProductList");
	}
	
	public List<Map<String, Object>> adminSearchProduct(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchProduct", map);
	}

	public void adminInsertProduct(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertProduct", map);
	}
	
	public void adminUpdateProduct(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateProduct", map);
	}
	
	public void adminDeleteProduct() throws Exception{
		sqlSessionTemplate.delete("admin.adminDeleteProduct");
		
	}

}
