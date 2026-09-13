 use mycompany;
 select
 `journey date`,
 `branch name`,
 `route`,
 sum(`seat count`) as 'seats',
 round(sum(`Total ticket price`),0) as 'Total Revenue'
 from route
 group by 
 `journey date`, `branch name`, `route`;