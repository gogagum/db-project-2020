--a begin
--Для каждого производителя количество продуктов
select products.manufacturer,
       count(manufacturer)
from photographic_equipment.products as products,
     photographic_equipment.cameras  as cameras
where
     cameras.camera_id = products.product_id
group by products.manufacturer;
--a end

--#############################################################################

--b begin
--Камеры по количеству наград
with awards_count as (
    select cameras.camera_id as camera_id,
           count(*) as count
    from
        photographic_equipment.cameras as cameras,
        photographic_equipment.awards  as awards
    where
        cameras.camera_id = awards.model_id
    group by camera_id
    union
    select  cameras.camera_id,
            0
    from
        photographic_equipment.cameras as cameras,
        photographic_equipment.awards  as awards
    where
        cameras.camera_id not in (select model_id from photographic_equipment.awards)
)
select
       products.manufacturer,
       products.model_nm,
       awards_count.count
from
     photographic_equipment.cameras as cameras,
     photographic_equipment.products as products,
     awards_count
where
      awards_count.camera_id = cameras.camera_id and
      products.product_id = cameras.camera_id
order by awards_count.count desc;
--b end

--#############################################################################

--с.i begin
--Для каждой марки фотоаппарата посчитать количество камер с конкретными форматами матриц
select distinct
       products.manufacturer,
       cameras.matrix_type,
       count(cameras.camera_id) over (partition by products.manufacturer, cameras.matrix_type)
from photographic_equipment.products as products,
     photographic_equipment.cameras  as cameras
where
     cameras.camera_id = products.product_id
group by manufacturer, matrix_type, camera_id;
--c.i end

--#############################################################################

--c.ii begin
--Самая новая камера каздого производителя
--Не придумал order by без partition by
with total_production_periods as(
    select distinct
        products_.product_id as product_id,
        min(p_p.production_start_dt) over (partition by products_.product_id) as production_begin_dt,
        max(p_p.production_end_dt) over (partition by products_.product_id) as production_end_dt
    from
         photographic_equipment.cameras as cameras_,
         photographic_equipment.products as products_,
         photographic_equipment.production_periods as p_p
    where
        cameras_.camera_id = products_.product_id and
        p_p.model_id = products_.product_id
    group by products_.product_id, production_start_dt, production_end_dt
)
select distinct
    T.manufacturer,
    first_value(T.model_nm) over (partition by T.manufacturer order by T.production_begin_dt desc) as model_nm,
    first_value(T.production_begin_dt) over (partition by T.manufacturer order by T.production_begin_dt desc) as production_begin_dt
from (
        total_production_periods
        join
        photographic_equipment.products
        on products.product_id = total_production_periods.product_id
    ) as T
group by
    T.manufacturer, model_nm, production_begin_dt;
--c.ii end

--#############################################################################

--c.iii begin
--Для каждого производителя нарастающее количество наград его продуктам по годам
with awards_for_10_years as (
    with year_series as (
        select date_trunc('year', dd)::date as year
        from   generate_series (current_date - '1 decade'::interval, current_date, '1 year'::interval) as dd
    )
    select year_series.year as year,
           awards.model_id,
           count(awards.award_dt) as year_count
    from
        year_series,
        photographic_equipment.awards as awards
    where date_trunc('year', awards.award_dt) = year_series.year
    group by year_series.year, awards.model_id
    union
    select year_series.year as year,
           awards.model_id,
           0 as year_count
    from
        year_series,
        photographic_equipment.awards as awards,
        photographic_equipment.products as products
    where (year_series.year, products.product_id) not in (
        select
            date_trunc('year', awards_.award_dt)::date as award_year,
            awards_.model_id
        from
            photographic_equipment.awards as awards_
    )
    group by  year_series.year, awards.model_id
    order by model_id, year
)

select distinct
    products.manufacturer,
    sum(year_count) over (partition by products.manufacturer order by awards_for_10_years.year),
    awards_for_10_years.year as year
from
    photographic_equipment.products as products,
    awards_for_10_years
where awards_for_10_years.model_id = products.product_id
order by products.manufacturer, awards_for_10_years.year
--group by year
--c.iii end
