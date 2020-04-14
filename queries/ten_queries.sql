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

insert into temp_full_cameras (camera_id, manufacturer, model_nm, matrix_type, has_flashlight,
                               mount_type, production_start_dt, production_end_dt, factory_nm)
values
       (25, 'SONY',  'ALPHA A7II', 'FULLFRAME', false, 'SONY-FE',  '20-11-2014', '31-05-2015', 'SONY-Nagasaki'),
       (25, 'SONY',  'ALPHA A7II', 'FULLFRAME', false, 'SONY-FE',  '01-06-2015', '01-01-9999', 'SONY-Thailand'),
       (26, 'Canon', 'EOS 5D',     'FULLFRAME', false, 'CANON-EF', '22-08-2005', '16-09-2008', 'Canon-Nagasaki')
;

insert into photographic_equipment.products (product_id, manufacturer, model_nm) select distinct
source.camera_id, source.manufacturer, source.model_nm
from temp_full_cameras as source;

insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type) select distinct
source.camera_id, source.matrix_type, source.has_flashlight, source.mount_type
from temp_full_cameras as source;

insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm) select
source.camera_id, source.production_start_dt, source.production_end_dt, source.factory_nm
from temp_full_cameras as source;