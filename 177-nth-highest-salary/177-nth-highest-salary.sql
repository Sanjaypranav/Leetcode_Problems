CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      
      with salary_rank as ( select salary, dense_rank() over(order by salary desc) as `rows` from Employee group by salary)
      
      select salary from salary_rank where salary_rank.rows = N
      
  );
END