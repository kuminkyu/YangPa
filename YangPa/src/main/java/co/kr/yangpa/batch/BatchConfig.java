package co.kr.yangpa.batch;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration // 설정파일 등록 // 스프링 부팅시에 로딩되는 파일
@EnableScheduling // 스케줄러 사용 등록
public class BatchConfig {
	
	@Bean // 자동으로 객체 생성
	public BatchController createBatchController() {
		
		return new BatchController();
	}

}
