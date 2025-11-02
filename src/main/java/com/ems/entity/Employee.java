package com.ems.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name="fatherName", length = 100, nullable = false)
    private String fatherName;

    @Column(name="email", length = 100, unique = true)
    private String email;

    @Column(name = "status", length = 30)
    private String status;

    @Column(name = "department", length=100)
    private String department;

    @Column(name="salary", nullable = false)
    private double salary;

    // ✅ Store only the date, not time
    @Column(name = "created_date", columnDefinition = "DATE DEFAULT (CURRENT_DATE)")
    private LocalDate joinAt;

    // ✅ Automatically set today's date when inserting
    @PrePersist
    protected void onCreate() {
        joinAt = LocalDate.now();
    }

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}

    public String getName() {return name;}
    public void setName(String name) {this.name = name;}

    public String getFatherName() {return fatherName;}
    public void setFatherName(String fatherName) {this.fatherName = fatherName;}

    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}

    public String getDepartment() {return department;}
    public void setDepartment(String department) {this.department = department;}

    public double getSalary() {return salary;}
    public void setSalary(double salary) {this.salary = salary;}


    public LocalDate getJoinAt() {return joinAt;}
    public void setJoinAt(LocalDate joinAt) {this.joinAt = joinAt;}

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", department='" + department + '\'' +
                ", salary=" + salary +
                '}';
    }
}
