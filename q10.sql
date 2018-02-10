select Y.YELP_ID, Y.FIRST_NAME, Y.LAST_NAME FROM YELP_USER Y 
WHERE Y.YELP_ID IN
(
select A.comments AS USERS from REV_COMMENTS A
WHERE A.COMMENTS NOT IN 
(
select r.AUTHOR from reviews r 
WHERE r.comments NOT IN r.author)
group by A.comments having (count(A.comments) >= 2));
