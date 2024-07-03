USE constructiondb;

-- Outer Tables

INSERT INTO state (state_name, state_code) VALUES
	("Idaho", "ID"),
	("Hawaii", "HI"),
	("Utah", "UT");
    
INSERT INTO city (city_name) VALUES
	("Middleton"),
    ("Boise"),
    ("Rexburg"),
    ("Salt Lake City"),
    ("Logan"),
    ("Honolulu"),
    ("Hilo");
    
INSERT INTO zip_code (zip_code) VALUES
	("83644"), -- Middleton
    ("83440"), -- Rexburg
	("96795"), -- Honolulu
    ("96720"), -- Hilo
    ("84044"), -- Salt Lake
    ("84321"); -- Logan
    
INSERT INTO address (city_id, street_num, street_name, unit_num, zip_code_id, state_id) VALUES
	(
        (SELECT city_id FROM city WHERE city_name = "Middleton"),
        '121',
        'Blazing Trail Dr.',
        200,
        (SELECT zip_code_id FROM city WHERE zip_code = "83644"),
        (SELECT state_id FROM state WHERE state_name = "Idaho")
    ), 
    ((SELECT city_id FROM city WHERE city_name = "Salt Lake"),
        '300',
        'North Temple',
        1230,
        (SELECT zip_code_id FROM city WHERE zip_code = "84044"),
        (SELECT state_id FROM state WHERE state_name = "Utah")
        ),
	((SELECT city_id FROM city WHERE city_name = "Rexburg"),
	'400',
	'2nd East',
	100,
	(SELECT zip_code_id FROM city WHERE zip_code = "83440"),
	(SELECT state_id FROM state WHERE state_name = "Idaho"));
    
    INSERT INTO insurance_company (insurance_company_id, company_name, address_id) VALUES
		(
        
        )
    
