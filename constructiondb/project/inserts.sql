USE constructiondb;

-- Outer Tables

INSERT INTO state (state_name, state_code) VALUES
    ("Alabama", "AL"),
    ("Alaska", "AK"),
    ("Arizona", "AZ"),
    ("Arkansas", "AR"),
    ("California", "CA"),
    ("Colorado", "CO"),
    ("Connecticut", "CT"),
    ("Delaware", "DE"),
    ("Florida", "FL"),
    ("Georgia", "GA"),
    ("Idaho", "ID"),
    ("Hawaii", "HI"),
    ("Illinois", "IL"),
    ("Indiana", "IN"),
    ("Iowa", "IA"),
    ("Kansas", "KS"),
    ("Kentucky", "KY"),
    ("Louisiana", "LA"),
    ("Maine", "ME"),
    ("Maryland", "MD"),
    ("Massachusetts", "MA"),
    ("Michigan", "MI"),
    ("Minnesota", "MN"),
    ("Mississippi", "MS"),
    ("Missouri", "MO"),
    ("Montana", "MT"),
    ("Nebraska", "NE"),
    ("Nevada", "NV"),
    ("New Hampshire", "NH"),
    ("New Jersey", "NJ"),
    ("New Mexico", "NM"),
    ("New York", "NY"),
    ("North Carolina", "NC"),
    ("North Dakota", "ND"),
    ("Ohio", "OH"),
    ("Oklahoma", "OK"),
    ("Oregon", "OR"),
    ("Pennsylvania", "PA"),
    ("Rhode Island", "RI"),
    ("South Carolina", "SC"),
    ("South Dakota", "SD"),
    ("Tennessee", "TN"),
    ("Texas", "TX"),
    ("Utah", "UT"),
    ("Vermont", "VT"),
    ("Virginia", "VA"),
    ("Washington", "WA"),
    ("West Virginia", "WV"),
    ("Wisconsin", "WI"),
    ("Wyoming", "WY");



INSERT INTO city (city_name) VALUES
    ("Birmingham"),
    ("Schuamburg"),
    ("Middleton"),
    ("Boise"),
    ("Rexburg"),
    ("Salt Lake City"),
    ("Logan"),
    ("Honolulu"),
    ("Hilo"),
    ("Montgomery"),
    ("Juneau"),
    ("Phoenix"),
    ("Little Rock"),
    ("Los Angeles"),
    ("Denver"),
    ("Hartford"),
    ("Wilmington"),
    ("Miami"),
    ("Atlanta"),
    ("Chicago"),
    ("Indianapolis"),
    ("Des Moines"),
    ("Topeka"),
    ("Frankfort"),
    ("Baton Rouge"),
    ("Augusta"),
    ("Annapolis"),
    ("Boston"),
    ("Lansing"),
    ("St. Paul"),
    ("Jackson"),
    ("Jefferson City"),
    ("Helena"),
    ("Lincoln"),
    ("Carson City"),
    ("Concord"),
    ("Trenton"),
    ("Santa Fe"),
    ("Albany"),
    ("Raleigh"),
    ("Bismarck"),
    ("Columbus"),
    ("Oklahoma City"),
    ("Salem"),
    ("Harrisburg"),
    ("Providence"),
    ("Columbia"),
    ("Pierre"),
    ("Nashville"),
    ("Austin"),
    ("Montpelier"),
    ("Richmond"),
    ("Olympia"),
    ("Charleston"),
    ("Madison"),
    ("Cheyenne");



