-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View

 select * from Software
 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);
-- View
select * from Programmer

--1. Find out the selling cost average for packages developed in pascal
select 
avg(scost) as avg_scost from software
where developin = 'pascal'


---2. Display the names and ages of all programmers.
select PNAME,
DATEDIFF(YY,DOB,GETDATE()) as prg_age
FROM Programmer

--3. Display the names of those who have done the DAP course
select PNAME,COURSE 
from Studies
where COURSE = 'dap'

--Display the names and date of birth of all programmers born in january
Select Pname,DOB
from Programmer
Where  month(DOB) = 01

--What is the highest number of copies sold by a package?

SELECT TOP 1 title, SOLD AS MaxCopiesSold
FROM software
ORDER BY SOLD DESC

---Display lowest course fee
select top 1 course,  course_fee
from Studies
order by course_fee asc

select top 1 course, course_fee
from studies
where COURSE_FEE = (select min(COURSE_FEE) from studies)

--- How many programmers have done the PGDCA Course?
select count(pname) as no_of_pgm, course
from studies
group by course
having course = 'PGDCA'

--How much revenue has been earned through sales of packages
--developed in C?
 SELECT SUM(DCOST * SOLD) AS Revenue,
FROM Software
WHERE DEVELOPIN = 'C'

 --- Display the details of the software developed by Ramesh
select *
from software
where pname = 'Ramesh'

---How many programmers studies at sabhari
Select count(pname) as no_of_prgmer ,Institute
from Studies
group by Institute
having Institute = 'sabhari'

 11--Display details of packages  whose sales crossed the 2000 mark
 select *
 from software
 where (dcost*sold) > 2000 
 12---Display the details of packages for which development costs have been
recovered.
select * from 
software
where 
(scost*sold)>dcost




 13----What is the cost of the costliest software development in Basic?
 select developin,max(dcost)
 from software
 group by developin
 having developin = 'Basic'







 14--How many packages have been developed in dBase?
 select count(title) as no_of_package
 from software
 where developin = 'dbase'

 15---How many programmers studied in Pragathi?
 select count(pname) as no_of_programmer
 from studies
 where INSTITUTE = 'pragathi'

 16---- How many programmers paid 5000 to 10000 for their course?
 select count(pname) as no_of_programmer
 from studies
 where COURSE_FEE between 5000 and 10000

17 --- What is the average course fee?
select avg(course_fee) as average_fee
from studies

18---- Display the details of the programmers knowing C.

select *
from programmer
where  prof2 = 'C' or prof1 = 'c'

19-- how many programmer know either cobol or pascal?
select count(pname) as no_of_programmer
from programmer
where prof1 in( 'cobol','pascal') or
prof2 in ('cobol','pascal')

20-- how many programmer  dont know  pascal and  c?
select count(pname) as no_of_programmer
from programmer
where prof1   not in  ('pascal','c') and
  prof2  not in  ('pascal','c')

  21 -- How old is the oldest male programmer?
  select  top 1 datediff(yy,Dob,getdate()) as age,pname
  FROM PROGRAMMER
  where gender = 'm'
  order by age desc


  22--what is the average age of female programmers?
  select   avg(datediff(yy,Dob,getdate())) as avg_age
  FROM PROGRAMMER
  where gender = 'f'
  
  
  23--Calculate the experience in years for each programmer and display with
--their names in descending order
select pname, datediff(yy,DOJ,getdate()) as experience
from Programmer
order by experience desc

24--Who are the programmers who celebrate their birthdays during the
--current month?
select pname  DOB from Programmer
where month(dob) = month(getdate())

--How many female programmers are there?
select count(gender) as female_employee
from programmer
where gender = 'f'

---What are the languages studied by male programmers?
select s.course 
from Studies s
inner join
programmer p
on s.pname = p.pname
where gender = 'm'

--What is the average salary?
select avg(salary) as avg_sal
from Programmer

