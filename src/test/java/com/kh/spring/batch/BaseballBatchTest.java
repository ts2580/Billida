package com.kh.spring.batch;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.spring.common.batch.BatchRepository;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class BaseballBatchTest {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BatchRepository batchRepository;
	
	@Test
	public void jsoupTest() throws IOException{
		
		Document doc = Jsoup.connect("https://www.koreabaseball.com/TeamRank/TeamRank.aspx").get(); //받아올 html document주소 입력
		//logger.debug(doc.toString());
		Elements teamList = doc.select("#cphContents_cphContents_cphContents_udpRecord > table > tbody > tr"); //css선택자를 사용한 요소 선택
		
		String[] keyArr = {"rank", "name","game", "win", "lose", "tie"};
		List<Map<String,String>> dataList = new ArrayList<>();
		
		for (Element team : teamList) {
			Elements datas = team.getElementsByTag("td"); //td태그들 꺼내오기
			Map<String,String> data = new HashMap<>();
			
			for (int i = 0; i < 6; i++) { //앞에서 6개의 데이터만 받아오려고
				data.put(keyArr[i], datas.get(i).text()); //맵에 키,밸류로 넣어줌
			}
			
			dataList.add(data);
		}
		
		for (Map<String, String> map : dataList) {
			//logger.debug(map.toString());
			batchRepository.insertBaseballRank(map);
		}
	}

}
