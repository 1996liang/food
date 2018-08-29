package com.anta.entity;

public class FastMail {
	private Integer id;
	private String fastMailBrand;
	private String fastMailImage;
	
	public String getFastMailImage() {
		return fastMailImage;
	}
	public void setFastMailImage(String fastMailImage) {
		this.fastMailImage = fastMailImage;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFastMailBrand() {
		return fastMailBrand;
	}
	public void setFastMailBrand(String fastMailBrand) {
		this.fastMailBrand = fastMailBrand;
	}
	
}
