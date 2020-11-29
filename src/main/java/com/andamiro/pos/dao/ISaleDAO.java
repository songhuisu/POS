package com.andamiro.pos.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.andamiro.pos.model.SaleDTO;

public interface ISaleDAO {
	// list 가져와
	public List<SaleDTO> SelectSaleList(SaleDTO dto);
}