--How many people draw a salary between 2000 to 4000?
 select pname ,salary 
 from programmer 
 where salary between 2000 and 4000

 29--Display the details of those who don’t know Clipper, COBOL or Pascal.
 select * 
 from Programmer
 where prof1 not in ('clipper','cobol','pascal') and
  prof2 not in ('clipper','cobol','pascal')

  30--Display the cost of packages developed by each programmer
  select distinct(pname),dcost
  from Software

  31 --Display the sales value of the packages developed by each programmer
  select distinct(pname),(scost*SOLD) as sales_value
  from Software

  32.-- Display the number of packages sold by each programmer
  select  (pname), count(*) as no_of_package
  
  from software
  group by PNAME

  33.--Display the sales cost of the packages developed by each programmer
--language wise.
SELECT PNAME, DEVELOPIN, SUM(SCOST) AS TotalSalesCost
FROM Software
GROUP BY PNAME, DEVELOPIN

34---Display each language name with the average development cost,
--average selling cost and average price per copy.select developin,avg(dcost) as avg_developmentcost,avg(scost) as avg_selling_costfrom softwaregroup by  developin35--Display each programmer’s name and the costliest and cheapest
--packages developed by him or herselect pname,max(dcost)as costliest,
min(dcost)as cheapest from software
group by pname

36--Display each institute’s name with the number of courses and the
average cost per course.

select distinct (INSTITUTE), COUNT(COURSE) as n0_of_couse,
avg(course_fee) as avg_couse_fee
from studies 
group by INSTITUTE

37--Display each institute’s name with the number of students
select distinct institute,count(*) as no_of_student
from studies
group by INSTITUTE

38----Display names of male and female programmers along with their
--gender.
select distinct pname,gender
from Programmer

39-----Display the name of programmers and their packages.
SELECT PNAME, STRING_AGG(TITLE, ', ') AS Packages
FROM Software
GROUP BY PNAME
40--Display the number of packages in each language except C and C++.
select title,developin
from software
where   DEVELOPIN  not in ('c' , 'c++')

41--Display the number of packages in each language for which
--development cost is less than 1000
select distinct(developin),count(title) as no_of_package
from software
where DCOST < 1000
group by developin

42--Display the average difference between SCOST and DCOST for each
--package.
select title,(dcost-scost) as avg_diff
from Software


43.--- Display the total SCOST, DCOST and the amount to be recovered for
each programmer whose cost has not yet been recovered.
select pname, sum(scost*sold)  as total_scost,
sum(dcost) as total_dcost, sum(scost*sold)-sum(dcost) as amounttoberecovered
from software
group by pname
having (sum(scost*sold) < sum(dcost))

44 --display the highest lowest and average salaries for those esrning ,ore than 2000
select  max(salary) as highest,
min(salary) as lowest,
avg(salary) as avg_salary
from programmer
where salary > 2000

45--who is the highest paid  c programmer
select top 1 pname,max(salary) as highest_paid
from Programmer
where prof1 = 'c' or prof2 = 'c'
group by pname
order by highest_paid desc

46 --who is the highest paid female COBOL programmer?select top 1 pname,max(salary) as highest_paid
from Programmer
where prof1 = 'cobol' or prof2 = 'cobol' and
gender = 'f'
group by pname
order by highest_paid desc47--Display the names of the highest paid programmers for each language.SELECT DEVELOPIN, PNAME, SALARY
FROM (
  SELECT DEVELOPIN, PNAME, SALARY,
         ROW_NUMBER() OVER (PARTITION BY DEVELOPIN ORDER BY SALARY DESC) AS Rank
  FROM (
    SELECT s.DEVELOPIN, p.PNAME, p.SALARY
    FROM software s
    JOIN programmer p ON (s.DEVELOPIN = p.PROF1 OR s.DEVELOPIN = p.PROF2)
  ) AS RankedData
) AS FinalData
WHERE Rank = 1

48. Who is the least experienced programmer?
select  top 1 pname, datediff(yy,doj,getdate()) as expereience
from programmer
order by expereience asc

49 Who is the most experienced male programmer knowing PASCAL?
select  top 1 pname, datediff(yy,doj,getdate()) as expereience
from programmer
where prof1 = 'pascal' or prof2 = 'pascal'
order by expereience desc

