package com.anta.classify.entity;

public class ThreeClassify {
	private Integer id;
	private String name;
	private TwoClassify twoClassify;
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
	public void setTwoClassify(TwoClassify twoClassify) {
		this.twoClassify = twoClassify;
	}
	public TwoClassify getTwoClassify() {
		return twoClassify;
	}
	public ThreeClassify() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThreeClassify(Integer id) {
		super();
		this.id = id;
	}
	
}
