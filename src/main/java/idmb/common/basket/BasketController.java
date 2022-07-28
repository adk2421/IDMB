package idmb.common.basket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.BasketBean;

@Controller
public class BasketController {

	@Resource(name="basketService")
	private BasketService basketService;
	
	@RequestMapping(value="/basketList.do")
	public String basketList(BasketBean basket, Model model, HttpServletRequest request) throws Exception{
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		// 세션 id 값 받아오기
        String id = (String) request.getSession().getAttribute("id");
        basket.setB_id(id);
		
		list = basketService.basketList(basket);
		
		model.addAttribute("basketList",list);
		
		return "basketList";
	}
	
	@RequestMapping(value="/updateBasket.do")
	public String updateBasket(BasketBean basket, Model model) throws Exception{
				
		basketService.updateBasket(basket);
		
		model.addAttribute("url", "/basketList.do");
		
		return "basket/updateBasket";
	}
	
	@RequestMapping(value="/deleteBasket.do")
	public String deleteBasket(BasketBean basket, Model model) throws Exception{
			
		basketService.deleteBasket(basket);
		
		model.addAttribute("msg", "장바구니 품목이 삭제되었습니다.");
		model.addAttribute("url", "/basketList.do");
		
		return "basket/deleteBasket";
	}
	
	
}
