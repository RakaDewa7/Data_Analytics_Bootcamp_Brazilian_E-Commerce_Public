--====================================================
--About data
--====================================================

select * from olist_customers_dataset ocd
--Pada data olist_customers_dataset yang dianalisis ini terdapat string (4), dan Int (1)
--Kemudian, untuk data olist_customers_dataset terdapat 99.441 Baris dan 5 Kolom.

select * from olist_order_items_dataset ooid 
--Pada data olist_order_items_dataset yang dianalisis ini terdapat string (4), Int (1) dan float (2)
--Kemudian, untuk data olist_order_items_dataset terdapat 112.650 Baris dan 7 Kolom.

select * from olist_order_payments_dataset oopd 
--Pada data olist_order_payments_dataset yang dianalisis ini terdapat string (2), Int (2) dan float (1)
--Kemudian, untuk data olist_order_payments_dataset terdapat 103.886 Baris dan 5 Kolom.

select * from olist_orders_dataset ood 
--Pada data olist_orders_dataset yang dianalisis ini terdapat string (8)
--Kemudian, untuk data olist_orders_dataset terdapat 99.441 Baris dan 8 Kolom

select * from olist_products_dataset opd 
--Pada data olist_orders_dataset yang dianalisis ini terdapat string (2) dan int (7)
--Kemudian, untuk data olist_orders_dataset terdapat 32.951 Baris dan 8 Kolom

--Setelah melihat semua datanya, bisa dilihat 
--===========================================================
/*Membuat Primary jey dan Foreign key*/

alter table olist_customers_dataset
    add primary key (customer_id);

alter table olist_orders_dataset
    add primary key (order_id);

alter table olist_products_dataset
    add primary key (product_id);

alter table olist_order_items_dataset
add constraint fk_order_items
foreign key (order_id) references olist_orders_dataset(order_id)

alter table olist_order_payments_dataset
add constraint fk_order_payments
foreign key (order_id) references olist_orders_dataset(order_id)

alter table olist_orders_dataset
add constraint fk_order_customers
foreign key (customer_id) references olist_customers_dataset(customer_id)
--=========================================================================================
--Ukuran data olist_customers_dataset ocd
select 
count(*) as Jumlah_kolom
from olist_customers_dataset

--Ukuran data olist_order_items_dataset
select
count(*) as Jumlah_kolom
from olist_order_items_dataset

--Ukuran data olist_order_payments_dataset
select
count(*) as Jumlah_kolom
from olist_order_payments_dataset

--Ukuran data olist_orders_dataset
select
count(*) as Jumlah_kolom
from olist_orders_dataset

--Ukuran data olist_products_dataset
select
count(*) as Jumlah_kolom
from olist_products_dataset

--====================================================
--Manipulation Data

--=========================================================================================
--Missing Value olist_customers_dataset
select 
'customer_id' as column_name,
count(*) filter (where customer_id is null) as missing_count
from olist_customers_dataset
union all
select
'customer_unique_id',
count(*) filter (where customer_unique_id is null)
from olist_customers_dataset
union all
select
'customer_zip_code_prefix',
count(*) filter (where customer_zip_code_prefix is null)
from olist_customers_dataset
union all
select
'customer_city',
count(*) filter (where customer_city is null)
from olist_customers_dataset
union all
select
'customer_state',
count(*) filter (where customer_state is null)
from olist_customers_dataset
-- Setelah mengguankan count kesemua kolom bisa disimpulkan tidak terdapat missing value
--=========================================================================================

--Missing Value olist_order_items_dataset
select 
'order_id' as column_name,
count(*) filter (where order_id is null) as missing_count
from olist_order_items_dataset
union all
select
'order_item_id',
count(*) filter (where order_item_id is null)
from olist_order_items_dataset
union all
select
'seller_id',
count(*) filter (where seller_id is null)
from olist_order_items_dataset
union all
select
'shipping_limit_date',
count(*) filter (where shipping_limit_date is null)
from olist_order_items_dataset
union all
select
'price',
count(*) filter (where price is null)
from olist_order_items_dataset
union all
select
'freight_value',
count(*) filter (where freight_value is null)
from olist_order_items_dataset
-- Setelah mengguankan count kesemua kolom bisa disimpulkan tidak terdapat missing value

