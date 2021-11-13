package com.projectQ.conf.common.base;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.goods.vo.ImageFileVO;

public abstract class baseController {
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	
	// 경로에 파일 저장하기 , 상속시에만!!
	protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception{
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName); // 파일 타입저장
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName); // 파일 이름저장
			fileList.add(imageFileVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if(mFile.getSize() != 0) { //파일 사이즈가 0이 아니면!!
				if(! file.exists()) {    // 파일이 존재하지 않으면 
					if(file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); // 이후 파일 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName));
			}
			
		}
		return fileList;
	}
	
	// 파일 삭제 클래스
	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
		try {
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// *.do로 끝나는 모든 request(요청) 처리하는 클래스(모듈) , 상속시에만!!
	@RequestMapping(value="/*.do" , method = {RequestMethod.GET,RequestMethod.POST})
	protected ModelAndView viewForm(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	// 날짜계산 클래스
	protected String calcSearchPeriod(String fixedSearchPeriod) {
		
		String beginDate = null;
		String endDate = null;
		String endYear = null;
		String endMonth = null;
		String endDay = null;
		String beginYear = null;
		String beginMonth = null;
		String beginDay = null;
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal = Calendar.getInstance(); //달력 API
		
		endYear = Integer.toString(cal.get(Calendar.YEAR));
		endMonth = df.format(cal.get(Calendar.MONTH) + 1);
		endDay = df.format(cal.get(Calendar.DATE));
		endDate = endYear + "-" + endMonth + "-" + endDay;
		
		if(fixedSearchPeriod == null) {
			cal.add(cal.MONTH, -4);
		} else if(fixedSearchPeriod.equals("one_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -7);
		} else if(fixedSearchPeriod.equals("two_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -14);
		} else if(fixedSearchPeriod.equals("one_month")) {
			cal.add(cal.MONTH, -1);
		} else if(fixedSearchPeriod.equals("two_month")) {
			cal.add(cal.MONTH, -2);
		} else if(fixedSearchPeriod.equals("three_month")) {
			cal.add(cal.MONTH, -3);
		} else if(fixedSearchPeriod.equals("four_month")) {
			cal.add(cal.MONTH, -4);
		}
		
		beginYear = Integer.toString(cal.get(Calendar.YEAR));
		beginMonth = df.format(cal.get(Calendar.MONTH) + 1);
		beginDay = df.format(cal.get(Calendar.DATE));
		beginDate = beginYear + "-" + beginMonth + "-" + beginDay;
		
		return beginDate+","+endDate;
	}

}
