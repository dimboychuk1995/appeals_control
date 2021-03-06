/**
 *
 */
package oe.roma.appeals.service;

import oe.roma.appeals.domain.User;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

/**
 * Handles CRUD services for users
 */
@Service("userService")
@Transactional
public class UserService implements IUserService {

    protected static Logger logger = Logger.getLogger("service");
    private JdbcTemplate jdbcTemplate;

    @Resource(name = "dataSource")
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public User get(Integer id) {
        return null;
    }

    @Override
    public void preAdd(final User user){

    }

    @Override
    public void add(final User user) {
        logger.debug("Додавання нового звернення");
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String sql = "insert into users (login, password, enabled, fullname, tab_num, email,job_position) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(new PreparedStatementCreator() {

            @Override
            public PreparedStatement createPreparedStatement(Connection connection)
                    throws SQLException {
                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getLogin());
                ps.setString(2, user.getPassword());
                ps.setInt(3, 1);
                ps.setString(4, user.getFullname());
                ps.setInt(5, user.getTab_num());
                ps.setString(6, user.getEmail());
                ps.setString(7, user.getJob_position());

                return ps;
            }
        }, keyHolder);

        jdbcTemplate.update("insert into user_roles (user_id, role_name) values(?,?)",
                new Object[]{
                        keyHolder.getKey().intValue(),
                        "USER1"
                });
    }

    @Override
    public void delete(User user) {

    }

    @Override
    public void edit(User user) {

    }

    @Override
    public User getUserByName(String username) {
        String sql = "SELECT * FROM users u " +
                "INNER JOIN user_roles ur ON u.id = ur.user_id where u.login=?";

        User user = (User) jdbcTemplate.queryForObject(
                sql, new Object[]{username},user_mapper);
        return user;
    }

    RowMapper<User> user_mapper = new RowMapper<User>() {
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setLogin(rs.getString("login"));
            user.setPassword(rs.getString("password"));
            user.setEnabled(rs.getInt("enabled"));
            user.setFullname(rs.getString("fullname"));
            user.setTab_num(rs.getInt("tab_num"));
            user.setEmail(rs.getString("email"));
            user.setJob_position(rs.getString("job_position"));
            user.getRole().setUser_id(rs.getInt("id"));
            user.getRole().setRole_name(rs.getString("role_name"));
            return user;
        }
    };
}
