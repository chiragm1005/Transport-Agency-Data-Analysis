select 
b.`Month`,
b.`Booking Origin`,
b.`route`,
b.`Sold Seats`,
o.`Total Seats`
from
(
select
MONTHNAME(STR_TO_DATE(`Journey date`, '%Y-%m-%d')) AS 'Month',
case 
when `agent name` in ('api-redbus', 'api-abhibus', 'api-paytm-bkg') then `agent name`
when `branch name` like 'npt%' then `branch name`
when `branch name` = 'Onl_New payal Travels' then `branch name`
else 'Offline Agents'
end as `Booking Origin`,
`route`,
sum(`seat count`) as 'Sold Seats'
from `booking augest`
where not `booking type` = 'Guest' and `status` = 'booked'
group by
`booking origin`, `route`, `month`
) as b
left join
(
select 
`route name`,
sum(`total available seats ?`) as 'Total Seats'
from `occ augest`
group by `route name`
) as o on b.`route` = o.`route name`;
