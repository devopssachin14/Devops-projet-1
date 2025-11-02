package com.ems.dao;

import com.ems.entity.Employee;
import com.ems.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class EmployeeDAO {

    public String saveEmployee(Employee emp){
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
//            Employee employee = session.get(Employee.class, emp.getId());
            Query<Employee> query1 = session.createQuery("from Employee where name = :name", Employee.class);
            query1.setParameter("name",emp.getName());
            Employee exist1 = query1.uniqueResult();

            Query<Employee> query2 = session.createQuery("from Employee where email =:email", Employee.class);
            query2.setParameter("email",emp.getEmail());
            Employee exist2 = query2.uniqueResult();

            if(exist1 != null || exist2 != null ){
                // employee already exists
                return "duplicate";  // ❌ Don’t save
            }
            session.persist(emp);
            transaction.commit();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    public String updateEmployee(Employee employee,int id){

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            Employee existEmployee = session.get(Employee.class,id);
            if(existEmployee != null) {
                existEmployee.setName(employee.getName());
                existEmployee.setStatus(employee.getStatus());
                existEmployee.setDepartment(employee.getDepartment());
                existEmployee.setSalary(employee.getSalary());

                session.merge(existEmployee);
                transaction.commit();
                return "successForUpdate";
            } else {
                return "failForUpdate";
            }

        } catch (Exception e){
            if(transaction != null) transaction.rollback();
            e.printStackTrace();
            return "errorForUpdate";
        }
    }

    public List<Employee> getAllEmployee() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("from Employee", Employee.class).list();
        }
    }

    public List<Employee> getAllEmployee(String department,String status){
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            if(department != null && !department.equals("all") && status!= null && !status.equals("all")){
                Query<Employee> query = session.createQuery("from Employee where department =:dept and status =:status", Employee.class);
                query.setParameter("dept",department);
                query.setParameter("status",status);
                return query.list();
            } else if(department != null && department.equals("all")) {
                Query<Employee> query = session.createQuery("from Employee where status =:status", Employee.class);
                query.setParameter("status",status);
                return query.list();
            } else {
                Query<Employee> query = session.createQuery("from Employee where department =:dept", Employee.class);
                query.setParameter("dept",department);
                return query.list();
            }

        }
    }

    public String removeEmployee(int id) {
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Employee employee = session.get(Employee.class,id);
            transaction = session.beginTransaction();
            session.remove(employee);
            transaction.commit();
            return "successForDelete";
        } catch (Exception e){
            System.out.println("Due to technical issue your request can't be processed. Please try after some time.");
            e.printStackTrace();
            return "errorForDelete";
        }
    }
}
