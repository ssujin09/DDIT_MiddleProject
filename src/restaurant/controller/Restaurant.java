package restaurant.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import meeting.vo.MeetingVO;
import restaurant.service.RestaurantService;
import restaurant.service.RestaurantServiceImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

@WebServlet("/restaurantDetail.do")
public class Restaurant extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int rstrntCode = Integer.parseInt(req.getParameter("rstrntCode"));
		RestaurantService restaurantService = RestaurantServiceImpl.getInstance();

		RestaurantVO rv = restaurantService.displayDeatils(rstrntCode);

		//////////////////////////////////////////////////////////////////

		String address = rv.getRstrntAddr();
		String[] addressParts = address.split(" ");

		String local = addressParts[0];

		req.setAttribute("addr", addressParts);

		String localServletURL = "localPage?local=";

		String localLink = "<a href=\"" + localServletURL + "\">" + local + "</a>";

		//////////////////////////////////////////////////////////////////

		BusinessVO bv = restaurantService.displayBsn(rstrntCode);

		//////////////////////////////////////////////////////////////////
		
		List<MenuVO> mv = restaurantService.displayMenu(rstrntCode);
		
		req.setAttribute("restaurant", rv);
		req.setAttribute("localLink", localLink);
		req.setAttribute("bv", bv);
		req.setAttribute("menuList", mv);
		
		
		// 모임 리스트 겟 어트리튜브 부분
		IMeetingService meetingService = MeetingServiceImpl.getInstance();
		List<MeetingVO> meetingList = meetingService.getMeetingList(rstrntCode); 
		req.setAttribute("meetingList", meetingList);

		String clientId = "UHX4_b3xDvYEMiiamTbB"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "N02hwAcfUE"; // 애플리케이션 클라이언트 시크릿

		String text = null;
		try {
			text = URLEncoder.encode(rv.getRstrntName(), "UTF-8"); // 검색어
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text +"&display=5"; // JSON 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		String responseBody = get(apiURL, requestHeaders);

		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(responseBody);

			JSONObject jsonObj = (JSONObject) obj;
			JSONArray jsonArr = (JSONArray) jsonObj.get("items"); // jsonArr 넘겨주기

			req.setAttribute("blog", jsonArr);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		req.getRequestDispatcher("/views/restaurant/restaurant.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 오류 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
		}
	}

}
