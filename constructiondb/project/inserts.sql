USE constructiondb;

-- Outer Tables

INSERT INTO state (state_name, state_code) VALUES
	("Idaho", "ID"),
	("Hawaii", "HI"),
	("Utah", "UT");
    
INSERT INTO city (city_name) VALUES
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
	();