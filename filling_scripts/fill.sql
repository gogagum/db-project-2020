--####################################################################################################################--
--## MATRIX_TYPES                                                                                                   ##--
--####################################################################################################################--

insert into photographic_equipment.matrix_types (matrix_type_nm, width, height) values
('APS-C',       23.6, 15.8),
('4/3',         17.3, 13.0),
('APS-H Canon', 28.1, 18.7),
('APS-H Leica', 27,   18  ),
('APS-C Canon', 22.3, 14.9),
('Foveon X3',   20.7, 13.8),
('1\,5\"',      18.7, 14  ),
('1\"',         13.2, 8.8 ),
('FULLFRAME',   35.9, 24);

--####################################################################################################################--
--## MOUNT_SUPPORT                                                                                                  ##--
--####################################################################################################################--

insert into photographic_equipment.mount_support (camera_mount_type, lens_mount_type)
values
       ('SONY FE', 'SONY FE' ),
       ('SONY FE', 'SONY E' ),
       ('SONY E',  'SONY E'),
       ('CANON-EF', 'CANON-EF'),
       ('CANON-EF-S', 'CANON-EF'),
       ('CANON-EF-S', 'CANON-EF-S'),
       ('Nikon-F', 'Nikon-F'),
       ('micro4/3', 'micro4/3')
;

--####################################################################################################################--
--## MANUFACTURES                                                                                                   ##--
--####################################################################################################################--

insert into photographic_equipment.manufacturers (manufacturer_nm, foundation_dt, country, founders_nms)
values
       ('SONY',      '07-05-1946', 'Japan',       'Masaru Ibuka &Akio Morita'),
       ('Canon',     '10-08-1937', 'Japan',       'Goro Yoshida, Saburo Uchida & Takeo Maeda'),
       ('Fujifilm',  '20-01-1937', 'Japan',       NULL),
       ('Nikon',     '25-07-1917', 'Japan',       NULL),
       ('Olympus',   '12-10-1919', 'Japan',       'Takeshi Yamashita'),
       ('Panasonic', '13-03-1918', 'Japan',       'Kōnosuke Matsushita'),
       ('Leica',     NULL,         'Germany',     'Ernst Leitz'),
       ('Pentax',    '16-11-1919', 'Japan',       NULL),
       ('Sigma',     '21-09-1961', 'Japan',       'Michihiro Yamaki'),
       ('Carl Zeiss','03-04-1846', 'Germany',     'Carl Zeiss'    ),
       ('Samyang',   '05-06-1972', 'South Korea', NULL)
;

insert into photographic_equipment.manufacturers (manufacturer_nm, foundation_dt, country, founders_nms)
values
       ('Lumix',     NULL,         'Japan',        NULL);



--####################################################################################################################--
--## CAMERAS                                                                                                        ##--
--####################################################################################################################--

insert into photographic_equipment.products (product_id, manufacturer, model_nm)
values
       (01, 'SONY',     'ALPHA NEX 6'    ),
       (02, 'SONY',     'ALPHA 6000'     ),
       (03, 'SONY',     'ALPHA NEX 5'    ),
       (04, 'SONY',     'ALPHA A7'       ),
       (05, 'Canon',    'EOS 6D'         ),
       (06, 'Canon',    'EOS 5D Mark II' ),
       (07, 'Canon',    'EOS 5D Mark III'),
       (08, 'Canon',    'EOS 1300D'      ),
       (09, 'Nikon',    'D850'           ),
       (10, 'Nikon',    'D3500'          ),
       (11, 'Nikon',    'D3200'          ),
       (12, 'Nikon',    'D3300'          ),
       (13, 'Nikon',    'D3400'          ),
       (14, 'Nikon',    'D7100'          ),
       (15, 'Nikon',    'D800'           ),
       (16, 'Canon',    'EOS 550D'       ),
       (17, 'Olympus',  'PEN E-PL1'      ),
       (18, 'Fujifilm', 'X-T3'           ),
       (19, 'Lumix',    'DC-S1R'         ),
       (20, 'Nikon',    'Z6'             ),
       (21, 'SONY',     'ALPHA A7 III'   ),
       (22, 'SONY',     'ALPHA A9'       ),
       (23, 'Canon',    '6D Mark II'     ),
       (24, 'Canon',    '5D Mark IV'     )
;

insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type)
values
       ( 1, 'APS-C',     TRUE,  'SONY-E'     ),    -- SONY ALPHA NEX 6
       ( 2, 'APS-C',     TRUE,  'SONY-E'     ),    -- SONY ALPHA 6000
       ( 3, 'APS-C',     FALSE, 'SONY-E'     ),    -- SONY ALPHA NEX 5
       ( 4, 'FULLFRAME', TRUE,  'SONY-FE'    ),    -- SONY ALPHA A7
       ( 5, 'FULLFRAME', FALSE, 'CANON-EF'   ),    -- Canon EOS 6D
       ( 6, 'FULLFRAME', TRUE,  'CANON-EF'   ),    -- Canon EOS 5D Mark II
       ( 7, 'FULLFRAME', TRUE,  'CANON-EF'   ),    -- Canon EOS 5D Mark III
       ( 8, 'APS-C',     TRUE,  'CANON-EF-S' ),    -- Canon EOS 1300D
       ( 9, 'FULLFRAME', TRUE,  'Nikon-F'    ),    -- Nikon D850
       (10, 'APS-C',     TRUE,  'Nikon-F'    ),    -- Nikon D3500
       (11, 'APS-C',     TRUE,  'Nikon-F'    ),    -- Nikon D3200
       (12, 'APS-C',     TRUE,  'Nikon-F'    ),    -- Nikon D3300
       (13, 'APS-C',     TRUE,  'Nikon-F'    ),    -- Nikon D3400
       (14, 'APS-C',     TRUE,  'Nikon-F'    ),    -- Nikon D7100
       (15, 'FULLFRAME', TRUE,  'Nikon-F'    ),    -- Nikon D800
       (16, 'APS-C',     TRUE,  'CANON-EF-S' ),    -- Canon EOS 550D
       (17, '4/3',       TRUE,  'micro4/3'   ),    -- Olympus PEN E-PL1
       (18, 'APS-C',     FALSE, 'X Mount'    ),    -- FUJIFILM X-T3
       (19, 'FULLFRAME', FALSE, 'Leica L'    ),    -- Panasonic Lumix DC-S1R
       (20, 'FULLFRAME', FALSE, 'Nikon Z'    ),    -- Nikon Z6
       (21, 'FULLFRAME', FALSE, 'SONY-FE'    ),    -- Sony ALPHA A7 III
       (22, 'FULLFRAME', FALSE, 'SONY-FE'    ),    -- Sony ALPHA A9
       (23, 'FULLFRAME', FALSE, 'CANON-EF'   ),    -- Canon EOS 6D Mark II
       (24, 'FULLFRAME', FALSE, 'CANON-EF'   )     -- Canon EOS 5D Mark IV