Which language is known by only one programmer?
SELECT s.DEVELOPIN AS UniqueLanguage
FROM software s
left JOIN programmer p ON s.DEVELOPIN IN (p.PROF1, p.PROF2)
GROUP BY s.DEVELOPIN
HAVING COUNT(*) = 1

-- who is the above programmer referred in 50
SELECT p.PNAME AS ProgrammerName
FROM software s
JOIN programmer p ON s.DEVELOPIN IN (p.PROF1, p.PROF2)
WHERE s.DEVELOPIN IN (
  SELECT s.DEVELOPIN
  FROM software s
  LEFT JOIN programmer p ON s.DEVELOPIN IN (p.PROF1, p.PROF2)
  GROUP BY s.DEVELOPIN
  HAVING COUNT(*) = 1
)

52---Who is the youngest programmer knowing dBase?
select  top 1 s.developin, datediff(yy,dob,getdate()) as age,s.PNAME
from software s
join
programmer p on s.developin in ( p.prof1,p.prof2)
where s.developin = 'dbase'
order by age asc

53--Which female programmer earning more than 3000 does not know C,
--C++, Oracle or dBase?
select distinct(p.pname),p. salary
from programmer p
inner join 
software s on s.developin in (p.prof1,p.prof2)
where p.salary >3000 
and s.developin not in ('c','c++','oracle','dbase')
and gender='f'

54. --54. Which institute has the most number of students?select top 1 institute ,count(pname) as most_student
from studies
group by institute
order by most_student desc

55.--What is the costliest course?select top 1 COURSE ,max(course_fee) as costliest_course
from studies
group by course
order by costliest_course desc

56.--Which course has been done by the most number of students?
select top 1 course , COUNT(PNAME) as most_opted course
FROM STUDIES
group by course
order by course desc 

57.---Which institute conducts the costliest course?
select top 1 institute , max(course_fee) as costliest_course
FROM STUDIES
group by INSTITUTE
order by costliest_course desc 

58--Display the name of the institute and the course which has below
--average course fee
SELECT s.institute, s.course, s.course_fee
FROM studies s
JOIN (
  SELECT institute, course, AVG(course_fee) AS average_fee
  FROM studies
  GROUP BY institute, course
) subquery ON s.institute = subquery.institute AND s.course = subquery.course
WHERE s.course_fee < subquery.average_fee

59--Display the names of the courses whose fees are within 1000 (+ or -) of
the average fee.

SELECT course
FROM studies
WHERE course_fee >= (SELECT AVG(course_fee) - 1000 FROM studies)
  AND course_fee <= (SELECT AVG(course_fee) + 1000 FROM studies)

  60---Which package has the highest development cost?
  select  top 1 title,max(dcost) as max_cost
  from software group by title
  order by title desc

61--Which course has below average number of students?
SELECT course
FROM studies
GROUP BY course
HAVING COUNT(pname) < (SELECT AVG(student_count) 
FROM (SELECT COUNT(pname) AS student_count 
FROM studies GROUP BY course) AS subquery)

62---Which package has the lowest selling cost?
select  top 1 title,min(scost) as lowest_cost
from software
group by TITLE
order by lowest_cost asc 

63--Who developed the package that has sold the least number of copies?
select top 1 pname , title , min (sold) as least_sold
from software
group by pname,title
order by least_sold asc
 
 64--Which language has been used to develop the package which has the
highest sales amount?
select top 1 developin , min (scost*sold) as max_sales
from software
group by developin
order by   max_sales desc

65 ---- How many copies of the package that has the least difference between
--development and selling cost were sold?
select  top 1 title, sold,(dcost-scost) as least_difference
from software
order by least_difference asc

66---Which is the costliest package developed in Pascal?
select  top 1 title, max(dcost) as costliest
from Software
group by title
order by costliest desc

67---Which language was used to develop the most number of packages?
select  top 1 developin,count(developin) as count
from software
group by developin 
order by count desc

