SELECT subcontractor_name, street_num, street_name, city_name, addr_start, addr_end 
FROM subcontractor_address AS sa
JOIN subcontractor AS s ON sa.subcontractor_id = s.subcontractor_id
JOIN address AS a ON a.address_id = sa.address_id
JOIN city AS c ON c.city_id = a.city_id;