--=============================================================

--Missing Value olist_order_payments_dataset
select 
'order_id' as column_name,
count(*) filter (where order_id is null) as missing_count
from olist_order_payments_dataset
union all
select
'payment_sequential',
count(*) filter (where payment_sequential is null)
from olist_order_payments_dataset
union all
select
'payment_type',
count(*) filter (where payment_type is null)
from olist_order_payments_dataset
union all
select
'payment_installments',
count(*) filter (where payment_installments is null)
from olist_order_payments_dataset
union all
select
'payment_value',
count(*) filter (where payment_value is null)
from olist_order_payments_dataset
-- Setelah mengguankan count kesemua kolom bisa disimpulkan tidak terdapat missing value

--=============================================================

--Missing Value olist_orders_dataset
select 
'order_id' as column_name,
count(*) filter (where order_id is null) as missing_count
from olist_orders_dataset
union all
select
'customer_id',
count(*) filter (where customer_id is null)
from olist_orders_dataset
union all
select
'order_status',
count(*) filter (where order_status is null)
from olist_orders_dataset
union all
select
'order_purchase_timestamp',
count(*) filter (where order_purchase_timestamp is null)
from olist_orders_dataset
union all
select
'order_approved_at',
count(*) filter (where order_approved_at is null)
from olist_orders_dataset
union all
select
'order_delivered_carrier_date',
count(*) filter (where order_delivered_carrier_date is null)
from olist_orders_dataset
union all
select
'order_delivered_customer_date',
count(*) filter (where order_delivered_customer_date is null)
from olist_orders_dataset
union all
select
'order_estimated_delivery_date',
count(*) filter (where order_estimated_delivery_date is null)
from olist_orders_dataset
-- Setelah mengguankan count kesemua kolom bisa disimpulkan tidak terdapat missing value
--=============================================================

--Missing Value olist_products_dataset
select 
'product_id' as column_name,
count(*) filter (where product_id is null) as missing_count
from olist_products_dataset
union all
select
'product_category_name',
count(*) filter (where product_category_name is null)
from olist_products_dataset
union all
select
'product_name_lenght',
count(*) filter (where product_name_lenght is null)
from olist_products_dataset
union all
select
'product_description_lenght',
count(*) filter (where product_description_lenght is null)
from olist_products_dataset
union all
select
'product_photos_qty',
count(*) filter (where product_photos_qty is null)
from olist_products_dataset
union all
select
'product_weight_g',
count(*) filter (where product_weight_g is null)
from olist_products_dataset
union all
select
'product_length_cm',
count(*) filter (where product_length_cm is null)
from olist_products_dataset
union all
select
'product_height_cm',
count(*) filter (where product_height_cm is null)
from olist_products_dataset
union all
select
'product_width_cm',
count(*) filter (where product_width_cm is null)
from olist_products_dataset
-- Setelah mengguankan count kesemua kolom bisa disimpulkan terdapat missing value pada table olist_products_dataset
--=========================================================================================

/* Duplikasi olist_customers_dataset */
--customer_id
select
customer_id, count(*)
from olist_customers_dataset
group by customer_id 
having count(*) > 1;

--customer_unique_id
select
customer_unique_id, count(*)
from olist_customers_dataset
group by customer_unique_id
having count(*) > 1;

--customer_zip_code_prefix
select
customer_zip_code_prefix, count(*)
from olist_customers_dataset
group by customer_zip_code_prefix
having count(*) > 1;

--customer_city
select
customer_city, count(*)
from olist_customers_dataset
group by customer_city
having count(*) > 1;

--customer_state
select
customer_state, count(*)
from olist_customers_dataset
group by customer_state
having count(*) > 1;

--=============================================================
/* Duplikasi olist_order_items_dataset */
--order_id
select
order_id, count(*)
from olist_order_items_dataset
group by order_id 
having count(*) > 1

--order_item_id
select
order_item_id, count(*)
from olist_order_items_dataset
group by order_item_id
having count(*) > 1;

--seller_id
select
seller_id, count(*)
from olist_order_items_dataset
group by seller_id
having count(*) > 1;