68---Which programmer has developed the highest number of packages?
select 
 top 1  pname ,count(pname) as prgm 
from software
group by  pname
order by prgm desc

69---Who is the author of the costliest package?

select top 1 pname, max(dcost) as costliest_package
from software
group by pname
order by costliest_package desc

70--Display the names of the packages which have sold less than the
--average number of copies

select title
from software
where sold < 
(
select  avg(sold) as avg_sold
from software)

71--Who are the authors of the packages which have recovered more than
--double the development cost?
select pname
from software
where (scost*sold) > 2*dcost

72-- Display the programmer names and the cheapest packages developed
--by them in each language.
select pname, title, dcost
from software

SELECT p.PNAME, s.DEVELOPIN, s.TITLE, s.SCOST
FROM software s
INNER JOIN (
  SELECT DEVELOPIN, MIN(SCOST) AS min_cost
  FROM software
  GROUP BY DEVELOPIN
) AS min_prices ON s.DEVELOPIN = min_prices.DEVELOPIN AND s.SCOST = min_prices.min_cost
JOIN programmer p ON s.DEVELOPIN = p.PROF1 OR s.DEVELOPIN = p.PROF2

SELECT p.PNAME, s.DEVELOPIN, s.TITLE, s.SCOST
FROM software s
JOIN programmer p ON s.DEVELOPIN = p.PROF1 OR s.DEVELOPIN = p.PROF2
WHERE s.SCOST = (
  SELECT MIN(SCOST)
  FROM software
  WHERE DEVELOPIN = s.DEVELOPIN
)
--73 display the language used by each programmer to develop the highest
selling and lowest selling package.
 SELECT p.PNAME, s.DEVELOPIN AS Language,
    MAX(s.SOLD) AS HighestSelling, MIN(s.SOLD) AS LowestSelling
FROM software s
JOIN programmer p ON s.DEVELOPIN = p.PROF1 OR s.DEVELOPIN = p.PROF2
GROUP BY p.PNAME, s.DEVELOPIN

SELECT p.PNAME, s.DEVELOPIN AS Language,
    (SELECT MAX(SOLD) FROM software WHERE DEVELOPIN = s.DEVELOPIN) AS HighestSelling,
    (SELECT MIN(SOLD) FROM software WHERE DEVELOPIN = s.DEVELOPIN) AS LowestSelling
FROM programmer p
LEFT JOIN software s ON p.PROF1 = s.DEVELOPIN OR p.PROF2 = s.DEVELOPIN
GROUP BY p.PNAME, s.DEVELOPIN

75 Who is the youngest male programmer born in 1965?
select top 1 pname
from programmer
where gender = 'm' and year(dob) = 1965
order by pname

76---In which year was the most number of programmers born?
SELECT  top 1 YEAR(DOB) AS BirthYear, COUNT(dob) AS NumberOfProgrammers
FROM programmer
GROUP BY YEAR(DOB)
ORDER BY COUNT(dob) DESC

77In which month did the most number of programmers join?
SELECT  top 1 month(DOj) AS joinmonth, COUNT(doj) AS NumberOfProgrammers
FROM programmer
GROUP BY month(doj)
ORDER BY count(doj) desc

78-- In which language are most of the programmer’s proficient?


SELECT  top 1 Language, COUNT(*) AS NumberOfProgrammers
FROM (
    SELECT PROF1 AS Language FROM programmer WHERE PROF1 IS NOT NULL
    UNION ALL
    SELECT PROF2 AS Language FROM programmer WHERE PROF2 IS NOT NULL
) AS Languages
GROUP BY Language
ORDER BY COUNT(*) DESC

79 --Who are the male programmers earning below the average salary of
female programmers?
SELECT PNAME, SALARY
FROM programmer 
WHERE GENDER = 'M'
AND SALARY < (
  SELECT AVG(SALARY)
  FROM programmer
  WHERE GENDER = 'F')

  80 Who are the female programmers earning more than the highest paid?
  select pname , salary
  from programmer 
  where gender = 'f'
  and salary > 
  ( select max(salary)
  from programmer)

  81
