package idmb.common.product;

import java.util.List;
import java.util.Map;

import idmb.model.ProductBean;

public interface ProductService {
	
	// ���������� ��ǰ ����Ʈ
	public List<Map<String, Object>> mainpageProductList() throws Exception;
	
	//��ǰ �˻�
	public List<Map<String, Object>> searchProduct(String searchValue, int priceValue1, int priceValue2);
	
	// �Ż�ǰ�� ��ǰ ����Ʈ
	public List<Map<String, Object>> newProductList(String searchValue, int priceValue1, int priceValue2);
	
	// �α�� ��ǰ ����Ʈ 
	public List<Map<String, Object>> bestProductList (String searchValue, int priceValue1, int priceValue2);
	
	// ������ ��ǰ ����Ʈ
	public List<Map<String, Object>> kindProductList (ProductBean product, String searchValue, int priceValue1, int priceValue2 );
	
	// ��ǰ ��
	public Map<String, Object> productDetail(ProductBean product) throws Exception;
	

}
