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

insert into photographic_equipment.mount_support (camera_mount_type, lens_mount_type) values
('SONY FE', 'SONY FE' ),
('SONY FE', 'SONY E' ),
('SONY E',  'SONY E');


--####################################################################################################################--
--## MANUFACTURES                                                                                                   ##--
--####################################################################################################################--

insert into photographic_equipment.manufacturers (manufacturer_nm, foundation_dt, country) values
('SONY',      '07-05-1946', 'Japan'      ),        --  , 'Japan',       ''
('Canon',     '10-08-1937', 'Japan'      ),        --  , 'Japan',       ''
('Fujifilm',  '20-01-1937', 'Japan'      ),        --  , 'Japan',       ''
('Nikon',     '25-07-1917', 'Japan'      ),        --  , 'Japan',       ''
('Olympus',   '12-10-1919', 'Japan'      ),        --  , 'Japan',       ''
('Panasonic', '13-03-1918', 'Japan'      ),        --  , 'Japan',       ''
('Leica',     NULL,         'Germany'    ),        --  , 'Germany',     ''
('Pentax',    '16-11-1919', 'Japan'      ),        --  , 'Japan',       ''
('Sigma',     '21-09-1961', 'Japan'      ),        --  , 'Japan',       ''
('Carl Zeiss','03-04-1846', 'Germany'    ),        --  , 'Germany',     ''
('Samyang',   '05-06-1972', 'South Korea');        --  , 'South Korea', ''


--####################################################################################################################--
--## CAMERAS                                                                                                        ##--
--####################################################################################################################--

insert into photographic_equipment.products (product_id, manufacturer, model_nm) values
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
(23, 'Canon',    '6D Mark II'     );

insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type) VALUES
(01, 'APS-C',     TRUE,  'SONY-E'          ),    -- SONY ALPHA NEX 6
(02, 'APS-C',     TRUE,  'SONY-E'          ),    -- SONY ALPHA 6000
(03, 'APS-C',     FALSE, 'SONY-E'          ),    -- SONY ALPHA NEX 5
(04, 'FULLFRAME', TRUE,  'SONY-FE'         ),    -- SONY ALPHA A7
(05, 'FULLFRAME', FALSE, 'CANON-EF'        ),    -- Canon EOS 6D
(06, 'FULLFRAME', true,  'CANON-EF'        ),    -- Canon EOS 5D Mark II
(07, 'FULLFRAME', true,  'CANON-EF'        ),    -- Canon EOS 5D Mark III
(08, 'APS-C',     true,  'CANON-EF-S'      ),    -- Canon EOS 1300D
(09, 'FULLFRAME', true,  'Nikon-F'         ),    -- Nikon D850
(10, 'APS-C',     true,  'Nikon-F'         ),    -- Nikon D3500
(11, 'APS-C',     true,  'Nikon-F'         ),    -- Nikon D3200
(12, 'APS-C',     true,  'Nikon-F'         ),    -- Nikon D3300
(13, 'APS-C',     true,  'Nikon-F'         ),    -- Nikon D3400
(14, 'APS-C',     true,  'Nikon-F'         ),    -- Nikon D7100
(15, 'FULLFRAME', true,  'Nikon-F'         ),    -- Nikon D800
(16, 'APS-C',     true,  'CANON-EF-S'      ),    -- Canon EOS 550D
(17, '4/3',       true,  'micro4/3'        ),    -- Olympus PEN E-PL1
(18, 'APS-C',     false, 'Fujifilm X Mount'),    -- FUJIFILM X-T3
(19, 'FULLFRAME', false, 'Leica L'         ),    -- Panasonic Lumix DC-S1R
(20, 'FULLFRAME', false, 'Nikon Z'         ),    -- Nikon Z6
(21, 'FULLFRAME', false, 'SONY-FE'         ),    -- Sony ALPHA A7 III
(22, 'FULLFRAME', false, 'SONY-FE'         ),    -- Sony ALPHA A9
(23, 'FULLFRAME', false, 'CANON-EF'        );    -- Canon EOS 6D Mark II

