--№1
--Доступные продукты для указанной даты
create or replace function photographic_equipment.available_this_day(d date)
    returns table (product_name text) as
$$
BEGIN
return query (
    with full_periods as (
        select PRODUCTS_.product_id                                    as product_id,
               concat(PRODUCTS_.manufacturer, ' ', PRODUCTS_.model_nm) as full_nm,
               min(PRODUCTION_PERIODS_.production_start_dt)            as production_start_dt,
               max(PRODUCTION_PERIODS_.production_end_dt)              as production_end_dt
        from photographic_equipment.PRODUCTS as PRODUCTS_
                 left join
             photographic_equipment.PRODUCTION_PERIODS as PRODUCTION_PERIODS_
             on PRODUCTS_.product_id = PRODUCTION_PERIODS_.model_id
        group by product_id, full_nm
    )
    select full_periods.full_nm as fullname
    from full_periods
    where (full_periods.production_start_dt <= $1) and
          (full_periods.production_end_dt >= $1)
);
END
$$ language plpgsql;

--Пример использования
select photographic_equipment.available_this_day('06-06-2006');

drop function photographic_equipment.available_this_day;

--№2
--Считает диапазон углов для связки камера-объектив

CREATE TYPE photographic_equipment.angle_range AS (min_angle double precision, max_angle double precision);

create or replace function photographic_equipment.get_angle(camera_id int, lens_id int)
returns photographic_equipment.angle_range as
$$
DECLARE
    matrix_width decimal(4, 2);
    min_focal_length decimal(5, 2);
    max_focal_length decimal(5, 2);
    matrix_type varchar(10);
    angle_range photographic_equipment.angle_range;
BEGIN
   matrix_width := (
     select
         matrix_types.width
     from
         photographic_equipment.matrix_types as matrix_types
     where
         matrix_types.matrix_type_nm = (
           select cameras.matrix_type
           from photographic_equipment.cameras as cameras
           where cameras.camera_id = $1
         )
   );

   min_focal_length := (
     select lenses.min_focal_length
     from photographic_equipment.lenses as lenses
     where lenses.lens_id = $2
   );

   max_focal_length := (
     select lenses.max_focal_length
     from photographic_equipment.lenses as lenses
     where lenses.lens_id = $2
   );

   select 2 * atan(matrix_width/(2 * max_focal_length)), 2 * atan(matrix_width/(2 * min_focal_length))
   into angle_range.min_angle, angle_range.max_angle;

   return angle_range;
END
$$ language plpgsql

--Пример использования
select * from photographic_equipment.get_angle(1, 10001);

DROP FUNCTION  photographic_equipment.get_angle(camera_id int, lens_id int);

DROP TYPE photographic_equipment.angle_range;