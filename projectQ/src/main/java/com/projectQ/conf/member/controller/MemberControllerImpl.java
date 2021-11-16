package com.projectQ.conf.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.member.service.MemberService;
import com.projectQ.conf.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends baseController implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	//ID와 PW를 Map에 저장
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
								HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		//SQL문으로 전달
		memberVO=memberService.login(loginMap);
		if(memberVO!= null && memberVO.getMember_id()!=null) {
			HttpSession session=request.getSession();
//조회한 회원정보를 가져와 isLogOn속성을  true로 설정하고 memberInfo속성으로 회원정보를 저장
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
//상품주문 과정에서 로그인했으면 로그인후 다시 주문화면으로 진행하고 그외에는 메인페이지를 표시합니다.
			String action=(String) session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")) {
				mav.setViewName("forward:"+action);
			}else {
				mav.setViewName("redirect:/main/main.do");
			}
		}else {
			String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
			mav.addObject("message",message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	@Override
	@RequestMapping(value="logout.do",method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	@Override
	@RequestMapping(value="/addMember.do",method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memeberVO") MemberVO _memberVO,
									HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message =null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.addMember(_memberVO);//회원정보를SQL문으로 전달
			message="<script>";
			message +="alert('회원가입을 마쳤습니다. 로그인창으로 이동합니다.');";
			message +="location.href='"+request.getContextPath()+"/member/loginForm.do';";
			message +="</script>";
		}catch(Exception e) {
			message ="<script>";
			message +="alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			message +="location.href='"+request.getContextPath()+"/member/memberForm.do';";
			message +="</script>";
				e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping(value="/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,
									HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		//ID로 중복검사
		String result =memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	

}