--####################################################################################################################--
--## LENSES                                                                                                         ##--
--####################################################################################################################--

insert into photographic_equipment.products (product_id, manufacturer, model_nm) values
(10001, 'Sigma', 'AF 16mm f/1.4 DC DN Contemporary'         ),
(10002, 'SONY' , '16-50mm f/3.5-5.6'                        ),
(10003, 'SONY' , '16mm f/2.8'                               ),
(10004, 'SONY' , 'FE 50mm f/2.8 Macro'                      ),
(10005, 'Canon', 'EF 50mm f/1.8 STM'                        ),
(10006, 'Canon', 'EF-S 55-250mm f/4-5.6 IS STM'             ),
(10007, 'Nikon', '50mm f/1.8G AF-S Nikkor'                  ),
(10008, 'Nikon', 'AF-S NIKKOR 180-400MM F/4E TC1.4 FL ED VR'),
(10009, 'SONY' , 'FE-16-35MM-f2.8-GM'                       );

insert into photographic_equipment.lenses (lens_id, lens_mount_type, min_focal_length, max_focal_length,
                                           min_aperture, max_aperture, diaphragm_blades_cnt, min_focusing_distance,
                                           filter_size, has_autofocus, has_stabilization)
VALUES
(10001, 'SONY-E',     16,  16,   16,  1.4,  9,  25,  67,   true, false),
(10002, 'SONY-E',     16,  50,   36,  3.5,  9,  25,  49,   true, true ),
(10003, 'SONY-E',     16,  16,   22,  2.8,  7,  24,  49,   true, false),
(10004, 'SONY-FE',    50,  50,   16,  2.8,  7,  16,  55,   true, true ),
(10005, 'CANON-EF-S', 50,  50,   22,  1.8,  7,  35,  49,   true, false),
(10006, 'CANON-EF-S', 55,  250,  32,  4,    7,  85,  58,   true, true ),
(10007, 'Nikon-F',    50,  50,   16,  1.8,  7,  45,  58,   true, false),
(10008, 'Nikon-F',    180, 400,  32,  4,    9,  200, 40.5, true, false),
(10009, 'SONY-FE',    16,  35,   22,  2.8,  11, 28,  82,   true, false);

--####################################################################################################################--
--## AWARDS TITLES                                                                                                  ##--
--####################################################################################################################--

insert into photographic_equipment.award_titles (title_id, award_title_txt, first_given_dt) values
(0, 'EISA ADVANCED CAMERA',             '01-01-2020'),
(1, 'EISA ADVANCED FULL-FRAME CAMERA',  '01-01-2020'),
(2, 'EISA CAMERA OF THE YEAR',          '01-01-1983'),
(3, 'EISA DSLR CAMERA',                 '01-01-2017'),
(4, 'TIPA BEST FULL-FRAME DSLR EXPERT', '19-04-2017');                                                                                                   ;

--####################################################################################################################--
--## AWARDS                                                                                                         ##--
--####################################################################################################################--

insert into photographic_equipment.awards (model_id, title_id, award_dt) values
(18, 0, '01-01-2020'),
(19, 1, '01-01-2020'),
(20, 2, '01-01-2020'),
(21, 2, '01-01-2019'),
(22, 2, '01-01-2018'),
(23, 3, '01-01-2019'),
(23, 3, '19-04-2018');

--####################################################################################################################--
--## PRODUCTION PERIODS                                                                                             ##--
--####################################################################################################################--

insert into photographic_equipment.production_periods (model_id, production_start_dt,
                                                       production_end_dt, factory_nm) values
(10001,'01-01-2019', '01-01-9999', 'SIGMA-Bandai-Machi'),
(   01,'01-01-2012', '01-01-2015', 'SONY-Thailand'),
(   02,'01-01-2000', '01-01-2001', 'SONY-Nagasaki'),    -- To be edited
(   03,'01-01-2000', '01-01-2001', 'SONY-Kagoshima'),   -- To be edited
(   04,'01-01-2000', '01-01-2001', 'SONY-Kummamoto');   -- To be edited