--Which language has been stated as the proficiency by most of the
programmers?
SELECT  top 1 Language, COUNT(*) AS NumberOfProgrammers
FROM (
    SELECT PROF1 as language FROM programmer WHERE PROF1 IS NOT NULL
    UNION ALL
    SELECT PROF2  as language FROM programmer WHERE PROF2 IS NOT NULL
) AS Languages
GROUP BY Language
ORDER BY COUNT(*) DESC

82--Display the details of those who are drawing the same salary.SELECT *
FROM programmer
WHERE SALARY IN (
  SELECT SALARY
  FROM programmer
  GROUP BY SALARY
  HAVING COUNT(*) > 1
  
  
)order by SALARY

84.Display the details of the software developed by the male programmers
earning more than 3000.select * from Programmerwhere gender = 'm'and salary > 300085.--Display the details of the packages developed in Pascal by the female
programmers.select *from software sinner joinProgrammer p on s.developin=p.prof1 or s.developin= p.prof2where developin = 'pascal'and gender = 'f'
 86--Display the details of the programmers who joined before 1990
select  * from 
programmer
where year(doj) < 1990

87--Display the number of packages, number of copies sold and sales value
--of each programmer institute wise.
SELECT st.INSTITUTE,
       COUNT(s.title) AS number_of_packages,
       SUM(s.SOLD) AS number_of_copies_sold,
       SUM(s.SOLD * s.SCOST) AS total_sales_value
FROM studies st
JOIN software s ON st.PNAME = s.PNAME
GROUP BY st.INSTITUTE

88--Display the details of the software developed in dBase by male
programmers who belong to the institute in which the most number of
programmers studied.
select * from 
 Studies s
 inner join
 software st
 on s.pname = st.pname
 join
 programmer p
 on st.developin = p.prof1 or  st.developin = p.prof2

 where st.developin = 'dbase'
 and s.institute = ( SELECT TOP 1 INSTITUTE
    FROM studies
    GROUP BY institute
    ORDER BY COUNT(*) DESC)
	and p.gender = 'm'

89.Display the details of the software developed by the male programmers
born before 1965 and female programmers born after 1975
select * from software s
inner join
Programmer p
on s.developin in  (p.prof1,p.prof2)
where p.gender = 'M' ANd Year(p.dob) < 1965
union all
select * from software s
inner join
Programmer p
on s.developin in  (p.prof1,p.prof2)
where p.gender = 'F' ANd Year(p.dob) > 1975

90 --Display the details of the software that has been developed in the
language which is neither the first nor the second proficiency of the
programmers.select * from software sInner joinProgrammer pon s.DEVELOPIN in (p.prof1,p.prof2)where  not s.developin  = p.prof1 and not s.DEVELOPIN   = p.prof2SELECT s.PNAME, s.TITLE, s.DEVELOPIN
FROM software s
JOIN programmer p ON s.PNAME = p.PNAME
WHERE s.DEVELOPIN NOT IN (p.PROF1, p.PROF2)

91.---Display the details of the software developed by the male students at
Sabhari.

SELECT s.PNAME, s.TITLE, s.DEVELOPIN
FROM software s
JOIN programmer p ON s.PNAME = p.PNAME
JOIN studies st ON p.PNAME = st.PNAME
WHERE st.INSTITUTE = 'Sabhari' AND p.GENDER = 'M'

92 Display the names of the programmers who have not developed any
package
SELECT p.PNAME
FROM programmer p
WHERE p.PNAME NOT IN (SELECT DISTINCT PNAME FROM software)
 
What is the total cost of the software developed by the programmers of
Apple?
select sum(dcost) as total_cost
from software s
inner join
studies st on
s.pname = st.pname
where institute = 'apple'

94-- who are the programmers who joined on the same day?
SELECT PNAME, DOJ
FROM programmer
WHERE DOJ IN (
    SELECT DOJ
    FROM programmer
    GROUP BY DOJ
    HAVING COUNT(*) > 1)

