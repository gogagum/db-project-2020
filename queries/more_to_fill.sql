--####################################################################################################################--
--## ADDING NEW PERIODS                                                                                             ##--
--####################################################################################################################--

--Cameras
insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm)
values
    (5, 17-09-2012, 31-12-2016, 'Canon-Japan'),
    (5, 01-01-2017, 01-01-9999, 'Canon-Germany'),
    (6, 17-09-2008, 31-12-2912, 'Canon-Japan'),
    (7, 02-03-2012, 31-12-2016, 'Canon-Japan'),
    (7, 01-01-2017, 01-01-9999, 'Canon-Germany'),
    (8, 26-02-2016, 31-03-2017, 'Canon-China'),
    (8, 01-04-2017, 04-05-2018, 'Canon-Japan'),
    (9, 25-07-2017, 31-12-2018, 'Nikon-Japan'),
    (9, 01-01-2019, 01-01-9999, 'Nikon-Wuxi-Jiangsu'),
    (10, 30-08-2018, 01-01-9999, 'Canon-Japan'),
    (11, 19-04-2012, 01-01-2014, 'Canon-Japan'),
    (12, 02-01-2014, 16-08-2016, 'Canon-Japan'),
    (13, 17-08-2016, 30-08-2018, 'Canon-Japan');

--Lenses
insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm)
values
    (10002, 01-01-2013, 31-12-2016, 'Sony-Kagoshima'),
    (10002, 01-01-2017, 01-01-9999, 'SONY-Thailand'),
    (10003, 01-01-2010, 01-01-9999, 'SONY-Thailand'),
    (10004, 01-01-2016, 01-01-9999, 'SONY-Nagasaki'),
    (10005, 12-05-2015, 01-01-9999, 'Canon-Japan'),
    (10006, 22-08-2013, 31-12-2015, 'Canon-Japan'),
    (10006, 01-01-2016, 01-01-9999, 'Canon-China'),
    (10007, 01-01-2011, 31-12-2017, 'Nikon-Wuxi-Jiangsu'),
    (10008, 10-01-2018, 01-01-9999, 'Nikon-Japan'),
    (10009, 01-01-2017, 01-01-9999, 'SONY-Kagoshima');
