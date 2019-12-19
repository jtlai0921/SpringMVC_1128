package com.web.mvc.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "cusDao")
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<?> queryCustomer() {
        String sql = "SELECT * FROM APP.CUSTOMER";
        return jdbcTemplate.queryForList(sql);
    }
    
}