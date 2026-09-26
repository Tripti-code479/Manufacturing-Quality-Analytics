SELECT
    Production_Line,
    SUM(Defect_Qty) AS total_defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Production_Line
ORDER BY defect_rate_percent DESC;

SELECT
    Plant,
    Shift,
    COUNT(*) AS inspections,
    SUM(Defect_Qty) AS total_defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Plant, Shift
ORDER BY defect_rate_percent DESC;

SELECT
    Batch_ID,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Batch_ID
HAVING SUM(Production_Qty) > 0
ORDER BY defect_rate_percent DESC
LIMIT 10;

SELECT
    Plant,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent,
    RANK() OVER (
        ORDER BY SUM(Defect_Qty) / SUM(Production_Qty) DESC
    ) AS defect_rate_rank
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Plant;

SELECT
    Product,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent,
    RANK() OVER (
        ORDER BY SUM(Defect_Qty) / SUM(Production_Qty) DESC
    ) AS defect_rate_rank
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Product;

SELECT
    DATE_FORMAT(Inspection_Date, '%Y-%m') AS month,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY DATE_FORMAT(Inspection_Date, '%Y-%m')
ORDER BY defect_rate_percent DESC
LIMIT 5;

SELECT
    Production_Line,
    SUM(Downtime_Min) AS total_downtime,
    ROUND(AVG(Downtime_Min), 2) AS avg_downtime_per_inspection
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Production_Line
ORDER BY total_downtime DESC;

SELECT
    Inspection_Status,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(
        SUM(Defect_Qty) / SUM(Production_Qty) * 100,
        2
    ) AS defect_rate_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Inspection_Status
ORDER BY defect_rate_percent DESC;

SELECT
    Inspection_Status,
    ROUND(AVG(Temperature_C), 2) AS avg_temperature,
    ROUND(AVG(Pressure_Bar), 2) AS avg_pressure,
    ROUND(AVG(Vibration_mm_s), 2) AS avg_vibration
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Inspection_Status;

SELECT
    Inspection_ID,
    Temperature_Flag,
    Pressure_Flag,
    Vibration_Flag,
    Defect_Qty,
    Inspection_Status
FROM manufacturing_quality.manufacturing_quality_data
WHERE
    (Temperature_Flag = 'Investigate'
    AND Pressure_Flag = 'Investigate')
    OR
    (Temperature_Flag = 'Investigate'
    AND Vibration_Flag = 'Investigate')
    OR
    (Pressure_Flag = 'Investigate'
    AND Vibration_Flag = 'Investigate');

SELECT
    CASE
        WHEN Downtime_Min > 0 THEN 'With Downtime'
        ELSE 'No Downtime'
    END AS downtime_status,
    COUNT(*) AS inspections,
    SUM(Defect_Qty) AS total_defects,
    ROUND(AVG(Defect_Qty), 2) AS avg_defects_per_inspection
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY downtime_status;