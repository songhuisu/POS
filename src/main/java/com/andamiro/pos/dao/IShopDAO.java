package com.andamiro.pos.dao;

import java.util.List;

import com.andamiro.pos.model.CategoryDTO;
import com.andamiro.pos.model.MenuDTO;
import com.andamiro.pos.model.SessionDTO;
import com.andamiro.pos.model.ShopDTO;

public interface IShopDAO {
	public List<ShopDTO> selectShop(SessionDTO dto);
	public int selectPw(ShopDTO dto);
	public List<MenuDTO> selectMenu(SessionDTO dto);
	public List<CategoryDTO> selectCategory(SessionDTO dto);
}
