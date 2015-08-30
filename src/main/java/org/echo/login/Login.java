package org.echo.login;

import org.echo.login.bean.LoginUser;
import org.echo.login.bean.User;
import org.echo.login.dao.UserDao;
import org.echo.login.dao.UserJDBCTemplate;
import org.echo.login.utils.SpringContextUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by Echo on 2015/8/18.
 */
@Controller
public class Login {
    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String login(HttpSession session){
        if(session.getAttribute("name") != null){
            return "redirect:success";
        }
        session.setAttribute("check","ok");
        return "login";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String login_check(@ModelAttribute LoginUser loginUser,ModelMap map,HttpSession session){
        if(session.getAttribute("check") == null){
            return "redirect:login";
        }
        if(session.getAttribute("name") != null){
            map.put("Message","success");
            return "status";
        }
        if(loginUser == null || loginUser.getName() == "" || loginUser.getName()==null){
            map.put("Message","UnknownError");
            return "status";
        }
        User user = (User) SpringContextUtil.getBean("user");
        user.setName(loginUser.getName());
        user.setPassword(loginUser.getPassword());
        UserDao userDao = (UserJDBCTemplate)SpringContextUtil.getBean("userJDBCTemplate");
        int result = userDao.judge(user);
        if(result == userDao.NOUSER){
            String aimName = "'"+user.getName()+"'";
            map.put("Message","The username "+aimName+" not exit!please register first");
            return "status";
        }
        else if(result == userDao.PASSWORDERROR){
            map.put("Message","Password Error!");
            return "status";
        }
        else if(result == userDao.SUCCEED){
            session.setAttribute("name", user.getName());
            map.put("Message","success");
            return "status";
        }
        map.put("Message","Unknown Error");
        return "status";
    }

    @RequestMapping(value="/success")
    public String success(ModelMap map,HttpSession session){
       String name = (String)session.getAttribute("name");
        if(name == null){
            return "redirect:login";
        }
        return "success";
    }
    @RequestMapping(value="/allusers")
    public String get_all(ModelMap map){
        UserJDBCTemplate jdbcTemplate =
                (UserJDBCTemplate)SpringContextUtil.getBean("userJDBCTemplate");
        List<User> users = jdbcTemplate.getAll();
        int num = users.size();
        map.addAttribute("users",users);
        map.addAttribute("size",new Integer(num));
        return "allusers";
    }




}
