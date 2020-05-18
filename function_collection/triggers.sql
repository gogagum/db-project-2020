--########
--## №1 ##
--########

--Функция для триггера
create or replace function photographic_equipment.delete_camera_() returns trigger as
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
--В добавок к удалению данных о камере удаляет все связанные с данной камерой записи
create trigger delete_camera after delete
    on photographic_equipment.cameras
for each ROW
    EXECUTE procedure photographic_equipment.delete_camera_();

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

--########
--## №2 ##
--########

--Функция к триггеру
create function photographic_equipment.check_awards_update_() returns trigger AS $$
BEGIN
    if NEW.award_dt < any (
        select min(PRODUCTION_PERIODS_.production_start_dt) as production_start_dt
        from
             photographic_equipment.PRODUCTS as PRODUCTS_
                 left join
             photographic_equipment.PRODUCTION_PERIODS as PRODUCTION_PERIODS_
             on PRODUCTS_.product_id = PRODUCTION_PERIODS_.model_id
        where PRODUCTS_.product_id = NEW.model_id
    )
    then RAISE EXCEPTION 'award is given before the start_of_production';
    END IF;

    RETURN NEW;
END;
$$ language plpgsql;

--Сам триггер
create trigger check_awards_update
    before insert or update
    on photographic_equipment.Awards
    for each ROW
    execute procedure photographic_equipment.check_awards_update_();

--Проверка триггера
--Так как камера в тот момент ещё не производилась, то вставка не призойдёт
insert into photographic_equipment.Awards(model_id, title_id, award_dt)
values (00002, 1, '2007-09-01')
;