INSERT INTO zip_code (zip_code) VALUES
    ("60196"),   -- Schuamburg
    ("35242"),   -- Birmingham
    ("83644"),   -- Middleton
    ("83440"),   -- Rexburg
    ("96795"),   -- Honolulu
    ("96720"),   -- Hilo
    ("84044"),   -- Salt Lake City
    ("84321"),   -- Logan
    ("36101"),   -- Montgomery
    ("99801"),   -- Juneau
    ("85001"),   -- Phoenix
    ("72201"),   -- Little Rock
    ("90001"),   -- Los Angeles
    ("80201"),   -- Denver
    ("06101"),   -- Hartford
    ("19901"),   -- Wilmington
    ("33101"),   -- Miami
    ("30301"),   -- Atlanta
    ("60601"),   -- Chicago
    ("46201"),   -- Indianapolis
    ("50301"),   -- Des Moines
    ("66601"),   -- Topeka
    ("40601"),   -- Frankfort
    ("70801"),   -- Baton Rouge
    ("04330"),   -- Augusta
    ("21401"),   -- Annapolis
    ("02101"),	 -- Boston
    ("02116"),   -- Boston
    ("48901"),   -- Lansing
    ("55101"),   -- St. Paul
    ("39201"),   -- Jackson
    ("65101"),   -- Jefferson City
    ("59601"),   -- Helena
    ("68501"),   -- Lincoln
    ("89701"),   -- Carson City
    ("03301"),   -- Concord
    ("08601"),   -- Trenton
    ("87501"),   -- Santa Fe
    ("12201"),   -- Albany
    ("27601"),   -- Raleigh
    ("58501"),   -- Bismarck
    ("43201"),   -- Columbus
    ("73101"),   -- Oklahoma City
    ("97301"),   -- Salem
    ("17101"),   -- Harrisburg
    ("02901"),   -- Providence
    ("29201"),   -- Columbia
    ("57501"),   -- Pierre
    ("37201"),   -- Nashville
    ("78701"),   -- Austin
    ("05601"),   -- Montpelier
    ("23218"),   -- Richmond
    ("98501"),   -- Olympia
    ("25301"),   -- Charleston
    ("53701"),   -- Madison
    ("82001");   -- Cheyenne



INSERT INTO address (city_id, street_num, street_name, unit_num, zip_code_id, state_id) VALUES
    (
        (SELECT city_id FROM city WHERE city_name = "Boston"),
        '175',
        'Berkeley Street',
        '200',
        (SELECT zip_code_id FROM city WHERE zip_code = "02116"),
        (SELECT state_id FROM state WHERE state_name = "Massachusetts")
    ), 
    (
        (SELECT city_id FROM city WHERE city_name = "Birmingham"),
        '130',
        'Inverness Plaza',
        '273',
        (SELECT zip_code_id FROM city WHERE zip_code = "35242"),
        (SELECT state_id FROM state WHERE state_name = "Alabama")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Schuamburg"),
        '1299',
        'Zurich Way ZAIC',
        '100',
        (SELECT zip_code_id FROM city WHERE zip_code = "60196"),
        (SELECT state_id FROM state WHERE state_name = "Illinois")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Salem"),
        '12357',
        '10th Avenue',
        '546',
        (SELECT zip_code_id FROM city WHERE zip_code = "97301"),
        (SELECT state_id FROM state WHERE state_name = "Oregon")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Cheyenne"),
        '6798',
        '3rd Street',
        '78',
        (SELECT zip_code_id FROM city WHERE zip_code = "82001"),
        (SELECT state_id FROM state WHERE state_name = "Wyoming")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Oklahoma City"),
        '780',
        '10th Street',
        '23',
        (SELECT zip_code_id FROM city WHERE zip_code = "73101"),
        (SELECT state_id FROM state WHERE state_name = "Oklahoma")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Concord"),
        '345',
        'Insurance Ave',
        '12378',
        (SELECT zip_code_id FROM city WHERE zip_code = "03301"),
        (SELECT state_id FROM state WHERE state_name = "North Carolina")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Madison"),
        '980',
        'Construction Way',
        '56',
        (SELECT zip_code_id FROM city WHERE zip_code = "53701"),
        (SELECT state_id FROM state WHERE state_name = "Wisconsin")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Charleston"),
        '167',
        'Build Street',
        '45',
        (SELECT zip_code_id FROM city WHERE zip_code = "25301"),
        (SELECT state_id FROM state WHERE state_name = "West Virginia")
    ),
    (
        (SELECT city_id FROM city WHERE city_name = "Austin"),
        '897',
        'Money Way',
        '56',
        (SELECT zip_code_id FROM city WHERE zip_code = "78701"),
        (SELECT state_id FROM state WHERE state_name = "Texas")
    );



INSERT INTO insurance_company (company_name, address_id) VALUES
    ("Liberty Mutual",		(SELECT address_id FROM address WHERE street_num = "175" 	AND street_name = "Berkeley Street"	AND unit_num = "200")),
    ("CNA Insurance",   	(SELECT address_id FROM address WHERE street_num = "130" 	AND street_name = "Inverness Plaza" AND unit_num = "273")),
    ("Zurich North America",(SELECT address_id FROM address WHERE street_num = "1299" 	AND street_name = "Zurich Way ZAIC" AND unit_num = "100"));



