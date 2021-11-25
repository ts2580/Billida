package com.kh.billida.member.common.captcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("test")
public class testController {

	@RequestMapping(value = "captchaImg.do")
    public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaImg(request, response);
    }
    @RequestMapping(value = "captchaAudio.do")
    public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaAudio(request, response);
    }
    @GetMapping("test")
    public void a() {}

}