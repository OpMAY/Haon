package com.api.trace;

import com.api.trace.response.TraceResponse;
import com.transfer.ProtocolBuilder;
import com.transfer.ProtocolBuilderHelper;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

@Slf4j
public class TraceApi {
    private static final String SERVICE_KEY = "navZSiGlAISRynqdYKsv5Nq%2BnXtZ4RV0pv%2FxFXbyTfgJce5UroOiCsafnkxfTYe1YXuTAB1qHNHUgkFLgNw7MQ%3D%3D";
    private static final String API_URL = "http://data.ekape.or.kr/openapi-data/service/user/animalTrace/traceNoSearch";

    public static void main(String[] args) throws IOException {
        System.out.println(checkFarmUniqueNoValid("211058", ""));
    }

    public static boolean checkFarmUniqueNoValid(String farm_unique_no, String code) throws IOException {
        AtomicBoolean is_exist = new AtomicBoolean(false);
        HashMap<String, Object> params = new HashMap<>();
        params.put("farm_unique_no", farm_unique_no);
        params.put("farmer_nm", "");
        params.put("searchFlag", "0022");
        params.put("gubun", "S");
        params.put("pageNo", "1");
        ProtocolBuilder protocolBuilder =
                new ProtocolBuilder()
                        .url("https://mtrace.go.kr/farm/farmUniqueNoSearch.do")
                        .conn()
                        .setRequestMethod("POST")
                        .setDoOutput(true)
                        .openWriter(params);

        String result_html = protocolBuilder.openReader("UTF-8", true);
        Document doc = Jsoup.parse(result_html);
        Elements elements = doc.select("tbody[name=\"tb\"]");
        elements.first().forEach(element -> {
            if (element.is("tr")) {
                System.out.println("element : " + element);
                if(element.childrenSize() == 5) {
                    is_exist.set(true);
                }
            }
        });
        return is_exist.get();
    }

    public static TraceResponse apiRequest(String traceNo) {
        try {
            HashMap<String, Object> params = new HashMap<>();
            params.put(URLEncoder.encode("serviceKey", "UTF-8"), SERVICE_KEY);
            params.put(URLEncoder.encode("traceNo", "UTF-8"), URLEncoder.encode(traceNo, "UTF-8"));
            params.put(URLEncoder.encode("optionNo", "UTF-8"), URLEncoder.encode("", "UTF-8"));
            params.put(URLEncoder.encode("corpNo", "UTF-8"), URLEncoder.encode("", "UTF-8"));
            StringBuilder stringBuilder = ProtocolBuilderHelper.setGetMethodParams(params);
            ProtocolBuilder protocolBuilder = new ProtocolBuilder().url(API_URL + stringBuilder).conn().setRequestMethod("GET");
            TraceResponse response = protocolBuilder.openXmlReader("UTF-8", TraceResponse.class, false);
            return response;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
