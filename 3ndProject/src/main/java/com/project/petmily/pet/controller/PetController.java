package com.project.petmily.pet.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.petmily.pet.PetService;
import com.project.petmily.pet.PetVO;

@Controller
public class PetController {
	
	@Autowired
	PetService petService; 
	
	
	@RequestMapping("getPetList.do")
	@ResponseBody
	public List<PetVO> getPetList (PetVO pvo){
		//System.out.println("pvo 먼저 확인 : " + pvo);
		return petService.getPetList(pvo);
	}
	
	@RequestMapping(value="/insertPet.do", method=RequestMethod.POST)
	public String insertPet(PetVO pvo, @RequestParam("petImage") MultipartFile file) throws IllegalStateException, IOException {
		
		//System.out.println("pvo : " + pvo);
		//System.out.println("insertBoard.do 연결됨");
		
		System.out.println(" > files : " + file);
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.DAY_OF_MONTH)+1;
		int date = cal.get(Calendar.DATE);
		int mSecond = cal.get(Calendar.MILLISECOND);
		String dateInfo = month+"_"+date+"_"+mSecond;
		
		if(!(file.isEmpty())) {
			String fileName = file.getOriginalFilename();//업로드 당시 원래 파일의 이름
			file.transferTo(new File("C:\\upload\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			pvo.setPphoto(dateInfo+ fileName);
		}else {
			pvo.setPphoto("./images/nonePict.jpg");
		}
		//insert 작업
		petService.insertPet(pvo);
		
		return "myPage.do?midx="+pvo.getMidx();
	}
	
	@RequestMapping("deletePet.do")
	public void deletePet(PetVO pvo) {
		petService.deletePet(pvo);
	}
	
}
