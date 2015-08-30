package org.echo.login.dao;

import org.echo.login.bean.User;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

import org.echo.login.bean.UserMapper;

import java.util.List;

/**
 * Created by Echo on 2015/8/20.
 */
public class UserJDBCTemplate implements UserDao {
    private JdbcTemplate jdbcTemplateObject;


    @Override
    //define database config
    public void setDataSource(DataSource dataSource){
        jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override

    public int judge(User u){
        String sql = "select * from user where name=?";
        String name = u.getName();
        String password = u.getPassword();
        User user;
        try{
            user = jdbcTemplateObject.queryForObject(sql,new Object[]{name},new UserMapper());
        }catch(Exception e){
            return NOUSER;
        }

        if(user == null){
            return NOUSER;
        }

        if(password.equals(user.getPassword())){
            return SUCCEED;
        }
        return PASSWORDERROR;
    }

    @Override

    public boolean create(User u){
        String sql = "insert into user(name,password,sex,address) value(?,?,?,?)";
        jdbcTemplateObject.update(sql,u.getName(),u.getPassword(),u.getSex(),u.getAddress());
        return true;
    }

    @Override

    public List<User> getAll(){
        String sql = "select * from user";
        List<User> users = jdbcTemplateObject.query(sql,new UserMapper());
        return users;
    }
}
