package com.andamiro.pos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.andamiro.pos.model.SaleDTO;
import com.andamiro.pos.model.SessionDTO;
import com.andamiro.pos.service.ISaleService;


@Controller
@SessionAttributes("user")
public class SaleController {
	@Autowired
	ISaleService SaleService;
	@Autowired
	HttpSession session;
	
	// 게시물 뷰
		@RequestMapping("sales_account.do")
		public String BContentForm(@ModelAttribute("user") SessionDTO sdto, Model model,SaleDTO dto) { // saleDTO 에 shop_id 넣어서 일루와야댐 그래야 어느매장의 결제내역을 볼것인지 결정 할 수 있음 
			System.out.println("일로옴??");
			//임의로 shop_id 넣어줄거임
			SaleDTO dto_ex = new SaleDTO();
			dto_ex.setShop_id(sdto.getSelectedShop().getId()); // 1번 매장으로 임의로 지정했음 나중에 넘겨서 넣어주세요
			List<SaleDTO> replies = SaleService.SelectSaleList(dto_ex); // 해당 매장 내역 불러옴 
			System.out.println("목록들:"+replies);;
			model.addAttribute("replies", replies);
			
			return "sales_account";
		}
}
