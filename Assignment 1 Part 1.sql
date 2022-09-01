/* Question 1 */
-- A
select count(*) 
from planes
where speed is not null;
-- B
select max(speed) as max_speed, min(speed) as min_speed 
from planes;

/* Question 2 */
-- A
select sum(distance) as total_distance_flown
from flights
where year = 2013
and month = 1;
-- B
select ifnull(sum(distance), 0) as total_distance_flown
from flights
where year = 2013
and month = 1
and tailnum like null;

/* Question 3 */
-- INNER JOIN
select sum(distance) as total_distance, manufacturer
from flights f
inner join planes p
on f.tailnum = p.tailnum
where f.year = 2013
and f.month = 7
group by p.manufacturer
order by p.manufacturer asc;
-- LEFT OUTER JOIN, mismatched tailnums give null value for manufacturer?
select sum(distance) as total_distance, ifnull(manufacturer, 'NONE') as manufacturer
from flights f
left join planes p
on f.tailnum = p.tailnum
where f.year = 2013
and f.month = 7
group by p.manufacturer
order by p.manufacturer asc;

/* Question 4 */
-- Write your own? Distance flown by planes on Feb 2013 where temp was below x, sorted by number of engines
select sum(f.distance) as distance, p.engines
from flights f
inner join planes p on f.tailnum = p.tailnum
inner join weather w on f.origin = w.origin
where f.year = 2013
and f.month = 2
and w.temp > 25
group by p.engines;