package com.choa.t5;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	
	private String id;
	private MultipartFile pic;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MultipartFile getPic() {
		return pic;
	}
	public void setPic(MultipartFile pic) {
		this.pic = pic;
	}

	
}
