package com.andamiro.pos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.andamiro.pos.model.LoginDTO;
import com.andamiro.pos.model.MemberDTO;
import com.andamiro.pos.model.SessionDTO;
import com.andamiro.pos.model.UpdateDTO;
import com.andamiro.pos.service.IMemberService;

@Controller
@SessionAttributes("user")
public class MemberController {
	@Autowired
	IMemberService MemberService;
	@Autowired
	HttpSession session;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String index() {
		return "redirect:/";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView home(LoginDTO dto, HttpServletRequest request) {
		dto = MemberService.selectLogin(dto);
		if (dto == null) {
			ModelAndView mv = new ModelAndView("../../index");
			mv.addObject("msg", "아이디와 비밀번호를 확인 해 주세요.");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("redirect:home");
			SessionDTO sdto = new SessionDTO();
			sdto.setId(dto.getId());
			sdto.setName(dto.getName());
			
			session = request.getSession(true);
			session.setAttribute("user", sdto);
			mv.addObject("user", sdto);

			return mv;
		}
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public ModelAndView logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("memberDTO") @Valid MemberDTO memberDTO, 
			BindingResult bindingResult) {
		System.out.println("가입시도");

		if (bindingResult.hasErrors()) {
			System.out.println("join error!");
			ModelAndView mv = new ModelAndView("join");
			return mv;
		} else {
			try {
				MemberService.insertMember(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			ModelAndView mv = new ModelAndView("../../index");
			mv.addObject("msg", "회원가입 성공!! 다시 로그인 해 주세요");
			return mv;
		}
	}
	
	@RequestMapping(value = "checkSignup", method = RequestMethod.POST)
	public @ResponseBody String AjaxView(  
		        @RequestParam("id") String id){
		String str = "";
		int idcheck = MemberService.idCheck(id);
		if(idcheck==1){ //이미 존재하는 계정
			str = "NO";	
		}else{	//사용 가능한 계정
			str = "YES";	
		}
		return str;
	}

	@RequestMapping(value = "join_admin.do", method = RequestMethod.GET)
	public String join_admin(@ModelAttribute("memberDTO") MemberDTO memberDTO) {
		return "join_admin";
	}
	
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public ModelAndView myPage(@ModelAttribute("user") SessionDTO dto) {
		ModelAndView mv = new ModelAndView("mypage");
		return mv;
	}
	
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public ModelAndView modify(@ModelAttribute("user") SessionDTO dto) {
		ModelAndView mv = new ModelAndView("modify");
		mv.addObject("memberDTO", MemberService.selectMember(dto.getId()));
		return mv;
	}
	
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("memberDTO") @Valid UpdateDTO memberDTO, 
			BindingResult bindingResult, @ModelAttribute("user") SessionDTO dto) {
		ModelAndView mv = new ModelAndView();
		LoginDTO ldto = new LoginDTO();
		ldto.setId(memberDTO.getId());
		ldto.setPw(memberDTO.getPw());
		
		if(memberDTO.getCheckPw() == "") {
			mv.setViewName("mypage");
			if(MemberService.pwCheck(ldto) != 1) {
				bindingResult.rejectValue("pw", "nomatch", "비밀번호가 일치하지 않습니다.");
				return mv;
			}
		}
		
		if (bindingResult.hasErrors()) {
			System.out.println("update error!");
			mv.setViewName("mypage");
			return mv;
		} else {
			try {
				MemberService.updateMember(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				mv.setViewName("mypage");
				return mv;
			}
			mv.setViewName("redirect:home?idx=1");
			mv.addObject("msg", "회원 정보 수정 성공!!");
			return mv;
		}
	}
	
	@RequestMapping(value = "leave.do", method = RequestMethod.POST)
	public ModelAndView myPage(@ModelAttribute("memberDTO") @Valid UpdateDTO memberDTO, 
			BindingResult bindingResult) {
		ModelAndView mv = new ModelAndView();
		LoginDTO ldto = new LoginDTO();
		ldto.setId(memberDTO.getId());
		ldto.setPw(memberDTO.getPw());
		
		mv.setViewName("mypage");
		if(MemberService.pwCheck(ldto) != 1) {
			bindingResult.rejectValue("pw", "nomatch", "비밀번호가 일치하지 않습니다.");
			return mv;
		}else {
			MemberService.deleteMember(ldto);
			mv.setViewName("redirect:logout.do");
			return mv;
		}
	}

}
