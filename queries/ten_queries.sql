create temporary table temp_full_cameras
(
  camera_id           integer     not null,
  manufacturer        varchar(20) not null,
  model_nm            varchar(50) not null,
  matrix_type         varchar(10) not null,
  has_flashlight      boolean     not null,
  mount_type          varchar(10) not null,
  production_start_dt date        NOT NULL,
  production_end_dt   date check (production_end_dt > production_start_dt),
  factory_nm          varchar(20)
);

--insert begin

-- temp, no number
insert into temp_full_cameras (camera_id, manufacturer, model_nm, matrix_type, has_flashlight,
                               mount_type, production_start_dt, production_end_dt, factory_nm)
values
       (25, 'SONY',  'ALPHA A7II', 'FULLFRAME', false, 'SONY-FE',  '20-11-2014', '31-05-2015', 'SONY-Nagasaki'),
       (25, 'SONY',  'ALPHA A7II', 'FULLFRAME', false, 'SONY-FE',  '01-06-2015', '01-01-9999', 'SONY-Thailand'),
       (26, 'Canon', 'EOS 5D',     'FULLFRAME', false, 'CANON-EF', '22-08-2005', '16-09-2008', 'Canon-Nagasaki')
;

--1.1
insert into photographic_equipment.products (product_id, manufacturer, model_nm) select distinct
source.camera_id, source.manufacturer, source.model_nm
from temp_full_cameras as source;

--1.2
insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type) select distinct
source.camera_id, source.matrix_type, source.has_flashlight, source.mount_type
from temp_full_cameras as source;

--1.3
insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm) select
source.camera_id, source.production_start_dt, source.production_end_dt, source.factory_nm
from temp_full_cameras as source;
--insert end

--update begin
--2.1
update photographic_equipment.mount_support
set camera_mount_type = 'SONY-E'
where photographic_equipment.mount_support.camera_mount_type = 'SONY E';

update photographic_equipment.mount_support
set lens_mount_type = 'SONY-E'
where photographic_equipment.mount_support.lens_mount_type = 'SONY E';

update photographic_equipment.mount_support
set camera_mount_type = 'SONY-FE'
where photographic_equipment.mount_support.camera_mount_type = 'SONY FE';

update photographic_equipment.mount_support
set lens_mount_type = 'SONY-FE'
where photographic_equipment.mount_support.lens_mount_type = 'SONY FE';


--2.2
--Пример простого исправления
update photographic_equipment.cameras
set has_flashlight = false
where photographic_equipment.cameras.camera_id in (4);
--update end

--select begin

--3.1
--Модели камер, площадь матриц которых >= площади матрицы APS-C
with minimum_matrix_size as(
    select *
    from photographic_equipment.matrix_types
    where photographic_equipment.matrix_types.matrix_type_nm = 'APS-C'
)
select *
from photographic_equipment.cameras,
     photographic_equipment.matrix_types
where true
      and photographic_equipment.matrix_types.matrix_type_nm = photographic_equipment.cameras.matrix_type
      and photographic_equipment.matrix_types.height * photographic_equipment.matrix_types.width >=
          (select height from minimum_matrix_size) * (select width from minimum_matrix_size);

select * from photographic_equipment.mount_support;

--3.2
--Названия производителей, которыми произвдились/производятся для каких-либо камер SONY
with mounts_set as(
    select ms.lens_mount_type
    from photographic_equipment.mount_support as ms,
         photographic_equipment.cameras as cameras,
         photographic_equipment.products as products_
    where true
          and products_.manufacturer = 'SONY'
          and products_.product_id = cameras.camera_id
          and ms.camera_mount_type = cameras.mount_type
)
select distinct products.manufacturer
from photographic_equipment.lenses as lenses,
     photographic_equipment.products as products
where true
      and lenses.lens_id = products.product_id
      and lenses.lens_mount_type in (select * from mounts_set);

--3.3
--Все производящиеся ныне камеры
select p.manufacturer, p.model_nm
from photographic_equipment.cameras            as cam,
     photographic_equipment.products           as p,
     photographic_equipment.production_periods as p_p
where true
      and p_p.model_id = p.product_id
      and p.product_id = cam.camera_id
      and p_p.production_end_dt >= CURRENT_DATE;

--select end

insert into photographic_equipment.manufacturers (manufacturer_nm, foundation_dt, founders_nms, country)
values
  ('ASUS', '01-01-1912', NULL, 'Republic of China');



--delete begin
--4.1
--Удаляет всех производителей, данных о камерах которых нет
delete from photographic_equipment.manufacturers
where manufacturer_nm not in (
        select manufacturer
        from photographic_equipment.products
      )
--delete end


-- CRUD - запросы

--| Буква | Значение | Соответствие ключевому слову |
--| C     | Create   | Insert                       |
--| R     | Read     | Select                       |
--| U     | Update   | Update                       |
--| D     | Delete   | Delete                       |