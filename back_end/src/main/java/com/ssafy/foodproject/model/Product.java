package com.ssafy.foodproject.model;

public class Product {
	int diplay;
	String title;
	String link;
	String image;
	int lprice;
	String mallName;

	public Product(int diplay, String title, String link, String image, int lprice, String mallName) {
		super();
		this.diplay = diplay;
		this.title = title;
		this.link = link;
		this.image = image;
		this.lprice = lprice;
		this.mallName = mallName;
	}

	public int getDiplay() {
		return diplay;
	}

	public void setDiplay(int diplay) {
		this.diplay = diplay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getLprice() {
		return lprice;
	}

	public void setLprice(int lprice) {
		this.lprice = lprice;
	}

	public String getMallName() {
		return mallName;
	}

	public void setMallName(String mallName) {
		this.mallName = mallName;
	}

}