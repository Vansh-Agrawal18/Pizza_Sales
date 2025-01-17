use  dominos;
select * from pizza_sales;
#TOTAL REVENUE
SELECT ROUND(SUM(TOTAL_PRICE)) AS TOTAL_REVENUE FROM PIZZA_SALES;
#TOTAL NO.OF ORDERS
SELECT  COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES;
#TOTAL PIZZA SALES
SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SALES FROM PIZZA_SALES;
#AVG_ORDER_VALUE
SELECT ROUND(SUM(TOTAL_PRICE)/COUNT(DISTINCT ORDER_ID)) AS AVG_ORDER_VALUE FROM PIZZA_SALES ;
#AVG PIZZA PER ORDER
SELECT ROUND(SUM(QUANTITY)/COUNT(DISTINCT ORDER_ID)) AS AVG_PIZZA_PER_ORDER FROM PIZZA_SALES;
#TOTAL REVENUE BY PIZZA CATEGORY
SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES GROUP BY PIZZA_CATEGORY;
#PEAK HOURS
SELECT HOUR(ORDER_TIME)AS TIME,COUNT(PIZZA_ID) AS TOTAL_PIZZA_SOLD,ROUND(SUM(TOTAL_PRICE))AS TOTAL_REVENUE FROM PIZZA_SALES
GROUP BY HOUR(ORDER_TIME)
ORDER BY COUNT(PIZZA_ID) DESC,ROUND(SUM(TOTAL_PRICE)) DESC;
#TOP_SELLING_PIZZA
SELECT PIZZA_NAME ,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES 
GROUP BY PIZZA_NAME 
ORDER BY SUM(QUANTITY) DESC ,SUM(TOTAL_PRICE) DESC ;
#MONTHLY REVENUE
SELECT monthname(ORDER_TIME),SUM(TOTAL_PRICE)AS TOTAL_REVENUE FROM PIZZA_SALES GROUP BY MONTHNAME(ORDER_TIME) ORDER BY SUM(TOTAL_PRICE) DESC;
