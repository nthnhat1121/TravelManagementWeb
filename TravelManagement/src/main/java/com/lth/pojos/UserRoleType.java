package com.lth.pojos;

public enum UserRoleType {
    ADMIN("Quản trị viên"), EMPLOYEE("Nhân viên"), CUSTOMER("Khách hàng");
    private String name;

    private UserRoleType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return getName();
    }
}
