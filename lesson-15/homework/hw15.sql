--Lvl1
--1
select id, name, salary
from employees
where salary = (select min(salary) from employees);

--2
select id, product_name, price
from products
where price > (select avg(price) from products);

--Lvl2
--3
select id, name, department_id
from employees
where department_id = (select id 
						from departments 
						where department_name = 'Sales');

--4
select customer_id, name
from customers
where customer_id not in (select customer_id from orders);

--Lvl3
--5
select p.id, p.product_name, p.price, p.category_id
from products p
where p.price = (select max(p2.price) from products p2 where p2.category_id = p.category_id)

--6
select e.id, e.name, e.salary, e.department_id
from employees e
where e.department_id = (select top 1 department_id 
							from employees
							group by department_id
							order by avg(salary) desc);

--Lvl4
--7
select e.name, e.salary, e.department_id
from employees e
where e.salary > (select avg(e2.salary)
					from employees e2
					where e2.department_id = e.department_id);

--8
select s.name, g.course_id as [course id], g.grade
from grades g
join students s on s.student_id = g.student_id
where g.grade = (select max(g2.grade) 
					from grades g2 
					where g2.course_id = g.course_id);

--Lvl5
--9
select p1.id, p1.product_name, p1.category_id, p1.price
from products p1
where 2 = (select count(distinct p2.price)
			from products p2
			where p2.category_id = p1.category_id and p2.price > p1.price);

--10
select e.id, e.name, e.salary, e.department_id
from employees e
where e.salary > (select avg(salary)
					from employees)
					and e.salary < (select max(e2.salary)
					from employees e2
					where e2.department_id = e.department_id);
