package com.kh.billida.main;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.amazonaws.util.json.JSONArray;
import com.amazonaws.util.json.JSONException;
import com.amazonaws.util.json.JSONObject;
import com.kh.billida.main.model.dto.Main;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class MainControllerTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//MockMvc : http 요청 및 응답 상황 테스트를 위한 객체
	@Autowired //의존성 주입받기
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Autowired
	private MainRepositoryTest mainRepositoryTest;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void mainlist() throws Exception{
		Main main = new Main();
		main.setLockerId(2);
		main.setUserCode("1");
		main.setLockerTitle("testLock");
		main.setLockerContent("seoulo");
		main.setLockerSize("M");
		main.setLockerPassword(1234);
		main.setLocation("seoul");
		main.setLatitude("212.33");
		main.setLongitude("12.3333");
		
		mockMvc.perform(get("/")
				.sessionAttr("mainList", main))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void insertWithDto() throws Exception{
		LocalDate targetDate = LocalDate.of(2021, 12, 25);
		
		Main main = new Main();
		main.setUserCode("1");
		main.setLockerTitle("testLocker4");
		main.setLockerContent("seoulo");
		main.setLockerSize("M");
		main.setLockerPassword(1234);
		main.setLatitude("212.33");
		main.setLongitude("12.3333");
		main.setRentableDate(targetDate);
		
		mainRepositoryTest.insertWithDto(main);
	}
	
	@Test
	public void insertDummyApi() throws IOException, JSONException {
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_female_safety_hdrycstdyplace_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=qt0%2BUr8fKiB4cFa0dxYrRkBZevm3bNeJx6NS9zc0jthKuFEFJan2kVokNKzCHQhrgb%2Bvj9Y7lxmfWreKIzMKSA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("80", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
        urlBuilder.append("&" + URLEncoder.encode("ctprvnNm","UTF-8") + "=" + URLEncoder.encode("서울특별시", "UTF-8")); /*시도명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        JSONObject jObject = new JSONObject(sb.toString());
        JSONObject jsonResponse = jObject.getJSONObject("response").getJSONObject("body");
		JSONArray jArray = null;
		jArray = jsonResponse.getJSONArray("items");
		System.out.println(jArray.toString());
		
		//fcltyNm시설명
		//rdnmadr 도로명주소
		//lnmadr 지번주소(~동)
		//latitude 위도
		//longitude 경도
		//insttCode 제공기관 코드(비번으로 넣을까?)
		String name;
		String roadAd;
		String address;
		String latitude;
		String longitude;
		int password;
		//String size;
		LocalDate targetDate = LocalDate.of(2021, 12, 25);
		
		Main main = new Main();
	
		File file = new File("C:/CODE/imgUrl.txt");
		FileReader fileReader = new FileReader(file);
		BufferedReader bufReader = new BufferedReader(fileReader);
		List<String> urlList = new ArrayList<String>();
				
		String str = "";
        while((str = bufReader.readLine()) != null){
            urlList.add(str);
        }
        bufReader.close();
        
		for (int i = 0; i < 80; i++) {
			JSONObject obj = jArray.getJSONObject(i);
			
			name = obj.getString("fcltyNm");
			roadAd = obj.getString("rdnmadr");
			address = obj.getString("lnmadr");
			latitude = obj.getString("latitude");
			longitude = obj.getString("longitude");
			password = obj.getInt("insttCode");
			//size = obj.getString("boxHg");
			System.out.println(name+","+roadAd+","+address+","+latitude+","+longitude+","+password);
			
			//main.setUserCode("1");
			main.setLockerTitle(name);
			main.setLockerContent(roadAd);
			main.setLocation(address);
			main.setLatitude(latitude);
			main.setLongitude(longitude);
			main.setLockerPassword(password);
			main.setRentableDate(targetDate);
			main.setLockerSize("L");
			main.setLockerImage(urlList.get(i));
			
			mainRepositoryTest.insertDummyApi(main);	
		}
	}
	
	@Test
	public void fileread() throws IOException {
		File file = new File("C:/CODE/imgUrl.txt");
		FileReader fileReader = new FileReader(file);
		BufferedReader bufReader = new BufferedReader(fileReader);
		
		List<String> urlList = new ArrayList<String>();
				
		String str = "";
        while((str = bufReader.readLine()) != null){
            urlList.add(str);
        }
        
        System.out.println("0번 인덱스 : " + urlList.get(0));
        bufReader.close();
	}
	
	@Test
	public void selectLockers() {
		List<Main> lockers = mainRepositoryTest.lockers();
	}

	@Test
	public void searchLockers() {
		List<Main> searchLockers = mainRepositoryTest.searchLockers("성동");
		System.out.println(searchLockers);
	}
	
	
	@Test
	public void listAll() {
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
