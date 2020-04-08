create schema photographic_equipment;

--##########################################################################
--############################ CREATING TABLES #############################
--##########################################################################


create table photographic_equipment.MANUFACTURERS
(
  manufacturer_nm varchar(20) primary key,
  foundation_dt   date
);

create table photographic_equipment.PRODUCTS
(
    product_id   integer primary key,
    manufacturer varchar(20) not null references photographic_equipment.MANUFACTURERS,
    model_nm     varchar(20) not null
);

create table photographic_equipment.MOUNT_SUPPORT
(
    camera_mount_type varchar(10) not null,
    lens_mount_type   varchar(10) not null,
    PRIMARY KEY       (camera_mount_type, lens_mount_type)
);

create table photographic_equipment.AWARD_TITLES
(
  title_id        integer primary key ,
  award_title_txt text    not null,
  first_given_dt  date
);

create table photographic_equipment.AWARDS
(
  model_id integer NOT NULL references photographic_equipment.PRODUCTS,
  title_id integer NOT NULL references photographic_equipment.AWARD_TITLES,
  award_dt date
);

create table photographic_equipment.PRODUCTION_PERIODS
(
  period_id           integer primary key,
  model_id            integer NOT NULL    references photographic_equipment.PRODUCTS,
  production_start_dt date    NOT NULL,
  production_end_dt   date    check(production_end_dt > production_start_dt),
  factory_nm          varchar(10)
);

create table photographic_equipment.MATRIX_TYPES
(
  matrix_type_nm varchar(10) primary key,
  height         decimal(4, 2) not null,
  width          decimal(4, 2) not null
);

create  table photographic_equipment.CAMERAS
(
  camera_id      integer     primary key references photographic_equipment.PRODUCTS,
  matrix_type    varchar(10) not null    references photographic_equipment.MATRIX_TYPES,
  has_flashlight boolean     not null,
  mount_type     varchar(10) not null
);

create table photographic_equipment.LENSES
(
  lens_id               integer       primary key references photographic_equipment.PRODUCTS,
  lens_mount_type       varchar(10)   not null,
  focal_length          decimal(5, 2) not null    check (focal_length > 0),
  min_aperture          decimal(5, 2) not null    check (min_aperture > 0),
  max_aperture          decimal(5, 2) not null    check (max_aperture >= min_aperture),
  diaphragm_blades_cnt  integer       not null    check (diaphragm_blades_cnt >= 0),
  min_focusing_distance decimal(5, 2) not null    check (min_focusing_distance > 0),
  filter_size           decimal(4, 1) not null    check (filter_size > 0),
  has_autofocus         boolean       not null,
  has_stabilization     boolean       not null
);




drop schema photographic_equipment cascade;
