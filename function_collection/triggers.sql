create or replace function photographic_equipment.delete_camera_data_() returns trigger as
$$
BEGIN
  delete
  from photographic_equipment.PRODUCTION_PERIODS as PRODUCTION_PERIODS
  where PRODUCTION_PERIODS.model_id = OLD.camera_id;

  delete
  from photographic_equipment.AWARDS as AWARDS
  where AWARDS.model_id = OLD.camera_id;

  delete
  from photographic_equipment.PRODUCTS as PRODUCTS
  where PRODUCTS.product_id = OLD.camera_id;

  return OLD;
END;
$$ language plpgsql;


--Триггер
create trigger delete_camera after delete
    on photographic_equipment.cameras
for each ROW
    EXECUTE procedure photographic_equipment.delete_camera_data_();

--Если его надо удалить
drop trigger delete_camera on photographic_equipment.cameras;

--Проверка до вставки, после вставки, после триггера
select * from photographic_equipment.CAMERAS as CAMERAS
where CAMERAS.camera_id = 666;

select * from photographic_equipment.PRODUCTS as PRODUCTS
where PRODUCTS.product_id = 666;

select * from photographic_equipment.PRODUCTION_PERIODS as PRODUCTION_PERIODS
where PRODUCTION_PERIODS.model_id = 666;

--Вставка
insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type) values
(666, 'FULLFRAME', TRUE, '');

insert into photographic_equipment.products (product_id, manufacturer, model_nm) values
(666, 'Canon', 'NotCamera');

insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm) values
(666, '01-01-1954', '01-01-1955', 'Russia');

--Использование триггера
delete
from photographic_equipment.CAMERAS as CAMERAS
where CAMERAS.camera_id = 666;