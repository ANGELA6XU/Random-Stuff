596. Classes More Than Five Students

超过5名学生的课（难度：简单）

有一个 courses 表 ，有: student (学生) 和 class (课程)。

请列出所有超过或等于5名学生的课。Note: 学生在每个课中不应被重复计算。

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| A       | Math       |
+---------+------------+

应该输出:

+---------+
| class   |
+---------+
| Math    |
+---------+

Create table courses (student varchar(255), class varchar(255));
insert into courses values ('A', 'Math');
insert into courses values ('B', 'English');
insert into courses values ('C', 'Math');
insert into courses values ('D', 'Biology');
insert into courses values ('E', 'Math');
insert into courses values ('F', 'Computer');
insert into courses values ('G', 'Math');
insert into courses values ('A', 'Math');


# Write MySQL query statement below
#方法1: 从不包含重复行中 查找出所有超过或等于5名学生的课

SELECT class
FROM(
	SELECT DISTINCT * 
	FROM courses) AS c
GROUP BY class
HAVING COUNT(class) >= 5;


#方法2: 先按课程分类，再判断大于等于5的非重复学生数。

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
