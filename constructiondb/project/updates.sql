USE constructiondb;

-- address

-- state (correct the spelling of mississippi)

UPDATE state AS s1
JOIN (
    SELECT state_id FROM state WHERE state_name = 'Misissippi'
) AS s2
ON s1.state_id = s2.state_id
SET s1.state_name = 'Mississippi';

-- city

-- zip code

-- company

-- insurance

-- insurance company

-- insurance type

-- project

-- template

-- task

-- subcontractor

-- subcontractor task

-- subcontractor address
UPDATE subcontractor_address
SET addr_end = '2024-7-10'
WHERE subcontractor_id = (
	SELECT subcontractor_id FROM subcontractor
    WHERE subcontractor_name = "Jim's Construction"
) AND address_id = (
	SELECT address_id FROM address AS a
    JOIN city AS c ON c.city_id = a.city_id
    JOIN state AS s ON s.state_id = s.state_id
    WHERE street_num = 980 
		AND street_name = "Construction Way"	
		AND unit_num = "56"
		AND city_name = "Madison"
        AND state_name = "Wisconsin"
);