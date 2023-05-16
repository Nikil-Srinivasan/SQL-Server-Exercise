use Electricity_Bill

SELECT COUNT(*) AS bills_paid_withoutfine
FROM tbl_bill
WHERE is_payed = 1
    AND fine_amount = 0
    AND MONTH(payment_date) = 10
    AND YEAR(payment_date) = 2017;

SELECT SUM(fine_amount) AS total_fine
FROM tbl_bill
WHERE payment_date >= '2017-10-01' AND payment_date < '2017-11-01';

SELECT due_date, payable_amount
FROM tbl_bill
WHERE payment_date NOT BETWEEN '2017-09-10' AND '2017-10-10'

SELECT bill_month, SUM(fine_amount) AS monthly_fine_amount
FROM tbl_bill
WHERE bill_month BETWEEN 7 AND 10
GROUP BY bill_month
ORDER BY bill_month ASC

Select COUNT(id) AS bill_count
FROM tbl_bill
WHERE payment_date = '2017-09-23'