95. -- who are the programmers who have the same Prof2?
select pname, prof2
from programmer
where prof2 in
( select prof2
from programmer
group by prof2
having count(*) > 1)

96.display the total sales value of the software institute wise.select st.institute ,sum(s.sold*scost) as revenuefrom software sjoinstudies st on s.pname = st.pnamegroup by st.institute97In which institute does the person who developed the costliest package
study?select st.pname,st.institutefromstudies stjoinsoftware s ons.pname = st.PNAMEwhere dcost = (select max(dcost) from software)98Which language listed in Prof1, Prof2 has not been used to develop any
package?	SELECT DISTINCT language
FROM (
    SELECT PROF1 AS language
    FROM programmer
    UNION ALL
    SELECT PROF2 AS language
    FROM programmer
) AS languages
WHERE language NOT IN (
    SELECT DISTINCT DEVELOPIN
    FROM software
)
99--How much does the person who developed the highest selling package
earn and what course did he/she undergo

select p.salary,st.course
from programmer p
inner join studies st
on p.pname = st.pname
inner join software s
on s.pname = st.pname
where s.Sold = (select max(sold) from software)

--What is the average salary for those whose software sales is more than
50,000?
 select avg(salary)
 from programmer p
 join 
 software s on
 s.pname = p.pname
 where (sold*scost) > 50000

 101 How many packages were developed by students who studied in
institutes that charge the lowest course fee?


   SELECT COUNT(*) AS package_count
FROM software s
JOIN studies st ON s.PNAME = st.PNAME
WHERE st.INSTITUTE IN (
    SELECT INSTITUTE
    FROM studies
    GROUP BY INSTITUTE
    HAVING MIN(COURSE_FEE) = (
        SELECT MIN(COURSE_FEE)
        FROM studies)
        
    )

102-- How many packages were developed by the person who developed the
cheapest package? Where did he/she study?
SELECT COUNT(*) AS package_count, st.INSTITUTE
FROM software s
JOIN studies st ON s.PNAME = st.PNAME
WHERE s.DEVELOPIN = (
    SELECT TOP 1 DEVELOPIN
    FROM software
    ORDER BY DCOST ASC
)
GROUP BY st.INSTITUTE;

103--How many packages were developed by female programmers earning
more than the highest paid male programmer?

SELECT COUNT(*) AS package_count
FROM software s
JOIN programmer p ON s.PNAME=p.PNAME

WHERE P.gender = 'f'
   and salary > 
   ( 
   (select max(salary) from 
   programmer where gender = 'm'))

104.--How many packages are developed by the most experienced
--programmers from BDPS?
SELECT COUNT(*) AS package_count
FROM software s
JOIN programmer p ON s.PNAME = p.PNAME
JOIN studies st ON p.PNAME = st.PNAME
WHERE st.INSTITUTE = 'BDPS'
AND p.DOJ = (
    SELECT MAX(DOJ)
    FROM programmer
    WHERE PNAME IN (
        SELECT PNAME
        FROM studies
        WHERE INSTITUTE = 'BDPS'
    )
)

105--List the programmers (from the software table) and the institutes they
--studied at.
SELECT S.PNAME ,ST.INSTITUTE
FROM SOFTWARE S
INNER JOIN STUDIES ST
ON S.PNAME = ST.PNAME

106-- List each PROF with the number of programmers having that PROF
and the number of the packages in that prof

SELECT prof AS PROF, COUNT(DISTINCT s.PNAME) AS programmer_count, COUNT(s.PNAME) AS package_count
FROM (
    SELECT PROF1 AS prof FROM programmer
    UNION ALL
    SELECT PROF2 AS prof FROM programmer
) AS p
LEFT JOIN software s ON p.prof = s.DEVELOPIN
GROUP BY prof

107--List the programmer names (from the programmer table) and the
number of packages each has developed
select  distinct(p.pname) , count(*)
from software s
inner join programmer p
on s.pname = p.pname
group by p.pname



 

 
 












 











select * from Studies
select * from Software
select * from Programmer


