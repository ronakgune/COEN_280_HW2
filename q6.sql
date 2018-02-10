
select p.*
from (
SELECT DISTINCT U.yelp_id
 FROM REVIEWS R , user_checkedin U, BUSINESS B
WHERE R.STARS LIKE '%5%' AND R.BUSINESS_ID IN U.checkedin_biz
GROUP BY U.yelp_id
HAVING count(distinct b.state) > 5
ORDER BY yelp_id ASC) p
where rownum <= 10 ;