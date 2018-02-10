create or replace view before_month as
select b.business_id, avg(r.stars) as avg_rating
from business b, reviews r
where b.business_id = r.business_id
		and publish_date < to_date('05-01-15', 'MM-DD-YY')
group by b.business_id
order by b.business_id asc;

create or replace view after_month as
select b.business_id, avg(r.stars) as avg_rating
from business b, reviews r
where b.business_id = r.business_id
		and publish_date < to_date('06-01-15', 'MM-DD-YY')
group by b.business_id
order by b.business_id asc;
select t.CHANGE, t.business_id, t.bizname
from (	select (after_month.avg_rating - before_month.avg_rating) as CHANGE, b.business_id, b.bizname
		from business b
		inner join after_month
		on b.business_id = after_month.business_id
		inner join before_month
		on b.business_id = before_month.business_id
		where (after_month.avg_rating - before_month.avg_rating) >=  after_month.avg_rating
		order by CHANGE desc, after_month.business_id ) t
where rownum <= 10; 

drop view before_month;
drop view after_month;
