package org.echo.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Echo on 2015/9/2
 */
@Controller
public class signout {
    @RequestMapping(value="/signout")
    public String signout(HttpSession httpSession){
        if(httpSession.getAttribute("name") != null){
            httpSession.removeAttribute("name");
        }
        return "login";
    }
}
