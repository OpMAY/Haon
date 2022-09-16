package com.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.model.common.MFile;
import com.model.common.Time;
import com.model.grant.GRANT_TYPE;
import com.model.jwt.RootUser;
import lombok.*;

import java.time.LocalDateTime;

@RequiredArgsConstructor
@Data
@AllArgsConstructor
@JsonIgnoreProperties
@ToString(callSuper = true)
public class User extends RootUser {
    private String name;
    private GRANT_TYPE grant = GRANT_TYPE.USER;
    private MFile profile_img;
    private Agree agree;
    private boolean marketing_agree;
    private LocalDateTime marketing_agree_date;
    private boolean community_kakao_alarm;
    private boolean community_email_alarm;
    private boolean comment_kakao_alarm;
    private boolean comment_email_alarm;
    private boolean service_kakao_alarm;
    private boolean service_email_alarm;
}
