package org.echo.login.bean;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Echo on 2015/8/20.
 */

public class UserMapper implements RowMapper<User> {
    @Override
   public User mapRow(ResultSet rs, int rowNum) throws SQLException{

        User u = new User();
        u.setName(rs.getString("name"));
        u.setPassword(rs.getString("password"));
        u.setSex(rs.getString("sex"));
        u.setAddress(rs.getString("address"));
        return u;
    }
}
