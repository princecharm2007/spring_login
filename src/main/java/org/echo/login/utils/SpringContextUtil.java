package org.echo.login.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


/**
 * Created by Echo on 2015/8/23.
 */
public class SpringContextUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
    @Override
    public  void setApplicationContext(ApplicationContext applicationContext)throws BeansException{

        SpringContextUtil.applicationContext = applicationContext;
    }

    public static  Object getBean(String name)throws BeansException{

        return applicationContext.getBean(name);
    }

}
