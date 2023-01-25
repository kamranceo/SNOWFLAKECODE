create database win_fun
use win_fun


create table ineuron_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50))

INSERT INTO ineuron_students values (101 ,'fsda', 'kamran' , 'cs',80,'kamransohail@gmail.com')



insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com')

SELECT * FROM ineuron_students
WINDOWING OPERATION(AGREGATION BASED)
select student_batch,sum(students_marks)from ineuron_students group by student_batch

select student_batch,min(students_marks)from ineuron_students group by student_batch

select student_batch,max(students_marks)from ineuron_students group by student_batch

select student_batch,avg(students_marks)from ineuron_students group by student_batch

select count(student_batch) from ineuron_students

select count(distinct student_batch) from ineuron_students

select student_batch ,count(*) from ineuron_students group by student_batch

WINDOWING OPERATION(ANNALATICAL BASED)

SELECT * FROM ineuron_students

SELECT student_name from ineuron_students where students_marks in
(select max(students_marks) from ineroun_students where student_batch='fsda' )

select student_name from ineuron_students where students_marks in 
(select max(students_marks) from ineuron_students where student_batch="fsda")

select student_name from ineuron_students where student_batch='fsda' order by students_marks DESC limit 2

select * from ineuron_students

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 1,1

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2,2

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3 , 1

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2 , 1

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 4 , 1
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 5,1
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 6,1

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3,2
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3,3
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2,3

select * from ineuron_students

select * from ineuron_students where students_marks =(
select min(students_marks) from 
(select students_marks from ineuron_students 
where student_batch ="fsda"
order by students_marks desc
limit 3 ) as top);


select students_marks from ineuron_students 
where student_batch ="fsda" order by students_marks desc limit 3

select * from ineuron_students

select student_id , student_batch , student_stream,students_marks ,
row_number() over(order by students_marks) as 'row_number' from ineuron_students
 
select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_num' 
from ineuron_students ) as test where row_num = 1

select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc ) as 'row_num' 
from ineuron_students 

select student_id , student_batch , student_stream,students_marks ,
row_number()over(order by students_marks desc ) as 'row_num' 
from ineuron_students 

select student_id , student_batch , student_stream,students_marks ,
row_number() over(order by students_marks desc) as 'row_number',
rank() over(order by students_marks desc ) as 'row_rank' 
from ineuron_students 


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank' 
from ineuron_students ) as test where row_rank = 1


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from ineuron_students ) as test where `dense_rank` = 2

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from ineuron_students ) as test where `dense_rank` = 3

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from ineuron_students ) as test where `dense_rank` IN (1,2,3) 