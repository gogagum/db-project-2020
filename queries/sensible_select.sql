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
--Для каждого производителя нарастающее количество наград его продуктам (не понятно, как )



--c.i end

--#############################################################################

--c.ii begin

--c.ii end

--#############################################################################

--c.iii begin

--c.iii end

--#############################################################################

--c.iv begin

--c.iv end