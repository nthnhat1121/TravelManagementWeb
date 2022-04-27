package com.lth.repository;

import com.lth.pojos.User;

import java.util.List;

public interface EmployeeRepository {
    List<User> getEmployees(String username, int page);
    long countEmployee();
    boolean addEmployee(User user);
    boolean updateEmployee(User user);
    boolean deleteEmployee(User user);
    User findEmployeeById(long id);
}
