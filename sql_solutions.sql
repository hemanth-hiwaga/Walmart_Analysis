show databases;
use wallmart_db;
show tables;
select * from wallmart;

-- distinct payment methods;

select 
	distinct payment_method,
    count(payment_method) as used
from wallmart
group by 1
order by used desc;
