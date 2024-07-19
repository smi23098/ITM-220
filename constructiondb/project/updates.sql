USE constructiondb;

-- state (correct the spelling of mississippi)

UPDATE state AS s1
JOIN (
    SELECT state_id FROM state WHERE state_name = 'Misissippi'
) AS s2
ON s1.state_id = s2.state_id
SET s1.state_name = 'Mississippi';

-- Update Subcontractor Address to show they have moved their HQ

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


-- insurance company (name change)

UPDATE insurance_company AS ic1
JOIN (
	SELECT insurance_company_id FROM insurance_company 
	WHERE company_name = "Liberty Mutual" 
	AND address_id = (
		SELECT address_id FROM address AS a
		JOIN zip_code AS z ON a.zip_code_id = z.zip_code_id
		WHERE z.zip_code = "02116" 
		AND a.street_name = "Berkeley Street"
		AND a.street_num = 175
	)  
) AS ic2
ON ic1.insurance_company_id = ic2.insurance_company_id
SET company_name = "New Day Insurance";