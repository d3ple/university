SELECT ID
FROM S_PRODUCT
WHERE ID NOT IN
(SELECT PRODUCT_ID
FROM S_ITEM);

SELECT ID
FROM S_CUSTOMER
WHERE ID IN
(SELECT CUSTOMER_ID
FROM S_ORD
WHERE TOTAL < 50000);


SELECT S_CUSTOMER.NAME, COUNT(*)
FROM S_ORD, S_CUSTOMER
WHERE S_ORD.CUSTOMER_ID=S_CUSTOMER.ID
AND S_CUSTOMER.ID =
/* ������ ������, ������ ��� � ������� �� ��������� ���� � ������������ ����������� �������, �� �� ������� ����� ����� ����, ������� ����� = */
(SELECT CUSTOMER_ID
FROM S_ORD
HAVING COUNT(*) = 
(SELECT MAX(COUNT(*))
FROM S_ORD
GROUP BY CUSTOMER_ID)
GROUP BY CUSTOMER_ID)
GROUP BY S_CUSTOMER.NAME;