package com.andamiro.pos.service;

import java.util.List;
import java.util.Map;

import com.andamiro.pos.model.SaleDTO;

public interface ISaleService {
		//  목록 불러오기
		public List<SaleDTO> SelectSaleList(SaleDTO dto);
}
