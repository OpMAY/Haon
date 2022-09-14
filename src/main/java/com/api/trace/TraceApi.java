package com.api.trace;

import com.transfer.ProtocolBuilder;
import com.transfer.ProtocolBuilderHelper;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

@Slf4j
public class TraceApi {
    private static final String SERVICE_KEY = "navZSiGlAISRynqdYKsv5Nq%2BnXtZ4RV0pv%2FxFXbyTfgJce5UroOiCsafnkxfTYe1YXuTAB1qHNHUgkFLgNw7MQ%3D%3D";
    private static final String API_URL = "http://data.ekape.or.kr/openapi-data/service/user/animalTrace/traceNoSearch";

    public static void main(String[] args) throws IOException {
//        HashMap<String, Object> params = new HashMap<>();
//        params.put(URLEncoder.encode("serviceKey", "UTF-8"), SERVICE_KEY);
//        params.put(URLEncoder.encode("traceNo", "UTF-8"), URLEncoder.encode("L01709271277007t", "UTF-8"));
//        params.put(URLEncoder.encode("optionNo", "UTF-8"), URLEncoder.encode("9", "UTF-8"));
//        params.put(URLEncoder.encode("corpNo", "UTF-8"), URLEncoder.encode("1178522046", "UTF-8"));
//        StringBuilder stringBuilder = ProtocolBuilderHelper.setGetMethodParams(params);
//        ProtocolBuilder protocolBuilder = new ProtocolBuilder().setRequestMethod("GET").url(API_URL + stringBuilder).conn();
//        TraceResponse response = protocolBuilder.openXmlReader("UTF-8", TraceResponse.class, true);
//        log.info("res : {}", response);
        StringBuilder urlBuilder = new StringBuilder("http://data.ekape.or.kr/openapi-data/service/user/animalTrace/traceNoSearch"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=navZSiGlAISRynqdYKsv5Nq%2BnXtZ4RV0pv%2FxFXbyTfgJce5UroOiCsafnkxfTYe1YXuTAB1qHNHUgkFLgNw7MQ%3D%3D" + URLEncoder.encode("", "UTF-8")); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("traceNo", "UTF-8") + "=" + URLEncoder.encode("L01709271277007t", "UTF-8")); /*개체/이력/묶음번호*/
        urlBuilder.append("&" + URLEncoder.encode("optionNo", "UTF-8") + "=" + URLEncoder.encode("9", "UTF-8")); /*조회하려는 정보 옵션값 1~7 : 개체/이력, 8~9 : 묶음 1 : 개체(소), 사육(돼지) 2 : 출생 등 신고(소) 3 : 도축(소/돼지) 4 : 포장(소/돼지) 5 : 구제역백신(소) 6 : 질병정보(소) 7 : 브루셀라(소) 8 : 묶음 기본정보(묶음) 9 : 묶음구성내역(묶음)*/
        urlBuilder.append("&" + URLEncoder.encode("corpNo", "UTF-8") + "=" + URLEncoder.encode("1178522046", "UTF-8")); /*묶음을 구성한 업소의 사업자 번호*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        JSONObject json = XML.toJSONObject(sb.toString());
        String jsonStr = json.toString(4);
        System.out.println(sb.toString());
        System.out.println(jsonStr);
    }
}
