package com.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Agree {
    private boolean marketing_agree;
    private boolean community_kakao_alarm;
    private boolean community_email_alarm;
    private boolean comment_kakao_alarm;
    private boolean comment_email_alarm;
    private boolean service_kakao_alarm;
    private boolean service_email_alarm;
    private LocalDateTime marketing_agree_date;

    private Boolean over_age_agree;
    private Boolean service_agree;
    private Boolean privacy_collect_agree;
    private Boolean privacy_advertise_agree;
}
