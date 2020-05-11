--Пронаблюдаем, что на PK индексы уже есть.

SELECT *
FROM pg_indexes
WHERE schemaname='photographic_equipment';

--Индекс по фокусному расстояния для быстрого выбора длиннофокусных объективов.
CREATE INDEX on photographic_equipment.lenses(min_focal_length);

EXPLAIN (ANALYZE)
    SELECT *
    FROM photographic_equipment.lenses
    WHERE min_focal_length >= 180;

--Индекс по фокусному расстояния для быстрого выбора широкоугольных объективов.
CREATE INDEX on photographic_equipment.lenses(max_focal_length);

EXPLAIN (ANALYZE)
    SELECT *
    FROM photographic_equipment.lenses
    WHERE max_focal_length <= 16;

--Индекс для поиска камер когда-либо производимых в каком-то регионе.
--Подразумевается использование оператора like().
CREATE INDEX on photographic_equipment.production_periods(factory_nm);

EXPLAIN (ANALYZE)
    SELECT *
    FROM photographic_equipment.production_periods
    WHERE factory_nm like('%China%');