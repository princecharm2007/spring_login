package org.echo.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

<<<<<<< HEAD
/**
 * Created by Echo on 2015/9/2
 */
=======

>>>>>>> 68fdbbc162772e8a5512322153b67f5bc58621a6
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

/*changer something*/