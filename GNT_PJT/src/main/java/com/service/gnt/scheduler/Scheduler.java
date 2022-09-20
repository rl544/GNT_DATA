package com.service.gnt.scheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
@Component
public class Scheduler {
	private int count = 0;
	/*
	각 자리는 초, 분, 시, 일, 월, 요일 입니다.
	"0 0 * * * *" = the top of every hour of every day.
	"* * * * * *" = 매초 실행 합니다.
	"*\10 * * * * *" = 매 10초마다 실행한다. -- \가 아니라 / (주석처리때문에)
	0 *\1 * * * = 매시간 실행 합니다. -- \가 아니라 / (주석처리때문에)
	"0 0 8-10 * * *" = 매일 8, 9, 10시에 실행한다
	"0 0 6,19 * * *" = 매일 오전 6시, 오후 7시에 실행한다.
	"0 0/30 8-10 * * *" = 8:00, 8:30, 9:00, 9:30, 10:00 and 10:30 every day.
	"0 0 9-17 * * MON-FRI" = 오전 9시부터 오후 5시까지 주중(월~금)에 실행한다.
	"0 0 0 25 12 ?" = every Christmas Day at midnight
	*/
	@Scheduled(cron = "0 0 0 * * *")
	public void doSchedule() {
		System.out.println("count = "+count);
		count++;
	}
}
