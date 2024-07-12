-- Delete for state table
DELETE FROM state
WHERE state_name IN ('Alabama', 'Alaska', 'Arizona');

-- Delete for city table
DELETE FROM city
WHERE city_name IN ('Birmingham', 'Schuamburg', 'Middleton', 'Boise', 'Rexburg');

-- Delete for zip code table
DELETE FROM zip_code
WHERE zip_code IN ('60196', '35242', '83644');

-- Delete for address table
DELETE FROM address
WHERE (city_id, street_num, street_name, unit_num, zip_code_id, state_id) IN (
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
    )
);

