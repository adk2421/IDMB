package idmb.common.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.BasketBean;

@Controller
public class BasketController {

	@Resource(name="basketService")
	private BasketService basketService;
	
	@RequestMapping(value="/basketList.do")
	public String basketList(BasketBean basket, Model model) throws Exception{
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		list = basketService.basketList(basket);
		
		model.addAttribute("basketList",list);
		
		return "basketList";
	}
	
	@RequestMapping(value="/updateBasket.do")
	public String updateBasket(BasketBean basket, Model model) throws Exception{
		
		String b_id = basket.getB_id();
		
		basketService.updateBasket(basket);
		
		model.addAttribute("url", "/basketList.do?b_id="+b_id+"");
		
		return "basket/updateBasket";
	}
	
	@RequestMapping(value="/deleteBasket.do")
	public String deleteBasket(BasketBean basket, Model model) throws Exception{
		
		Map<String,	Object> map = new HashMap<String, Object>();

		map = basketService.deleteBasketSearch(basket);
		
		String b_id = (String) map.get(basket.getB_id());
		
		basketService.deleteBasket(basket);
		
		model.addAttribute("msg", "장바구니 품목이 삭제되었습니다.");
		model.addAttribute("url", "/basketList.do?b_id="+b_id+"");
		
		return "basket/deleteBasket";
	}
	
	
}
