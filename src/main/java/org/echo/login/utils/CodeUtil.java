package org.echo.login.utils;

import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by Echo on 2015/8/28.
 * 1.create code and codeimage
 *
 */
@Controller
public class CodeUtil {
    private Producer captchaProducer = null;

    @Autowired
    public void setCaptchaProducer(Producer captchaProducer){
        this.captchaProducer = captchaProducer;
    }
    @RequestMapping(value="/codeimg")
    public void createCodeImage(HttpServletRequest request,
                                HttpServletResponse response,HttpSession session)
                                    throws IOException{
        response.setContentType("image/jpeg");


        String capText =captchaProducer.createText();
        session.setAttribute("code",capText);
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi,"jpg",out);
        try{
            out.flush();
        }finally{
            out.close();
        }
    }
}
