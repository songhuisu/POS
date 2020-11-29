package com.andamiro.pos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andamiro.pos.dao.ISaleDAO;
import com.andamiro.pos.dao.IShopDAO;
import com.andamiro.pos.model.SaleDTO;
import com.andamiro.pos.model.SessionDTO;
import com.andamiro.pos.model.ShopDTO;

@Service("ISaleService")
public class SaleService implements ISaleService{
	@Autowired
	private ISaleDAO dao;
	
	@Override
	public List<SaleDTO> SelectSaleList(SaleDTO dto){
		// TODO Auto-generated method stub
		return dao.SelectSaleList(dto);
	}

}
