package org.echo.login.aop;

import javax.servlet.http.HttpSession;

/**
 * Created by Echo on 2015/8/30.
 */
public class SessionNameCheck {
    public String check(HttpSession httpSession){
        if(httpSession.getAttribute("name") != null){
            return "redirect:success";
        }
        return null;
    }
}
