package com.projectQ.conf.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectQ.conf.cart.dao.CartDAO;
import com.projectQ.conf.cart.vo.CartVO;
import com.projectQ.conf.goods.vo.GoodsVO;

//@Service("cartService")
//@Transactional(propagation = Propagation.REQUIRED)
@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public Map<String, List> myCartList(CartVO cartVO)throws Exception{
		Map<String, List> cartMap=new HashMap<String, List>();
		//장바구니 페이지에 표시할 장바구니 정보를 조회
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);
		//장바구니에 상품이 없는 경우 null을 반환합니다.
		if(myCartList.size()==0) {
			return null;
		}
		//장바구니 페이지에 표시할 장바구니 정보를 조회합니다.
		List<GoodsVO> myGoodsList=cartDAO.selectGoodsList(myCartList);
		//장바구니 정보와 상품정보를 cartMap에 저장하여 반환합니다.
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		return cartMap;
	}
	//테이블에 추가하기전에 동일한 상품 번호의 개수를 조회합니다.
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		return cartDAO.selectCountInCart(cartVO);
	}
	//장바구니에 추가합니다
	public void addGoodsInCart(CartVO cartVO) throws Exception{
		cartDAO.insertGoodsInCart(cartVO);
	}
	public boolean modifyCartQty(CartVO cartVO) throws Exception{
		boolean result=true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}
	public void removeCartGoods(int cart_id) throws Exception{
		cartDAO.deleteCartGoods(cart_id);
	}

}
