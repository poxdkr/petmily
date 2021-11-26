	package com.project.petmily.advertise.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.petmily.advertise.AdvertiseService;
import com.project.petmily.advertise.AdvertiseVO;
import com.project.petmily.util.Criteria;
import com.project.petmily.util.Page;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class AdvertiseController {
	
	@Autowired
	private AdvertiseService advertiseService;
	
	//  광고 상품 전체 목록
	@RequestMapping("/getAdvertiseList.do")
	public String getAdvertiseList(AdvertiseVO vo, Model model, Criteria cri) {
		System.out.println(">>> 광고 상품 전체 목록 보여주기");
		System.out.println("getAdvertiseList vo : " + vo);

		List<AdvertiseVO> advertiseList = advertiseService.getAdvertiseList(cri);
		
		int total = advertiseService.getTotal(cri);
		
		System.out.println("list advertiseList : " + advertiseList);
		model.addAttribute("advertiseList", advertiseList);
		model.addAttribute("pageMaker", new Page(cri, total));
		
		return "getAdvertiseList.jsp";
	}
	
	//  광고 상품 전체 목록
	@RequestMapping("/getAdvertiseListNo.do")
	@ResponseBody
	public List<AdvertiseVO> getAdvertiseListNo(AdvertiseVO vo) {
		//System.out.println(">>> 광고 전체리스트를 리턴");
		List<AdvertiseVO> aList = advertiseService.getAdvertiseList();
		System.out.println("aList : " + aList);
		return aList;
	}
	
	// 광고 상품 상세보기
	@RequestMapping("/getAdvertise.do")
	public String getAdvertise(AdvertiseVO vo, @ModelAttribute("cri") Criteria cri, Model model) {
		System.out.println("### 광고 상품 상세");
		
		AdvertiseVO selectAdvertise = advertiseService.getAdvertise(vo);
		System.out.println("selectAdvertise : " + selectAdvertise);
		model.addAttribute("selectAdvertise", selectAdvertise);
		
		return "getAdvertise.jsp";
	}

	// 광고 상품 등록
	@RequestMapping("/insertAdvertise.do")
	public String insertAdvertise(AdvertiseVO vo) throws IllegalStateException, IOException {
		System.out.println("### 광고 입력");
		
		System.out.println("vo : " + vo);
		advertiseService.insertAdvertise(vo);
		
		return "getAdvertiseList.do";
	}
	
	// 광고 상품 수정
	@RequestMapping("/updateAdvertise.do")
	public String updateAdvertise(AdvertiseVO vo) throws IllegalStateException, IOException {
		System.out.println("### 광고 수정");

		System.out.println("vo : " + vo);
		advertiseService.updateAdvertise(vo);
		
		return "getAdvertise.do";
		
		
	}
	
	// 광고 상품 삭제
	@RequestMapping("/advertiseDelete.do")
	public String deleteAdvertise(AdvertiseVO vo) {
		System.out.println("### 광고 삭제");
		advertiseService.deleteAdvertise(vo);
		
		return "getAdvertiseList.do";
	}

	@RequestMapping(value="/uploadAjaxAction2.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AdvertiseVO>> uploadAjaxAction(MultipartFile[] fileUpload) {
		System.out.println("uploadAjaxAction.................");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: fileUpload) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				System.out.println("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<AdvertiseVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}
			
		}
		
		
		
		// 업로드 경로
		String uploadFolder = "C:\\upload";
		
		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
//		System.out.println("파일 이름 : " + fileUpload.getOriginalFilename());
//		System.out.println("파일 타입 : " + fileUpload.getContentType());
//		System.out.println("파일 크기 : " + fileUpload.getSize());
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// 이미지 정보 담는 객체
		List<AdvertiseVO> list = new ArrayList<>();
		
		for (MultipartFile multipartFile : fileUpload) {
			
			/* 이미지 정보 객체 */
			AdvertiseVO vo = new AdvertiseVO();
			
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
//				/* 썸네일 생성(ImageIO) */
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				
//
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//					/* 비율 */
//					double ratio = 2;
//					/*넓이 높이*/
//					int width = (int) (bo_image.getWidth() / ratio);
//					int height = (int) (bo_image.getHeight() / ratio);		
//				
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//								
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				graphic.drawImage(bo_image, 0, 0, width, height, null);
//					
//				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
				/* 방법 2 */
					
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				vo.setApicture(datePath.toString() + "/s_" + uploadFileName);
				
				System.out.println("vo : " + vo);
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 2;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			list.add(vo);
		}
		
		ResponseEntity<List<AdvertiseVO>> result = new ResponseEntity<List<AdvertiseVO>>(list, HttpStatus.OK);

		return result;

		
	}
	
	@RequestMapping("/display2.do")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		System.out.println("getImage() : " + fileName);
		
		File file = new File("C:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		}

	/* 이미지 파일 삭제 */
	@RequestMapping("/deleteFile2.do")
	public ResponseEntity<String> deleteFile(String fileName){
		
		System.out.println("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			System.out.println("deleteFileName : " + file);
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			System.out.println("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);

		
	}
	
	/* =============황균이형=================*/
	@RequestMapping("/getAdvertiseListAjax.do")
	@ResponseBody
	public List<AdvertiseVO> getAdvertiseList(){
		return advertiseService.getAdvertiseList();
	}
	
	@RequestMapping("/getAdvertiseAjax.do")
	@ResponseBody
	public AdvertiseVO getAdvertise(AdvertiseVO adVO) {
		return advertiseService.getAdvertise(adVO);
	}
	
	@RequestMapping("/plusCntAd.do")
	@ResponseBody
	public void plusCntAd(AdvertiseVO adVO) {
		advertiseService.plusCntAd(adVO);
	}
}
