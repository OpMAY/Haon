package com.restcontroller;

import com.api.sns.kakao.KakaoAPI;
import com.model.global.keyword.SearchKeyword;
import com.response.DefaultRes;
import com.response.Message;
import com.service.AdminService;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/api")
public class AdminRestController {
    private final AdminService adminService;

    @RequestMapping(value = "/remove/{type}/{keyword}", method = RequestMethod.POST)
    public ResponseEntity removeKeyword(HttpServletRequest request, @PathVariable String keyword, @PathVariable String type) {
        Message message = new Message();
        SearchKeyword searchKeyword = null;
        ArrayList<String> keywords = new ArrayList<>();
        switch (type) {
            case "RECOMMEND":
                searchKeyword = adminService.getAllKeywords().get(0);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.stream().filter((search_keyword) -> {
                    if (search_keyword.equals(keyword)) {
                        return false;
                    }
                    return true;
                });
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            case "SEARCH":
                searchKeyword = adminService.getAllKeywords().get(1);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.stream().filter((search_keyword) -> {
                    if (search_keyword.equals(keyword)) {
                        return false;
                    }
                    return true;
                });
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            default:
                message.put("status", false);
                message.put("message", "검색 타입이 다릅니다.");
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/add/{type}/{keyword}", method = RequestMethod.POST)
    public ResponseEntity addKeyword(HttpServletRequest request, @PathVariable String keyword, @PathVariable String type) {
        Message message = new Message();
        SearchKeyword searchKeyword = null;
        ArrayList<String> keywords = new ArrayList<>();
        switch (type) {
            case "RECOMMEND":
                searchKeyword = adminService.getAllKeywords().get(0);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.add(keyword);
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            case "SEARCH":
                searchKeyword = adminService.getAllKeywords().get(1);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.add(keyword);
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            default:
                message.put("status", false);
                message.put("message", "검색 타입이 다릅니다.");
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/delete/banner/{banner_no}", method = RequestMethod.POST)
    public ResponseEntity deleteBanner(HttpServletRequest request, @PathVariable int banner_no) {
        Message message = new Message();
        adminService.removeBanner(banner_no);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}
