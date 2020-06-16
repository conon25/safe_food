package com.ssafy.foodproject.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

private static String clientID = "Iprc2jN9EaQtAFZg16hY";
private static String clientSecret = "2dEMFw0mMU";

@Override
public String getProducts(String key) {
// TODO Auto-generated method stub

try {
String text = URLEncoder.encode(key, "UTF-8");
//String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text+"&display=12&start=1"; // xml 결과
URL url = new URL(apiURL);
HttpURLConnection con = (HttpURLConnection)url.openConnection();
con.setRequestMethod("GET");
con.setRequestProperty("X-Naver-Client-Id", clientID);
con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
int responseCode = con.getResponseCode();
BufferedReader br;
if(responseCode==200) { // 정상 호출
br = new BufferedReader(new InputStreamReader(con.getInputStream()));
} else { // 에러 발생
br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
}
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = br.readLine()) != null) {
response.append(inputLine);
}
br.close();
return response.toString();
//System.out.println(response.toString());
} catch (Exception e) {
System.out.println(e);
}
return null;


}
}