-- string manipulations [LTRIM and RTRIM], [REPLACE], 

SELECT DISTINCT

LTRIM('            THOMAS ROSNETHAL         ') as [ltrim]
,RTRIM('            THOMAS ROSNETHAL         ') as [rtrim]
,LTRIM(RTRIM('            THOMAS ROSNETHAL         ')) as [both]

,replace('THOMAS ROSENTHAL',' ','WILLIAM') as [middlename] -- adds my middle name to the middle with spaces on both sides
,REPLACE('THOMAS ROSENTHAL','a','') -- case sensitive, does not replace
,REPLACE('THOMAS ROSENTHAL','A','') -- replaces both As

--upper/lower
,lower(customer_first_name)
,upper(customer_last_name)

--concat
,customer_first_name || ' ' ||customer_last_name as customer_name -- || is the symbol used for concatenate.
,UPPER(customer_first_name) || ' ' || UPPER(customer_last_name) as upper_full_name -- This is kinda using more than one function, eg: UPPER is used with concatenate function

--substring
,SUBSTR(customer_last_name,4) -- any length from the 4th character
,SUBSTR(customer_last_name,4,2) 
,SUBSTR(customer_last_name, -5,4) -- counting from the right
,SUBSTR(customer_last_name,1,2)

,length(customer_last_name)


,'THOMAS
ROSENTHAL' 

,replace('THOMAS

ROSENTHAL',char(10),' ') -- removing all instances of line breaks from this string

from customer

WHERE customer_first_name REGEXP '(a)$' -- filtering to only ending in e, has to be valid regex

from customer