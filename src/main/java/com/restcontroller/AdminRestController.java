package com.restcontroller;

import com.api.sns.kakao.KakaoAPI;
import com.model.content.common.COMMENT_TYPE;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
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
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/api")
public class AdminRestController {
    private final AdminService adminService;

    @RequestMapping(value = "/category/remove/{type}/{category}", method = RequestMethod.POST)
    public ResponseEntity removeCategory(HttpServletRequest request, @PathVariable String category, @PathVariable CATEGORY_TYPE type) {
        Message message = new Message();
        CommunityCategory communityCategory = null;
        ArrayList<String> categories = new ArrayList<>();
        communityCategory = adminService.getCommunityCategory(type);
        if (communityCategory != null) {
            categories = (ArrayList<String>) communityCategory.getCategories();
            categories.remove(category.trim());
            communityCategory.setCategories(categories);
            adminService.updateCategory(communityCategory);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/category/add/{type}/{category}", method = RequestMethod.POST)
    public ResponseEntity addCategory(HttpServletRequest request, @PathVariable String category, @PathVariable CATEGORY_TYPE type) {
        Message message = new Message();
        log.info("{},{}", category, type);
        CommunityCategory communityCategory = null;
        ArrayList<String> categories = new ArrayList<>();

        communityCategory = adminService.getCommunityCategory(type);
        log.info(communityCategory.toString());
        if (communityCategory != null) {
            categories = (ArrayList<String>) communityCategory.getCategories();
            categories.add(category.trim());
            communityCategory.setCategories(categories);
            adminService.updateCategory(communityCategory);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/keyword/remove/{type}/{keyword}", method = RequestMethod.POST)
    public ResponseEntity removeKeyword(HttpServletRequest request, @PathVariable String keyword, @PathVariable String type) {
        Message message = new Message();
        SearchKeyword searchKeyword = null;
        ArrayList<String> keywords = new ArrayList<>();
        switch (type) {
            case "RECOMMEND":
                searchKeyword = adminService.getAllKeywords().get(0);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.remove(keyword.trim());
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            case "SEARCH":
                searchKeyword = adminService.getAllKeywords().get(1);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.remove(keyword.trim());
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

    @RequestMapping(value = "/keyword/add/{type}/{keyword}", method = RequestMethod.POST)
    public ResponseEntity addKeyword(HttpServletRequest request, @PathVariable String keyword, @PathVariable String type) {
        Message message = new Message();
        SearchKeyword searchKeyword = null;
        ArrayList<String> keywords = new ArrayList<>();
        switch (type) {
            case "RECOMMEND":
                searchKeyword = adminService.getAllKeywords().get(0);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.add(keyword.trim());
                searchKeyword.setKeywords(keywords);
                adminService.updateSearchKeyword(searchKeyword);
                message.put("status", true);
                break;
            case "SEARCH":
                searchKeyword = adminService.getAllKeywords().get(1);
                keywords = (ArrayList<String>) searchKeyword.getKeywords();
                keywords.add(keyword.trim());
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

    @RequestMapping(value = "/delete/{type}/{board_no}", method = RequestMethod.POST)
    public ResponseEntity deleteCommunity(HttpServletRequest request, @PathVariable int board_no, @PathVariable COMMENT_TYPE type) {
        Message message = new Message();
        switch (type) {
            case BOARD:
                adminService.deleteBoard(board_no);
                break;
            case QUESTION:
                break;
            case TIP:
                break;
            case MANUAL:
                break;
            case MAGAZINE:
                break;
        }
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{_type}/{type}/{comment_no}", method = RequestMethod.POST)
    public ResponseEntity blockReview(HttpServletRequest request, @PathVariable String _type, @PathVariable int comment_no, @PathVariable COMMENT_TYPE type) {
        Message message = new Message();
        if (_type.equals("LOCK")) {
            switch (type) {
                case BOARD:
                    adminService.updateBoardBlockByCommentNo(comment_no, true);
                    break;
                case QUESTION:
                    adminService.updateQuestionBlockByCommentNo(comment_no, true);
                    break;
                case TIP:
                    adminService.updateTipBlockByCommentNo(comment_no, true);
                    break;
                case MANUAL:
                    adminService.updateManualBlockByCommentNo(comment_no, true);
                    break;
                case MAGAZINE:
                    adminService.updateMagazineBlockByCommentNo(comment_no, true);
                    break;
                case FARM:
                    adminService.updateFarmBlockByCommentNo(comment_no, true);
                    break;
            }
        } else {
            switch (type) {
                case BOARD:
                    adminService.updateBoardBlockByCommentNo(comment_no, false);
                    break;
                case QUESTION:
                    adminService.updateQuestionBlockByCommentNo(comment_no, false);
                    break;
                case TIP:
                    adminService.updateTipBlockByCommentNo(comment_no, false);
                    break;
                case MANUAL:
                    adminService.updateManualBlockByCommentNo(comment_no, false);
                    break;
                case MAGAZINE:
                    adminService.updateMagazineBlockByCommentNo(comment_no, false);
                    break;
                case FARM:
                    adminService.updateFarmBlockByCommentNo(comment_no, false);
                    break;
            }
        }
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}
