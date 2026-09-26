SELECT 
    MIN(Inspection_Date) AS earliest_date,
    MAX(Inspection_Date) AS latest_date,
    COUNT(*) AS total_records
FROM manufacturing_quality.manufacturing_quality_data;

SELECT DISTINCT Plant
FROM manufacturing_quality.manufacturing_quality_data
ORDER BY Plant;

SELECT DISTINCT Production_Line
FROM manufacturing_quality.manufacturing_quality_data
ORDER BY Production_Line;

SELECT DISTINCT Product
FROM manufacturing_quality.manufacturing_quality_data
ORDER BY Product;

SELECT DISTINCT Shift
FROM manufacturing_quality.manufacturing_quality_data
ORDER BY Shift;

SELECT DISTINCT Defect_Type
FROM manufacturing_quality.manufacturing_quality_data
ORDER BY Defect_Type;

SELECT 
    Inspection_ID,
    COUNT(*) AS duplicate_count
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Inspection_ID
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS missing_operator_ids
FROM manufacturing_quality.manufacturing_quality_data
WHERE Operator_ID IS NULL
OR Operator_ID = '';

SELECT COUNT(*) AS missing_suppliers
FROM manufacturing_quality.manufacturing_quality_data
WHERE Supplier IS NULL
    OR Supplier = '';

SELECT COUNT(*) AS missing_defect_types
FROM manufacturing_quality.manufacturing_quality_data
WHERE Defect_Type IS NULL
    OR Defect_Type = '';

SELECT COUNT(*) AS missing_temperature
FROM manufacturing_quality.manufacturing_quality_data
WHERE Temperature_C IS NULL;

SELECT COUNT(*) AS missing_pressure
FROM manufacturing_quality.manufacturing_quality_data
WHERE Pressure_Bar IS NULL;

SELECT COUNT(*) AS missing_vibration
FROM manufacturing_quality.manufacturing_quality_data
WHERE Vibration_mm_s IS NULL;

SELECT COUNT(*) AS total_records
FROM manufacturing_quality.manufacturing_quality_data;