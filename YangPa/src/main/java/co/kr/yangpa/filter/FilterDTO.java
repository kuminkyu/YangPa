package co.kr.yangpa.filter;


public class FilterDTO {
	//필터에서 받아온 변수들
	private String bun;//분류
	private String largelist;//시 도 구분
	private String middlelist;//구 군 구분
	private String minprice;//최소가격
	private String maxprice;//최대가격
	private String useday;//사용날짜
	private String kind;//운동 회원권 , 정기권 같은것
	private String[] where;
	private String[] option;//옵션들

	
	public String[] getWhere() {
		return where;
	}
	public void setWhere(String[] where) {
		this.where = where;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getUseday() {
		return useday;
	}
	public void setUseday(String useday) {
		this.useday = useday;
	}
	public String getBun() {
		return bun;
	}
	public void setBun(String bun) {
		this.bun = bun;
	}
	public String getLargelist() {
		return largelist;
	}
	public void setLargelist(String largelist) {
		this.largelist = largelist;
	}
	public String getMiddlelist() {
		return middlelist;
	}
	public void setMiddlelist(String middlelist) {
		this.middlelist = middlelist;
	}
	public String getMinprice() {
		return minprice;
	}
	public void setMinprice(String minprice) {
		this.minprice = minprice;
	}
	public String getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}
	public String[] getOption() {
		return option;
	}
	public void setOption(String[] option) {
		this.option = option;
	}


	
}
