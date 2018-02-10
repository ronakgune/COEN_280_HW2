select a.business_id, a.bizname from business A 
WHERE
A.BCAT_ID IN
(
select b.bcat_id from business_category b
group by b.bcat_id 
having count(distinct b.subcat) <= 1
);