package co.kr.yangpa.board;

public class BoardDTO {
	
	private String bno;//게시글번호
	private String writer;//작성자
	private String type;//스키 헬스 모텔 호텔 등등
	private String title;//제목
	private String contents;//내용
	private String price;//가격
	private String state;//상태 판매, 판매완료
	private String write_date;//작성일
	private String view_cnt;//조회수
	private String addrcode;// 지역코드
	private String addrname;// 지역 이름 구 군
	private String addrname2;// 지역 이름 시  이름
	private String typename;
	private int reqNum;
	
	public int getReqNum() {
		return reqNum;
	}
	public void setReqNum(int reqNum) {
		this.reqNum = reqNum;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getChangeBf() {
		return changeBf;
	}
	public void setChangeBf(String changeBf) {
		this.changeBf = changeBf;
	}
	public String getChangeAf() {
		return changeAf;
	}
	public void setChangeAf(String changeAf) {
		this.changeAf = changeAf;
	}
	
	//업데이트시 바뀌기전 유형 바뀐 유형 체크
	private String changeBf;
	private String changeAf;
	
	public String getAddrname2() {
		return addrname2;
	}
	public void setAddrname2(String addrname2) {
		this.addrname2 = addrname2;
	}
	private String addrdetail;// 지역 이름
	private String addrgps;// 지역 좌표
	
	private String in_tel;
	
	public String getIn_tel() {
		return in_tel;
	}
	public void setIn_tel(String in_tel) {
		this.in_tel = in_tel;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getAddrgps() {
		return addrgps;
	}
	public void setAddrgps(String addrgps) {
		this.addrgps = addrgps;
	}
	private String useday;// 사용일 , 남은사용회수
	private String buy_type;
	
	private String option_name;//option을 db에서 받아오기위한 변수(게시판이랑 상관이 없음)
	private String option_code;//option_code을 db에서 받아오기위한 변수(게시판이랑 상관이 없음)
	
	public String getOption_code() {
		return option_code;
	}
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
	
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getBuy_type() {
		return buy_type;
	}
	public void setBuy_type(String buy_type) {
		this.buy_type = buy_type;
	}
	public String getUseday() {
		return useday;
	}
	public void setUseday(String useday) {
		this.useday = useday;
	}
	
	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getAddrcode() {
		return addrcode;
	}
	public void setAddrcode(String addrcode) {
		this.addrcode = addrcode;
	}
	
	
}
