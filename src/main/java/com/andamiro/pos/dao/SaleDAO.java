package com.andamiro.pos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.andamiro.pos.model.SaleDTO;

@Repository
public class SaleDAO implements ISaleDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<SaleDTO> SelectSaleList(SaleDTO dto){
		// TODO Auto-generated method stub
		System.out.println("SaleDAO() 처리");
		return mybatis.selectList("SaleService.selectList_shop", dto);
	}

}
