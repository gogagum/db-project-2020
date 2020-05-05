--#1 Полное представление для камер
create view photographic_equipment.full_cameras(camera_id, manufacturer, camera_nm, matrix_type, mount_type)
as
    select distinct
        cameras.camera_id as     camera_id,
        products.manufacturer as manufacturer,
        products.model_nm as     camera_nm,
        cameras.matrix_type as   matrix_type,
        cameras.mount_type as    mount_type
    from
        photographic_equipment.cameras as cameras,
        photographic_equipment.products as products
    where
        cameras.camera_id = products.product_id
with cascaded check option;

select *
from photographic_equipment.full_cameras;

--#2 Полное представления для объективов
create view photographic_equipment.full_lenses(lens_id, manufacturer, model_nm, lens_mount_type,
                                               min_focal_length, max_focal_length, min_aperture, max_aperture,
                                               diaphragm_blades_cnt, min_focusing_distance, filter_size,
                                               has_autofocus, has_stabilization)
as
    select distinct
        lenses.lens_id as               lens_id,
        products.manufacturer           manufacturer,
        products.model_nm as            lens_nm,
        lenses.lens_mount_type as       lens_mount_type,
        lenses.min_focal_length as      min_focal_length,
        lenses.max_focal_length as      max_focal_length,
        lenses.min_aperture  as         min_aperture,
        lenses.max_aperture  as         max_aperture,
        lenses.diaphragm_blades_cnt as  diaphragm_blades_cnt,
        lenses.min_focusing_distance as min_focusing_distance,
        lenses.filter_size as           filter_size,
        lenses.has_autofocus as         has_autofocus,
        lenses.has_stabilization as     has_stabilisation
    from
        photographic_equipment.lenses as lenses,
        photographic_equipment.products as products
    where
        lenses.lens_id = products.product_id
with cascaded check option;

select * from photographic_equipment.full_lenses;

--#3 Полная информация о наградах
create view photographic_equipment.all_awards(full_product_nm, award_title_text, year)
as
    select
        concat(products.manufacturer, ' ', products.model_nm) as full_product_nm,
        award_titles.award_title_txt as                          award_title_txt,
        extract(year from awards.award_dt) as                    year
    from
        photographic_equipment.products     as products,
        photographic_equipment.awards       as awards,
        photographic_equipment.award_titles as award_titles
    where
        awards.model_id = products.product_id and
        awards.title_id = award_titles.title_id
    order by year
;

select *
from photographic_equipment.all_awards;

--#4 Типы матриц с рассчитанными для них физическими площадами матриц.
create view photographic_equipment.matrix_types_with_area(matrix_type_nm, width, height, area)
as
    select
        matrix_types.matrix_type_nm as              matrix_type_nm,
        matrix_types.width as                       width,
        matrix_types.height as                      height,
        matrix_types.width * matrix_types.height as area
    from
        photographic_equipment.matrix_types as matrix_types
;

select *
from photographic_equipment.matrix_types_with_area;


--#5 Скрывает название завода
create view photographic_equipment.production_periods_with_stars(model_id, factory_nm)
as
    select
        production_periods.model_id as                                     model_id,
        production_periods.production_start_dt as                          production_start_dt,
        production_periods.production_end_dt as                            production_end_dt,
        overlay(production_periods.factory_nm placing '*******' from 3) as factory_nm
    from
        photographic_equipment.production_periods as production_periods
;

--#6 Выбирает первое слово (принадлежность) названия завода
create view photographic_equipment.production_periods_with_stars(model_id, factory_nm)
as
    select
        production_periods.model_id as                                     model_id,
        production_periods.production_start_dt as                          production_start_dt,
        production_periods.production_end_dt as                            production_end_dt,
        substring(production_periods.factory_nm from 1 for position('-' in production_periods.factory_nm) - 1)
    from
        photographic_equipment.production_periods as production_periods
;
