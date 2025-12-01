SELECT 
    *
FROM 
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;
-- stjärnan funkar i cli


-- Left join
SELECT 
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM 
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;


-- Right join
SELECT 
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM 
    plants p
    RIGHT JOIN plant_care pc ON p.plant_id = pc.plant_id;


-- Full join
SELECT 
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM 
    plants p
    FULL JOIN plant_care pc ON p.plant_id = pc.plant_id;


-- Cross join
SELECT 
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM 
    plants p
    CROSS JOIN plant_care pc;


