package com.andamiro.pos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andamiro.pos.dao.IShopDAO;
import com.andamiro.pos.model.CategoryDTO;
import com.andamiro.pos.model.MenuDTO;
import com.andamiro.pos.model.SessionDTO;
import com.andamiro.pos.model.ShopDTO;

@Service("IShopService")
public class ShopService implements IShopService{
	@Autowired
	private IShopDAO dao;
	
	@Override
	public List<ShopDTO> selectShop(SessionDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectShop(dto);
	}

	@Override
	public int pwCheck(ShopDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectPw(dto);
	}

	@Override
	public List<MenuDTO> selectMenu(SessionDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectMenu(dto);
	}

	@Override
	public List<CategoryDTO> selectCategory(SessionDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectCategory(dto);
	}
}
