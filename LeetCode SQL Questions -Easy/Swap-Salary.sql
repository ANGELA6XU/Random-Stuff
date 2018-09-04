627. Swap Salary

交换工资（难度：简单）

给定一个 salary表，如下所示，有m=男性 和 f=女性的值 。交换所有的 f 和 m 值(例如，将所有 f 值更改为 m，反之亦然)。
要求使用一个更新查询，并且没有中间临时表。

例如:

| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |


运行你所编写的查询语句之后，将会得到以下表:

| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |


create table salary(id int, name varchar(100), sex char(1), salary int);
insert into salary values ('1', 'A', 'm', '2500');
insert into salary values ('2', 'B', 'f', '1500');
insert into salary values ('3', 'C', 'm', '5500');
insert into salary values ('4', 'D', 'f', '500');


# Write MySQL query statement below
#方法1: 考察表的更新 UPDATE IF 语句

UPDATE salary 
SET sex = IF(sex = 'm', 'f', 'm');


#方法2: UPDATE CASE WHEN 语句

UPDATE salary 
SET sex = (CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END);