;

--####################################################################################################################--
--## LENSES                                                                                                         ##--
--####################################################################################################################--

insert into photographic_equipment.products (product_id, manufacturer, model_nm)
values
       (10001, 'Sigma', 'AF 16mm f/1.4 DC DN Contemporary'         ),
       (10002, 'SONY' , '16-50mm f/3.5-5.6'                        ),
       (10003, 'SONY' , '16mm f/2.8'                               ),
       (10004, 'SONY' , 'FE 50mm f/2.8 Macro'                      ),
       (10005, 'Canon', 'EF 50mm f/1.8 STM'                        ),
       (10006, 'Canon', 'EF-S 55-250mm f/4-5.6 IS STM'             ),
       (10007, 'Nikon', '50mm f/1.8G AF-S Nikkor'                  ),
       (10008, 'Nikon', 'AF-S NIKKOR 180-400MM F/4E TC1.4 FL ED VR'),
       (10009, 'SONY' , 'FE-16-35MM-f2.8-GM'                       )
;

insert into photographic_equipment.lenses (lens_id, lens_mount_type, min_focal_length, max_focal_length,
                                           min_aperture, max_aperture, diaphragm_blades_cnt, min_focusing_distance,
                                           filter_size, has_autofocus, has_stabilization)
values
       (10001, 'SONY-E',     16,  16,   16,  1.4,  9,  25,  67,   true, false),
       (10002, 'SONY-E',     16,  50,   36,  3.5,  9,  25,  49,   true, true ),
       (10003, 'SONY-E',     16,  16,   22,  2.8,  7,  24,  49,   true, false),
       (10004, 'SONY-FE',    50,  50,   16,  2.8,  7,  16,  55,   true, true ),
       (10005, 'CANON-EF-S', 50,  50,   22,  1.8,  7,  35,  49,   true, false),
       (10006, 'CANON-EF-S', 55,  250,  32,  4,    7,  85,  58,   true, true ),
       (10007, 'Nikon-F',    50,  50,   16,  1.8,  7,  45,  58,   true, false),
       (10008, 'Nikon-F',    180, 400,  32,  4,    9,  200, 40.5, true, false),
       (10009, 'SONY-FE',    16,  35,   22,  2.8,  11, 28,  82,   true, false)
;

--####################################################################################################################--
--## AWARDS TITLES                                                                                                  ##--
--####################################################################################################################--

insert into photographic_equipment.award_titles (title_id, award_title_txt, first_given_dt)
values
       (0, 'EISA ADVANCED CAMERA',             '01-01-2020'),
       (1, 'EISA ADVANCED FULL-FRAME CAMERA',  '01-01-2020'),
       (2, 'EISA CAMERA OF THE YEAR',          '01-01-1983'),
       (3, 'EISA DSLR CAMERA',                 '01-01-2017'),
       (4, 'TIPA BEST FULL-FRAME DSLR EXPERT', '19-04-2017')
;

--####################################################################################################################--
--## AWARDS                                                                                                         ##--
--####################################################################################################################--

insert into photographic_equipment.awards (model_id, title_id, award_dt)
values
       (18, 0, '01-01-2020'),
       (19, 1, '01-01-2020'),
       (20, 2, '01-01-2020'),
       (21, 2, '01-01-2019'),
       (22, 2, '01-01-2018'),
       (23, 3, '01-01-2019'),
       (23, 3, '19-04-2018'),
       (24, 3, '16-06-2017')
;

--####################################################################################################################--
--## PRODUCTION PERIODS                                                                                             ##--
--####################################################################################################################--

insert into photographic_equipment.production_periods (model_id, production_start_dt, production_end_dt, factory_nm)
values
       (10001,'01-01-2019', '01-01-9999', 'SIGMA-Bandai-Machi'),
       (    1,'01-01-2012', '01-01-2015', 'SONY-Thailand'     ),
       (    2,'12-01-2014', '30-06-2019', 'SONY-Nagasaki'     ),
       (    3,'30-06-2010', '30-06-2011', 'SONY-Kagoshima'    ),
       (    4,'16-10-2013', '06-11-2014', 'SONY-Kummamoto'    ),
       (    4,'07-11-2014', '31-12-2019', 'SONY-Thailand'     ),
       (   21,'26-03-2019', '01-01-9999', 'SONY-Thailand'     ),
       (   22,'26-02-2018', '01-01-9999', 'SONY-Kummamoto'    )
;
