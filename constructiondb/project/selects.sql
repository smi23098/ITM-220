-- Read select for Subcontractor

SELECT subcontractor_name, street_num, street_name, city_name, addr_start, addr_end 
FROM subcontractor_address AS sa
JOIN subcontractor AS s ON sa.subcontractor_id = s.subcontractor_id
JOIN address AS a ON a.address_id = sa.address_id
JOIN city AS c ON c.city_id = a.city_id;

-- Read Select Statement for Project

SELECT subcontractor_name, contract_cost, task_name, project_name, city_name, street_name, street_num
FROM subcontractor AS S
JOIN subcontractor_task AS ST ON S.subcontractor_id = ST.subcontractor_id
JOIN task AS T ON T.task_id = ST.task_id
JOIN project AS P ON P.project_id = T.project_id
JOIN address AS A ON A.address_id = P.address_id
JOIN city AS C ON C.city_id = A.city_id;