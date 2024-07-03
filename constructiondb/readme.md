# Group Project for SQL (itm-220)

Database designed for a large construction company to track their jobsites, companies, contractors, insurance, and other things.


# Project Timeline

Week 10 Items
[X] ERD
[X] Forward Engineer

Week 11
[ ] Inserts
[ ] Update Statements
[ ] Delete Statements
[ ] Forms (setup and user)
[ ] Picture of Successful Query
[ ] Presentation w/ CRUD


Week 12
[ ] Give presentation

## Example insert with Foreign Keys
```sql

INSERT INTO address (city_id, street_num, street_name, unit_num, zip_code_id, state_id) VALUES
	(
        (SELECT city_id FROM city WHERE city_name = "Middleton"),
        '121',
        'Blazing Trail Dr.',
        200,
        (SELECT zip_code_id FROM city WHERE zip_code = "83644"),
        (SELECT state_id FROM state WHERE state_name = "Idaho")
    )

```