package idmb.common.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("productDAO")
public class ProductDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// ���������� ��ǰ ����Ʈ
	public List<Map<String, Object>> mainpageProductList() throws Exception {
		return sqlSessionTemplate.selectList("product.mainpageProductList");
	}
	
	//��ǰ �˻�
	public List<Map<String, Object>> searchProduct(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.searchProduct", map);
		
	}
	
	// �Ż�ǰ�� ��ǰ ����Ʈ
	public List<Map<String, Object>> newProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.newProductList", map);
	}
	
	// �α�� ��ǰ ����Ʈ 
	public List<Map<String, Object>> bestProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.bestProductList", map);

	}
	
	// ������ ��ǰ ����Ʈ
	public List<Map<String, Object>> kindProductList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("product.kindProductList", map);
	}
	
	// ��ǰ ��
	public Map<String, Object> productDetail(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("product.productDetail", map);
	
	}
}
