package com.project.petmily.knowhow.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.petmily.knowhow.KnowhowVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class KnowhowAjaxController {
	//---------------------썸네일 부분------------------------
	/* 이미지 화면 출력 */
	@GetMapping("/display.do")
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println("getImage()..............");
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), 
					header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile.do")
	public ResponseEntity<String> deleteFile(String fileName) {
		System.out.println("deleteFile..........." + fileName);
		
		File file = null;
		
		try {
			//현재 utf-8로 인코딩 되어있는 파일 이름을 디코딩 해야된다. (한글이 "%5", "%2F" 따위의 문자로
			//변경되어 있기 때문
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));
			//썸네일 이미지 삭제
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			System.out.println("삭제할 원본파일 : " + originFileName);
			
			file = new File(originFileName);
			file.delete();
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/* 썸네일 첨부 파일 업로드 */
	//뷰쪽에서 JSON으로 데이터를 받을 때 한글일 경우 깨질 수 있기 때문에 utf-8로 인코딩 해야된다
	//@ResponseBody
	@PostMapping(value="/uploadAjaxAction.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<KnowhowVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		System.out.println("uploadAjaxActionPOST.........");
		
		String uploadFolder = "C:\\upload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		// "-"를 기준으로 경로 설정
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		//해당 날짜의 파일이 존재하는지 확인하고 없으면 새로운 파일 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//이미지 정보 담는 객체
		List<KnowhowVO> list = new ArrayList<KnowhowVO>();
		
		//향상된 for문
		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 타입 : " + multipartFile.getContentType());
			System.out.println("파일 크기 : " + multipartFile.getSize());
			
			//이미지 정보 객체
			KnowhowVO vo = new KnowhowVO();
			
			//파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
//			vo.setFileName(uploadFileName);
//			vo.setUploadPath(datePath);
			
			// uuid 적용 파일 이름
			String uuid = UUID.randomUUID().toString();
//			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			//파일 위치, 파일 이름을 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);
			
			//파일 저장
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 생성(ImageIO) */
				/* 방법 1 */
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				vo.setThumbnail(datePath.toString() + "/s_" + uploadFileName);
//				
//				BufferedImage bt_image = new BufferedImage(200, 300, BufferedImage.TYPE_3BYTE_BGR);
//				
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				/* graphic.drawImage(bt_image, 0, 0,200,400,null); */
//				graphic.drawImage(bt_image, 0, 0, null);
//				
//				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
				/* 방법 2 */
				//썸네일 파일은 기존파일 앞에 "s_"를 붙인다
				File thumnailFile = new File(uploadPath, "s_"+uploadFileName);
				vo.setBpict1(datePath.toString() + "/s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				//비율
				double ratio = 3;
				//넓이 높이
				int weight = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				Thumbnails.of(saveFile).size(weight, height).toFile(thumnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}	
		
		
		ResponseEntity<List<KnowhowVO>> result = new ResponseEntity<List<KnowhowVO>>(list, HttpStatus.OK);
		System.out.println("result  : " + result);
		//System.out.println("list : " + list);
		return result;
	}
	
		//Summernote API 사용시 업로드된 이미지 파일정보 받아오는 ajax
		@RequestMapping(value="/uploadSummernoteImageFile.do", produces="application/json; charset=utf-8")
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
			JsonObject jsonObject = new JsonObject();
			
			
			String fileRoot = "c:\\summernote_image\\";  //외부경로로 저장을 희망할 때 
			
			
			//내부경로로 저장
//			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//			System.out.println("contextRoot : " + contextRoot);
			//String fileRoot = contextRoot + "resource/fileupload/";
			
			System.out.println("fileRoot : " + fileRoot);
			
			String originalFileName = multipartFile.getOriginalFilename();  //오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));  //파일 확장자
			String savedFileName = UUID.randomUUID() + extension;  //저장될 파일명
			File targetFile = new File(fileRoot + savedFileName);
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);  //파일저장
				// contextroot + resources + 저장할 내부 폴더명
				//jsonObject.addProperty("url", contextRoot+"resource/fileupload"+savedFileName);
				jsonObject.addProperty("url", "/summernote_image/"+savedFileName);
				jsonObject.addProperty("responseCode", "success");
				
			} catch (IOException e){
				FileUtils.deleteQuietly(targetFile);  //저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			System.out.println("jsonObject : " + a);
			return a;
		}
}








