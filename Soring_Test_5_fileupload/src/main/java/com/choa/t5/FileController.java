package com.choa.t5;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping(value="/files")
public class FileController {
	
	@RequestMapping(value="/multi_fileup", method=RequestMethod.GET)
	public void multi(){}
	@RequestMapping(value="/multi_fileup", method=RequestMethod.POST)
	public String multi(FilesDTO filesDTO, Model model, HttpSession session){
		for(int i=0;i<filesDTO.getPic().length;i++){
			System.out.println(filesDTO.getPic()[i].getOriginalFilename());
		}
		return "";
	}
	
	@RequestMapping(value="/fileUp3")
	public String fileup(FileDTO fileDTO, HttpSession session){
		System.out.println(fileDTO.getPic().getOriginalFilename());
		
		return "files/result1";
	}
	
	
	
	@RequestMapping(value="/fileUp2")
	public String fileup(MultipartHttpServletRequest mr, Model model, HttpSession session){
	
		String savePath = session.getServletContext().getRealPath("resources/upload");
		MultipartFile mf = mr.getFile("pic");
		UUID uid = UUID.randomUUID();
		String saveName= uid.toString()+"_"+mf.getOriginalFilename();
		byte[] filedata;
		try {
			filedata = mf.getBytes();
			File f = new File(savePath, saveName);
			FileCopyUtils.copy(filedata, f);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("fileName", mf.getOriginalFilename());
		model.addAttribute("saveName", saveName);
		
		return "files/result1";
	}

	@RequestMapping(value="/fileUp1", method=RequestMethod.GET)
	public void fileup(){}
	
	@RequestMapping(value="/fileUp1", method=RequestMethod.POST)
	public String fileup(Model model,@RequestParam("id") String id, @RequestParam("pic") MultipartFile mt, HttpSession session){
		//배포전에 사용하세요 꼭~~
		String savePath = session.getServletContext().getRealPath("resources/upload");
		
		//배포전에 삭제 하세요
		//String savePath="E:\\choa\\spring\\workspace\\Soring_Test_5_fileupload\\src\\main\\webapp\\resources\\upload";
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString();
		System.out.println(saveName);
		saveName=saveName+"_"+mt.getOriginalFilename();
		File f = new File(savePath, saveName);
		try {
			mt.transferTo(f);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("saveName", saveName);
		model.addAttribute("fileName", mt.getOriginalFilename());
		
		return "files/result1";
	}
}










