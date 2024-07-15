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

-- Delete for insurance_company
DELETE FROM insurance_company
WHERE 
    (company_name = "Liberty Mutual" AND address_id = (
        SELECT address_id FROM address 
        WHERE street_num = "175" AND street_name = "Berkeley Street" AND unit_num = "200"
    ))
    OR
    (company_name = "CNA Insurance" AND address_id = (
        SELECT address_id FROM address 
        WHERE street_num = "130" AND street_name = "Inverness Plaza" AND unit_num = "273"
    ))
    OR
    (company_name = "Zurich North America" AND address_id = (
        SELECT address_id FROM address 
        WHERE street_num = "1299" AND street_name = "Zurich Way ZAIC" AND unit_num = "100"
    ));

-- Delete for insurance_type
DELETE FROM insurance_type
WHERE type_name IN ("General Liability", "Workers Liability", "Property Insurance");

-- Delete for subcontractor
DELETE FROM subcontractor
WHERE subcontractor_name IN ('Fazbear Construction', 'Diamond Planks', 'Joe\'s construction', 'Jim\'s construction');

-- Delete for insurance 
DELETE FROM insurance
WHERE 
    (exp_date = '2020-1-20' AND
     subcontractor_id = (SELECT subcontractor_id FROM subcontractor s WHERE s.subcontractor_name = 'Fazbear Construction') AND
     insurance_company_id = (SELECT insurance_company_id FROM insurance_company ic WHERE ic.company_name = 'CNA Insurance') AND
     insurance_type_id = (SELECT insurance_type_id FROM insurance_type i WHERE i.type_name = 'General Liability'))
    OR
    (exp_date = '2024-12-20' AND
     subcontractor_id = (SELECT subcontractor_id FROM subcontractor s WHERE s.subcontractor_name = 'Diamond Planks') AND
     insurance_company_id = (SELECT insurance_company_id FROM insurance_company ic WHERE ic.company_name = 'Zurich North America') AND
     insurance_type_id = (SELECT insurance_type_id FROM insurance_type i WHERE i.type_name = 'Property Insurance'))
    OR
    (exp_date = '2026-1-1' AND
     subcontractor_id = (SELECT subcontractor_id FROM subcontractor s WHERE s.subcontractor_name = "Joe's construction") AND
     insurance_company_id = (SELECT insurance_company_id FROM insurance_company ic WHERE ic.company_name = 'Liberty Mutual') AND
     insurance_type_id = (SELECT insurance_type_id FROM insurance_type i WHERE i.type_name = 'Workers Liability'));
     
-- Delete for subcontractor_address
DELETE FROM subcontractor_address
WHERE EXISTS (
    SELECT 1
    FROM subcontractor s
    JOIN address a ON subcontractor_address.subcontractor_id = s.subcontractor_id AND subcontractor_address.address_id = a.address_id
    WHERE 
        (s.subcontractor_name = "Joe's construction" AND
         a.street_num = "897" AND a.street_name = "Money Way" AND a.unit_num = "56" AND
         subcontractor_address.addr_start = '2023-9-21' AND subcontractor_address.addr_end IS NULL)
        OR
        (s.subcontractor_name = "Jim's construction" AND
         a.street_num = "980" AND a.street_name = "Construction Way" AND a.unit_num = "56" AND
         subcontractor_address.addr_start = '2019-3-5' AND subcontractor_address.addr_end IS NULL)
        OR
        (s.subcontractor_name = "Diamond Planks" AND
         a.street_num = "167" AND a.street_name = "Build Street" AND a.unit_num = "45" AND
         subcontractor_address.addr_start = '2015-1-3' AND subcontractor_address.addr_end = '2021-4-29')
);

-- Delete for project
DELETE FROM project
WHERE EXISTS (
    SELECT 1
    FROM address a
    WHERE 
        (project.project_name = "Smith Residence" AND
         a.street_num = "12357" AND a.street_name = "10th Avenue" AND a.unit_num = "546" AND
         project.start_date = '2024-01-01' AND project.end_date = '2024-05-02' AND
         project.address_id = a.address_id)
    OR
        (project.project_name = "Community Golf Course" AND
         a.street_num = "780" AND a.street_name = "10th Street" AND a.unit_num = "23" AND
         project.start_date = '2024-05-05' AND project.end_date = '2024-07-10' AND
         project.address_id = a.address_id)
    OR
        (project.project_name = "Smith Residence" AND
         a.street_num = "6798" AND a.street_name = "3rd Street" AND a.unit_num = "78" AND
         project.start_date = '2024-02-02' AND project.end_date = '2024-04-20' AND
         project.address_id = a.address_id)
);

-- Delete for template
DELETE FROM template
WHERE 
    (unit_cost = 85.53 AND unit_name = '3x7 door' AND description = '3 by 7 ft red wood door with steel doorknob')
    OR
    (unit_cost = 381.32 AND unit_name = '12x9 wall' AND description = '12x9 steel and red wood wall')
    OR
    (unit_cost = 200.12 AND unit_name = '13x13 roof' AND description = '13x3 steel and rubber roof');


-- Delete for task
DELETE FROM task
WHERE
    (task_name = 'Smith residence front door' AND
     template_id = (SELECT template_id FROM template WHERE unit_name = '3x7 door') AND
     project_id = (SELECT project_id FROM project WHERE project_name = 'Smith Residence' AND start_date = '2024-01-01'))
    OR
    (task_name = 'Golf Course Administration Building Roof' AND
     template_id = (SELECT template_id FROM template WHERE unit_name = '13x13 roof') AND
     project_id = (SELECT project_id FROM project WHERE project_name = 'Community Golf Course' AND start_date = '2024-05-05'))
    OR
    (task_name = 'Smith residence north entrance north wall' AND
     template_id = (SELECT template_id FROM template WHERE unit_name = '12x9 wall') AND
     project_id = (SELECT project_id FROM project WHERE project_name = 'Smith Residence' AND start_date = '2024-02-02'));

-- Delete for subcontractor_task
DELETE FROM subcontractor_task
WHERE
    (subcontractor_id = (SELECT subcontractor_id FROM subcontractor WHERE subcontractor_name = "Fazbear Construction") AND
     task_id = (SELECT task_id FROM task WHERE task_name = "Smith residence front door"))
    OR
    (subcontractor_id = (SELECT subcontractor_id FROM subcontractor WHERE subcontractor_name = "Jim's construction") AND
     task_id = (SELECT task_id FROM task WHERE task_name = "Smith residence north entrance north wall"))
    OR
    (subcontractor_id = (SELECT subcontractor_id FROM subcontractor WHERE subcontractor_name = "Joe's construction") AND
     task_id = (SELECT task_id FROM task WHERE task_name = "Smith residence north entrance north wall"));