--shipping_limit_date
select
shipping_limit_date, count(*)
from olist_order_items_dataset
group by shipping_limit_date
having count(*) > 1;

--price
select
price, count(*)
from olist_order_items_dataset
group by price
having count(*) > 1;

--freight_value
select
freight_value, count(*)
from olist_order_items_dataset
group by freight_value
having count(*) > 1;

--=============================================================
/* Duplikasi olist_order_payments_dataset */
--order_id
select
order_id, count(*)
from olist_order_payments_dataset
group by order_id 
having count(*) > 1;

--payment_sequential
select
payment_sequential, count(*)
from olist_order_payments_dataset
group by payment_sequential
having count(*) > 1;

--payment_type
select
payment_type, count(*)
from olist_order_payments_dataset
group by payment_type
having count(*) > 1;

--payment_installments
select
payment_installments, count(*)
from olist_order_payments_dataset
group by payment_installments
having count(*) > 1;

--payment_value
select
payment_value, count(*)
from olist_order_payments_dataset
group by payment_value
having count(*) > 1;

--=============================================================
/*Mencari Duplikasi dari masing masing kolom*/
--=============================================================
/* Duplikasi olist_orders_dataset */
--order_id -----------------------------
select
order_id, count(*)
from olist_orders_dataset
group by order_id 
having count(*) > 1;

--customer_id
select
customer_id, count(*)
from olist_orders_dataset
group by customer_id
having count(*) > 1;

--order_status
select
order_status, count(*)
from olist_orders_dataset
group by order_status
having count(*) > 1;

--order_purchase_timestamp
select
order_purchase_timestamp, count(*)
from olist_orders_dataset
group by order_purchase_timestamp
having count(*) > 1;

--order_approved_at
select
order_approved_at, count(*)
from olist_orders_dataset
group by order_approved_at
having count(*) > 1;

--order_delivered_carrier_date
select
order_delivered_carrier_date, count(*)
from olist_orders_dataset
group by order_delivered_carrier_date
having count(*) > 1;

--order_delivered_customer_date
select
order_delivered_customer_date, count(*)
from olist_orders_dataset
group by order_delivered_customer_date
having count(*) > 1;

--order_estimated_delivery_date
select
order_estimated_delivery_date, count(*)
from olist_orders_dataset
group by order_estimated_delivery_date
having count(*) > 1;

--=============================================================
/* Duplikasi olist_products_dataset */
--product_id
select
product_id, count(*)
from olist_products_dataset
group by product_id
having count(*) > 1;

--product_category_name
select
product_category_name, count(*)
from olist_products_dataset
group by product_category_name
having count(*) > 1;

--product_name_lenght
select
product_name_lenght, count(*)
from olist_products_dataset
group by product_name_lenght
having count(*) > 1;

--product_photos_qty
select
product_photos_qty, count(*)
from olist_products_dataset
group by product_photos_qty
having count(*) > 1;

--product_weight_g
select
product_weight_g, count(*)
from olist_products_dataset
group by product_weight_g
having count(*) > 1;

--product_length_cm
select
product_length_cm, count(*)
from olist_products_dataset
group by product_length_cm
having count(*) > 1;

--product_height_cm
select
product_height_cm, count(*)
from olist_products_dataset
group by product_height_cm
having count(*) > 1;

--product_width_cm
select
product_width_cm, count(*)
from olist_products_dataset
group by product_width_cm
having count(*) > 1;
--=============================================================
/*Mencari duplikasi dalam satu table*/
--=============================================================
/* Duplikasi olist_customers_dataset */
with duplikat as (
select
(select count (*) from olist_customers_dataset) as Jumlah_seluruh,
(select count (*) from olist_customers_dataset) -
(select count (*) from (select distinct * from olist_customers_dataset)) as Jumlah_duplikat)
select Jumlah_duplikat, (Jumlah_duplikat / Jumlah_seluruh*100) as persen_duplikasi
from duplikat

