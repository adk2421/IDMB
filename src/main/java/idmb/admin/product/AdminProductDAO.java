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
	
	public List<Map<String, Object>> adminProductList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminProductList", map);
	}
	
	public List<Map<String, Object>> adminSearchProduct(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchProduct", map);
	}
	
	public Map<String, Object> adminSearchProductCode(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminSearchProductCode", map);
	}

	public void adminInsertProduct(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertProduct", map);
	}
	
	public void adminUpdateProduct(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateProduct", map);
	}
	
	public Map<String, Object> adminProductCount() throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminProductCount");
	}
	
	public Map<String, Object> adminSearchProductCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminSearchProductCount", map);
	}

}
