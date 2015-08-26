package org.echo.login.dao;

import org.echo.login.bean.User;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Echo on 2015/8/20.
 */
public interface UserDao {
     static final int UNKNOWNERROR =-1;
     static final int NOUSER = 0;
     static final int PASSWORDERROR = 1;
     static final int SUCCEED = 2;

     void setDataSource(DataSource ds);
     int judge(User u);
     boolean create(User u);
     List<User> getAll();
}
