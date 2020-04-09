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
--## CAMERAS                                                                                                        ##--
--####################################################################################################################--

insert into photographic_equipment.products (product_id, manufacturer, model_nm) values
(01, 'SONY',   'ALPHA NEX 6'    ),
(02, 'SONY',   'ALPHA 6000'     ),
(03, 'SONY',   'ALPHA NEX 5'    ),
(04, 'SONY',   'ALPHA A7'       ),
(05, 'Canon',  'EOS 6D'         ),
(06, 'Canon',  'EOS 5D Mark II' ),
(07, 'Canon',  'EOS 5D Mark III'),
(08, 'Canon',  'EOS 1300D'      ),
(09, 'Nikon',  'D850'           ),
(10, 'Nikon',  'D3500'          ),
(11, 'Nikon',  'D3200'          ),
(12, 'Nikon',  'D3300'          ),
(13, 'Nikon',  'D3400'          ),
(14, 'Nikon',  'D7100'          ),
(15, 'Nikon',  'D800'           ),
(16, 'Canon',  'EOS 550D'       ),
(17, 'Olympus','PEN E-PL1'      );

insert into photographic_equipment.cameras (camera_id, matrix_type, has_flashlight, mount_type) VALUES
(01, 'APS-C',     TRUE,  'SONY-E'   ),       -- SONY ALPHA NEX 6
(02, 'APS-C',     TRUE,  'SONY-E'   ),       -- SONY ALPHA 6000
(03, 'APS-C',     FALSE, 'SONY-E'   ),       -- SONY ALPHA NEX 5
(04, 'FULLFRAME', TRUE,  'SONY-FE'  ),       -- SONY ALPHA A7
(05, 'FULLFRAME', FALSE, 'CANON-EF' ),       -- Canon EOS 6D
(06, 'FULLFRAME', true, 'CANON-EF'  ),       -- Canon EOS 5D Mark II
(07, 'FULLFRAME', true, 'CANON-EF'  ),       -- Canon EOS 5D Mark III
(08, 'APS-C',     true, 'CANON-EF-S'),       -- Canon EOS 1300D
(09, 'FULLFRAME', true, 'Nikon-F'   ),       -- Nikon D850
(10, 'APS-C',     true, 'Nikon-F'   ),       -- Nikon D3500
(11, 'APS-C',     true, 'Nikon-F'   ),       -- Nikon D3200
(12, 'APS-C',     true, 'Nikon-F'   ),       -- Nikon D3300
(13, 'APS-C',     true, 'Nikon-F'   ),       -- Nikon D3400
(14, 'APS-C',     true, 'Nikon-F'   ),       -- Nikon D7100
(15, 'FULLFRAME', true, 'Nikon-F'   ),       -- Nikon D800
(16, 'APS-C',     true, 'CANON-EF-S'),       -- Canon EOS 550D
(17, 'Micro 4/3', true, 'micro4/3'  );       -- Olympus PEN E-PL1

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
(10009, 'Sony' , 'FE-16-35MM-f2.8-GM'                       );

insert into photographic_equipment.lenses (lens_id, lens_mount_type, focal_length, min_aperture, max_aperture,
                                           diaphragm_blades_cnt, min_focusing_distance, filter_size,
                                           has_autofocus, has_stabilization)
VALUES
(10001, 'SONY-E',     16,  16,  1.4,  9,  25, 67,   true, false),
(10002, 'SONY-E',     16,  36,  3.5,  9,  25, 49,   true, true ),
(10003, 'SONY-E',     16,  22,  2.8,  7,  24, 49,   true, false),
(10004, 'SONY-FE',    50,  16,  2.8,  7,  16, 55,   true, true ),
(10005, 'CANON-EF-S', 50,  22,  1.8,  7,  35, 49,   true, false),
(10006, 'CANON-EF-S', 55,  32,  4,    7,  85, 58,   true, true ),
(10007, 'Nikon-F',    50,  16,  1.8,  7,  45, 58,   true, false),
(10008, 'Nikon-F',    180, 32,  4,    9,  41, 40.5, true, false),
(10009, 'SONY-FE',    16,  22,  2.8,  -1, -1, 82,   true, false);

--####################################################################################################################--
--## MANUFACTURES                                                                                                   ##--
--####################################################################################################################--

insert into photographic_equipment.manufacturers (manufacturer_nm, foundation_dt) values
('SONY',      '07-05-1946'),        --  , 'Japan',       ''
('Canon',     '10-08-1937'),        --  , 'Japan',       ''
('Fujifilm',  '20-01-1937'),        --  , 'Japan',       ''
('Nikon',     '25-07-1917'),        --  , 'Japan',       ''
('Olympus',   '12-10-1919'),        --  , 'Japan',       ''
('Panasonic', '13-03-1918'),        --  , 'Japan',       ''
('Leica',     NULL        ),        --  , 'Germany',     ''
('Pentax',    '16-11-1919'),        --  , 'Japan',       ''
('Sigma',     '21-09-1961'),        --  , 'Japan',       ''
('Carl Zeiss','03-04-1846'),        --  , 'Germany',     ''
('Samyang',   '05-06-1972');        --  , 'South Korea', ''

--####################################################################################################################--
--## AWARDS TITLES                                                                                                  ##--
--####################################################################################################################--

insert into photographic_equipment.award_titles (title_id, award_title_txt, first_given_dt) values
(0, "", ''),
(1, "", ''),
(2, "", ''),
(3, "", '');

--####################################################################################################################--
--## AWARDS                                                                                                         ##--
--####################################################################################################################--

insert into photographic_equipment.awards (model_id, title_id, award_dt) values
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , '');

--####################################################################################################################--
--## PRODUCTION PERIODS                                                                                             ##--
--####################################################################################################################--

insert into photographic_equipment.production_periods (period_id, model_id, production_start_dt,
                                                       production_end_dt, factory_nm) values
(1, , '', '', ''),
(2, , '', '', ''),
(3, , '', '', ''),
(4, , '', '', ''),
(5, , '', '', '');