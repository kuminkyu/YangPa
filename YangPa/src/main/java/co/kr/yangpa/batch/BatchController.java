package co.kr.yangpa.batch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;


public class BatchController {

	@Autowired
	private BatchService service;
	
	private static final Logger logger
	= LoggerFactory.getLogger(BatchController.class);
	
	//초 분 시 일 월 요일 년도
	@Scheduled( cron = "59 59 23 * * *")
	public void updateState() {
		logger.info("배치 실행 완료");
		int successCnt = service.updateState();
		
	}//updateState
	
}//class
