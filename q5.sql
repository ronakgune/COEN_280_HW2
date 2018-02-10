
SELECT distinct B.BUSINESS_ID,B.STARS FROM REVIEWS B
WHERE B.STARS LIKE '%5%' AND B.AUTHOR IN
(
SELECT Y.YELP_ID FROM YELP_USER Y
WHERE Y.AGE BETWEEN 20 AND 25);