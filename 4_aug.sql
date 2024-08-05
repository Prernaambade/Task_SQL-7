select * from customer

select * from product

select * from sales

--1.create a report of all state sales, quantity, discount,profit with the all aggregation
a. select c.state,sum (s.sales),sum (s.quantity),sum (s.discount),sum (s.profit) from sales as s
   inner join customer as c
   on s.customer_id=c.customer_id
   where c.state is not null
   group by c.state
b. select c.state,count (s.sales),count(s.quantity),count (s.discount),count(s.profit) from sales as s
   inner join customer as c
   on s.customer_id=c.customer_id
   where c.state is not null
   group by c.state
c. select c.state,avg (s.sales),avg(s.quantity),avg(s.discount),avg(s.profit) from sales as s
   inner join customer as c
   on s.customer_id=c.customer_id
   where c.state is not null 
   group by c.state 
d. select c.state,max (s.sales),max(s.quantity),max(s.discount),max(s.profit) from sales as s
   inner join customer as c
   on s.customer_id=c.customer_id
   where c.state is not null 
   group by c.state 
e. select c.state,min (s.sales),min(s.quantity),min (s.discount),min(s.profit) from sales as s
   inner join customer as c
   on s.customer_id=c.customer_id
   where c.state is not null 
   group by c.state   

--2.get data of all states and city avg customer age
    select c.state,c.city, avg (c.age) from customer as c
    where c.state is not null and c.city is not null
    group by c.state,c.city

--3.get data of 2017 to 2018 with product name and sales per quantity 
    select p.product_name,s.order_date, s.sales/s.quantity from sales as s
    inner join product as p
    on s.product_id= p.product_id
    where s.order_date between '2017-1-1'and '2018-12-31'
    group by p.product_name,s.order_date, s.sales/s.quantity

---4.create 4 questions on your data like above and solve
    select * from departments

    select * from teachers

--a. give me the data of department name, teachers name, position in the established year between 1950 to 2000
     select d.established_year,t.department_name,t.teacher_name,t.position from teachers as  t
     inner join departments as d
     on t.department_id = d.department_id
     where d.established_year between '1950'and '2000'
     group by d.established_year,t.department_name,t.teacher_name,t.position

--b.give me the data of teachers_name,position and sum of salary 
    select t.teacher_name,t.position,sum(t.salary) from teachers as t
    where t.teacher_name  is not null and t.position is not null
    group by t.teacher_name,t.position

--c.give me the data of department name, teachers name and average budget to build department
    select t.department_name, t.teacher_name , avg(d.budget) from departments as d
    inner join teachers as t
    on d.department_id = t.department_id
    where t.department_name is not null and  t.teacher_name is not null
    group by t.department_name, t.teacher_name

--d.give me the data of  oldest department in the college
    select d.department_name, d.head_of_department,max (d.established_year)from departments as d
    where d.department_name is not null and d.head_of_department is not null
    group by d.department_name, d.head_of_department
    order by max (d.established_year)asc

   


