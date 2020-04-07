create schema photographic_equipment;

--##########################################################################
--############################ CREATING TABLES #############################
--##########################################################################

create table photographic_equipment.PRODUCTS
(
    product_id   integer primary key,
    manufacturer varchar(20) not null,
    model_nm     varchar(20) not null
);

create table photographic_equipment.MANUFACTURERS
(
  manufacturer_nm varchar(20) primary key,
  foundation_dt   date
);

create table photographic_equipment.AWARDS
(
  model_id integer NOT NULL,
  title_id integer NOT NULL,
  award_dt date
);

create table photographic_equipment.AWARD_TITLES
(
  title_id        integer NOT NULL,
  award_title_txt text    NOT NULL,
  first_given_dt  date
);

create table photographic_equipment.MATRIX_TYPE
(
    matrix_type_nm varchar(10) primary key,
    height         decimal(4, 2) not null,
    width          decimal(4, 2) not null
);