/* Duplikasi olist_order_items_dataset */
with duplikat as (
select
(select count (*) from olist_order_items_dataset) as Jumlah_seluruh,
(select count (*) from olist_order_items_dataset) -
(select count (*) from (select distinct * from olist_order_items_dataset)) as Jumlah_duplikat)
select Jumlah_duplikat, (Jumlah_duplikat / Jumlah_seluruh*100) as persen_duplikasi
from duplikat

/* Duplikasi olist_order_payments_dataset */
with duplikat as (
select
(select count (*) from olist_order_payments_dataset) as Jumlah_seluruh,
(select count (*) from olist_order_payments_dataset) -
(select count (*) from (select distinct * from olist_order_payments_dataset)) as Jumlah_duplikat)
select Jumlah_duplikat, (Jumlah_duplikat / Jumlah_seluruh*100) as persen_duplikasi
from duplikat

/* Duplikasi olist_orders_dataset */
with duplikat as (
select
(select count (*) from olist_orders_dataset) as Jumlah_seluruh,
(select count (*) from olist_orders_dataset) -
(select count (*) from (select distinct * from olist_orders_dataset)) as Jumlah_duplikat)
select Jumlah_duplikat, (Jumlah_duplikat / Jumlah_seluruh*100) as persen_duplikasi
from duplikat

/* Duplikasi olist_products_dataset */
with duplikat as (
select
(select count (*) from olist_products_dataset) as Jumlah_seluruh,
(select count (*) from olist_products_dataset) -
(select count (*) from (select distinct * from olist_products_dataset)) as Jumlah_duplikat)
select Jumlah_duplikat, (Jumlah_duplikat / Jumlah_seluruh*100) as persen_duplikasi
from duplikat
--Setelah mencari Duplikasi di setiap data, bisa disimpulkan tidak terdapat data yang duplikasi

--=============================================================

--Outlier olist_customers_dataset
with stats as (
    select
        percentile_cont(0.25) within group (order by customer_zip_code_prefix) as q1,
        percentile_cont(0.75) within group (order by customer_zip_code_prefix) as q3
    from olist_customers_dataset
),
iqr_calc as(
select q1, q3, (q3 - q1) as iqr,
(q1 - 1.5 * (q3 - q1)) as lower_bound,
(q1 + 1.5 * (q3 - q1)) as upper_bound
from stats
)
SELECT d.*
FROM olist_customers_dataset d
CROSS JOIN iqr_calc
WHERE d.customer_zip_code_prefix < lower_bound
or d.customer_zip_code_prefix > upper_bound
--Terdapat Outleir pada data olist_customers_dataset

--=============================================================
--Outlier olist_order_items_dataset
with stats as (
    select
        percentile_cont(0.25) within group (order by price) as q1,
        percentile_cont(0.75) within group (order by price) as q3
    from olist_order_items_dataset
),
iqr_calc as(
select q1, q3, (q3 - q1) as iqr,
(q1 - 1.5 * (q3 - q1)) as lower_bound,
(q1 + 1.5 * (q3 - q1)) as upper_bound
from stats
)
SELECT d.*
FROM olist_order_items_dataset d
CROSS JOIN iqr_calc
WHERE d.price < lower_bound
or d.price > upper_bound
order by price desc
--Terdapat Outleir pada data olist_order_items_dataset