INSERT INTO insurance_type(type_name) VALUES
    ("General Liability"),("Workers Liability"),("Property Insurance");



INSERT INTO subcontractor(name) VALUES
    ('Fazbear Construction'),('Diamond Planks'),("Joe's construction"),("Jim's construction");



INSERT INTO insurance (exp_date, subcontractor_id, insurance_company_id, insurance_type_id) VALUES
    (
        '2020-1-20',
        (SELECT subcontractor_id FROM subcontractor s WHERE s.name = 'Fazbear Construction'),
        (SELECT company_name FROM insurance_company ic WHERE ic.company_name = 'CNA Insurance'),
        (SELECT type_name FROM insurance_type i WHERE i.type_name = 'General Liability')
    ),
    (
        '2024-12-20',
        (SELECT subcontractor_id FROM subcontractor s WHERE s.name = 'Diamond Planks'),
        (SELECT company_name FROM insurance_company ic WHERE ic.company_name = 'Zurich North America'),
        (SELECT type_name FROM insurance_type i WHERE i.type_name = 'Property Insurance')
    ),
    (
        '2026-1-1',
        (SELECT subcontractor_id FROM subcontractor s WHERE s.name = "Joe's construction"),
        (SELECT company_name FROM insurance_company ic WHERE ic.company_name = 'Liberty Mutual'),
        (SELECT type_name FROM insurance_type i WHERE i.type_name = 'Workers Liability')
    ),
    (
        '2025-8-5',
        (SELECT subcontractor_id FROM subcontractor s WHERE s.name = "Jim's construction"),
        (SELECT company_name FROM insurance_company ic WHERE ic.company_name = 'Liberty Mutual'),
        (SELECT type_name FROM insurance_type i WHERE i.type_name = 'General Liability')
    );



INSERT INTO project(project_name, address_id, start_date, end_date) VALUES
    ("Smith Residence",      	(SELECT address_id FROM address WHERE street_num = "250" AND street_name = "1st Street"		AND unit_num = "500"),	"2024-01-01",	"2024-05-02"),
    ("Community Golf Course",	(SELECT address_id FROM address WHERE street_num = "500" AND street_name = "10th Street"	AND unit_num = "600"),	"2024-05-05",	"2024-07-10"),
    ("Smith Residence",      	(SELECT address_id FROM address WHERE street_num = "300" AND street_name = "15th Street"	AND unit_num = "800"),	"2024-02-02",	"2024-04-20");



INSERT INTO template(unit_cost, unit_name, description) VALUES
	(85.53, "3x7 door", "Three by seven foot door using red wood and a steel doorknob"),
    (381.32, "12x9 wall", "12x9 steel and red wood wall");



INSERT INTO task(task_name, template_id, project_id) VALUES
	("Smith residence front door",					(SELECT template_id FROM template WHERE unit_name = "3x7 door"),	(SELECT project_id FROM project)),
    ("Smith residence north entrance north wall",	(SELECT template_id FROM template WHERE unit_name = "12x9 wall"),	(SELECT project_id FROM project));



INSERT INTO subcontractor_task(subcontractor_id, task_id, contract_cost, estimated_cost) VALUES
	(
		(SELECT subcontractor_id FROM subcontractor WHERE name = "Fazbear Construction"),
        (SELECT task_id FROM task WHERE task_name = "Smith residence front door"),
        250.23,
        330.12
    ),
    (
		(SELECT subcontractor_id FROM subcontractor WHERE name = "Jim's construction"),
        (SELECT task_id FROM task WHERE task_name = "Smith residence north entrance north wall"),
        4809.89,
        5032.40
    ),
    (
		(SELECT subcontractor_id FROM subcontractor WHERE name = "Joe's construction"),
        (SELECT task_id FROM task WHERE task_name = "Smith residence north entrance north wall"),
        3800.00,
        6212.13
    );


-- need more addresses for this table to use.
-- INSERT INTO subcontractor_address(subcontractor_id, address_id, addr_start, addr_end) VALUES
-- 	(
-- 		(SELECT subcontractor_id FROM subcontractor WHERE name = "Joe's construction"),
--     ),
--     (
-- 		...
--     );
	