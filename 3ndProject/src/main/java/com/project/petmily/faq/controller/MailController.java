package com.project.petmily.faq.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.faq.MailService;
import com.project.petmily.faq.MailVO;

@Controller
//@RequestMapping("email/*")
public class MailController {
	
	@Inject
    MailService mailService; // 서비스를 호출하기위한 의존성 주입
 
    
 
    @RequestMapping("sendMail.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String sendMail(@ModelAttribute MailVO vo, Model model) {
    	System.out.println("sendMail() 시작");
        try {
 
        	mailService.sendMail(vo); // vo (메일관련 정보)를 sendMail에 저장함
            model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
            System.out.println("sendMail(vo) : " + vo);
            
            
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력
             // 실패했으므로 다시 write jsp 페이지로 이동함
        }
        return "faqList.jsp";
    }

}