--=============================================================
--Outlier olist_order_payments_dataset
with stats as (
    select
        percentile_cont(0.25) within group (order by payment_value) as q1,
        percentile_cont(0.75) within group (order by payment_value) as q3
    from olist_order_payments_dataset
),
iqr_calc as(
select q1, q3, (q3 - q1) as iqr,
(q1 - 1.5 * (q3 - q1)) as lower_bound,
(q1 + 1.5 * (q3 - q1)) as upper_bound
from stats
)
SELECT d.*
FROM olist_order_payments_dataset d
CROSS JOIN iqr_calc
WHERE d.payment_value < lower_bound
or d.payment_value > upper_bound
order by payment_value desc
--Terdapat Outleir pada data olist_order_payments_dataset
--=============================================================
--Outlier olist_orders_dataset
with stats as (
    select
        percentile_cont(0.25) within group (order by order_id) as q1,
        percentile_cont(0.75) within group (order by order_id) as q3
    from olist_orders_dataset
),
iqr_calc as(
select q1, q3, (q3 - q1) as iqr,
(q1 - 1.5 * (q3 - q1)) as lower_bound,
(q1 + 1.5 * (q3 - q1)) as upper_bound
from stats
)
SELECT d.*
FROM olist_orders_dataset d
CROSS JOIN iqr_calc
WHERE d.order_id < lower_bound
or d.order_id > upper_bound
-- Pada data olist_orders_dataset ini tidak bisa mencari Outlier dikarenakan tipe datanya semuanya string.
--=============================================================
--olist_products_dataset
with stats as (
    select
        percentile_cont(0.25) within group (order by product_name_lenght) as q1,
        percentile_cont(0.75) within group (order by product_name_lenght) as q3
    from olist_products_dataset
),
iqr_calc as(
select q1, q3, (q3 - q1) as iqr,
(q1 - 1.5 * (q3 - q1)) as lower_bound,
(q1 + 1.5 * (q3 - q1)) as upper_bound
from stats
)
SELECT d.*
FROM olist_products_dataset d
CROSS JOIN iqr_calc
WHERE d.product_name_lenght < lower_bound
or d.product_name_lenght > upper_bound
--Terdapat Outleir pada data olist_products_dataset
--=========================================================================================


--Jumlah Pembelian di payment
select p.payment_type, count(p.payment_value) as Total_Pay, sum(p.payment_value) as Jumlah_pay
from olist_order_payments_dataset p
group by payment_type
order by total_pay desc, Jumlah_pay desc


/*Dashboard*/
--Menghitung Jumlah dan rata rata di table olist_order_items_dataset
create or replace view kpi_order_items as
select
count(distinct order_id) as total_orders,
sum(price) as total_price,
avg(price) as avg_price,
sum(freight_value) as total_freight_value,
avg(freight_value) as avg_freight_value
from olist_order_items_dataset ooid ;

-- Menghitung jumlah dan rata rata di table olist_order_payments_dataset
create or replace view kpi_order_payments as
select
count(distinct order_id) as total_orders,
sum(payment_installments) as total_installments,
avg(payment_installments) as avg_installments,
sum(payment_value) as total_payment_value,
avg(payment_value) as avg_payment_value
from olist_order_payments_dataset oopd ;

-- Menghitung jumlah dan rata rata pay di table olist_products_dataset
create or replace view kpi_product as
select
count(distinct product_id) as total_product,
sum(product_weight_g) as total_weight,
avg(product_weight_g) as avg_weight,
sum(product_length_cm) as total_length,
avg(product_length_cm) as avg_length
from olist_products_dataset opd

--Jumlah pembelian per tipe membayaran
create or replace view pay_per_payment_type as
select p.payment_type, count(o.price) as Total_Pay, sum(o.price) as Jumlah_pay
from olist_order_payments_dataset p
left join olist_order_items_dataset o on p.order_id = o.order_id
group by p.payment_type
order by total_pay desc, Jumlah_pay desc

--Jumlah pemberlian per kategori produk
create or replace view pay_per_product as
select p.product_category_name, count(o.price) as Total_Pay, sum(o.price) as Jumlah_pay
from olist_products_dataset p
left join olist_order_items_dataset o on p.product_id = o.product_id
group by p.product_category_name
order by total_pay desc, Jumlah_pay desc

--Jumlah pembelian per tipe membayaran di data order_payments_dataset saja
create or replace view pay_per_pay_type as
select p.payment_type, count(p.payment_value) as Total_Pay, sum(p.payment_value) as Jumlah_pay
from olist_order_payments_dataset p
group by payment_type
order by total_pay desc, Jumlah_pay desc

--Ranking penjualan
select p.payment_type, 
count(p.payment_value) as Total_Pay, 
sum(p.payment_value) as Jumlah_pay,
row_number() over (order by COUNT(p.payment_value) desc) as ranking
from olist_order_payments_dataset p
group by payment_type
order by total_pay desc, Jumlah_pay desc

--===========================================================
/*Insigt*/
--Setelah beberapa analisis bisa disimpulkan bahwa 
--kostumer lebih banyak membeli pada tipe barang cama_mesa_banho dan tipe pembayaran credit_card