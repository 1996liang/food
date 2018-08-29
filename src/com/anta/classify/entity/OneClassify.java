package com.anta.classify.entity;

import java.util.HashSet;
import java.util.Set;

public class OneClassify {
	private Integer id;
	private String name;
	private String imageLabel;
	private Set<TwoClassify> twoClassifys = new HashSet<TwoClassify>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageLabel() {
		return imageLabel;
	}
	public void setImageLabel(String imageLabel) {
		this.imageLabel = imageLabel;
	}
	public Set<TwoClassify> getTwoClassifys() {
		return twoClassifys;
	}
	public void setTwoClassifys(Set<TwoClassify> twoClassifys) {
		this.twoClassifys = twoClassifys;
	}
	
}
