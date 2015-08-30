package org.echo.login;

import org.echo.login.bean.User;
import org.echo.login.dao.UserDao;
import org.echo.login.utils.SpringContextUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Echo on 2015/8/27.
 */
@Controller
public class Register {
    @RequestMapping(value="/register",method = RequestMethod.GET)
    public String register(HttpSession httpSession){
        String name =(String) httpSession.getAttribute("name");
        if(name != null){
            return "success";
        }

        return "register";
    }
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String registerCheck(@ModelAttribute User newUser,ModelMap map,HttpSession httpSession){
        if(newUser == null){
            map.addAttribute("Message","register fail!");
            return "status";
        }
        UserDao userDao = (UserDao) SpringContextUtil.getBean("userJDBCTemplate");
        if(userDao.judge(newUser) != userDao.NOUSER){
            map.addAttribute("Message","Username existence");
            httpSession.setAttribute("name",newUser.getName());
            return "status";
        }
        userDao.create(newUser);
        httpSession.setAttribute("name",newUser.getName());
        map.addAttribute("Message","success");
        return "status";
    }
    @RequestMapping(value="/codecheck")
    public String codeCheck(HttpServletRequest request,HttpSession session,ModelMap map){
        String code = (String)request.getParameter("code");

        if(code != null && code.equals(session.getAttribute("code"))){
            map.addAttribute("Message","success");
            return "status";
        }
        String message = "you code is "+code+",but we code is "+session.getAttribute("code");
        map.addAttribute("Message",message);
        return "status";
    }
}
