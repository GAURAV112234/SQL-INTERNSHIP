use hr_data;

select *
from data_general;

-- 1. Retrieve the total number of employees in the dataset
select distinct count(*) as total_emp
from data_general;

-- 2. List all unique job roles in the dataset.

select  distinct jobrole
from data_general;

-- 3. Find the average age of employees
select round(avg(age))as employ_age
from data_general;

-- 4.Retrieve the names and ages of employees who have worked at the company for more then 5 years

SELECT `emp name`, age
FROM data_general
WHERE DATEDIFF(CURDATE(), hire_date) > 5 * 365;


-- 5. Get a count of employees grouped by their department

select distinct count(`emp name`)as emp ,department
from data_general
group by department;


-- 6.  List employees who have 'High' Job Satisfaction.

select  `emp name`,jobsatisfaction
from data_general
order by  jobsatisfaction desc;

-- 7. Find the highest Monthly Income in the dataset.

select max(monthlyincome) ,`emp name`
from data_general
group by `emp name`
order by `emp name`desc
limit 1;


-- 8.List employees who have 'Travel_Rarely' as their BusinessTravel type.

select `emp name`,businesstravel
from data_general
where businesstravel='Travel_Rarely';



-- 9.  Retrieve the distinct MaritalStatus categories in the dataset.

select distinct maritalstatus
from data_general
group by maritalstatus;



-- 10. Get a list of employees with more than 2 years of work experience but less than 4 years in their current role

select  `emp name`, totalworkingyears  
from data_general
where totalworkingyears  >2 and totalworkingyears<4;

-- 11.List employees who have changed their job roles within the company (JobLevel and jobrole differ from their previous job)

select `emp name`,employeeid,attrition,yearsatcompany,
case
    when attrition ='no' then 'not change'
    when attrition  ='yes' then 'job change'
    
    else 0
    end as jobchange
    from data_general;



-- .12 Find the average distance from home for employees in each department.

select avg(distancefromhome)
from data_general;

-- 13.Retrieve the top 5 employees with the highest MonthlyIncome

select `emp name`,max(monthlyincome) as highestincome
from data_general
group by `emp name`
order by highestincome desc
limit 5;





-- 15.List the employees with the highest and lowest EnvironmentSatisfaction.

select `emp name`, EnvironmentSatisfaction,
case 
when environmentsatisfaction =1 then 'very low'
when environmentsatisfaction =2 then 'low'
when environmentsatisfaction =3 then 'medium'
when environmentsatisfaction =4 then 'high'
when environmentsatisfaction =5 then 'very high'
end as above
from data_general;


-- .16 Find the employees who have the same JobRole and MaritalStatus.

select jobrole,maritalstatus, count(*) as employeecount
from data_general
group by jobrole,maritalstatus
having count(*) >1;


-- .17 List the employees with the highest TotalWorkingYears who also have a performacerating of 4


select `emp name`,totalworkingyears ,performancerating
from data_general
where performancerating=4 
group by `emp name`,totalworkingyears
order by totalworkingyears desc;


-- .18 Calculate the average Age and JobSatisfaction for each BusinessTravel type.

select jobsatisfaction,businesstravel,round((age))
from data_general
order by jobsatisfaction,businesstravel,round((age))desc;



-- .19 Retrieve the most common EducationField among employees.

select  educationfield,count(*) as field_count
from data_general
group by educationfield
order by field_count desc;




-- .20 List the employees who have worked for the company the longest but haven't had a promotion

select `emp name`,EmployeeID,yearssincelastpromotion ,yearsatcompany
from data_general
where yearssincelastpromotion=0 and yearsatcompany<40
order by yearsatcompany desc
limit 10;














