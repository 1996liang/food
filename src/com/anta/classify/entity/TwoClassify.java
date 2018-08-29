package com.anta.classify.entity;

import java.util.HashSet;
import java.util.Set;

public class TwoClassify {
	private Integer id;
	private String name;
	private OneClassify oneClassify;
	private Set<ThreeClassify> threeClassifys = new HashSet<ThreeClassify>();
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
	public OneClassify getOneClassify() {
		return oneClassify;
	}
	public void setOneClassify(OneClassify oneClassify) {
		this.oneClassify = oneClassify;
	}
	public Set<ThreeClassify> getThreeClassifys() {
		return threeClassifys;
	}
	public void setThreeClassifys(Set<ThreeClassify> threeClassifys) {
		this.threeClassifys = threeClassifys;
	}
	
	
}
