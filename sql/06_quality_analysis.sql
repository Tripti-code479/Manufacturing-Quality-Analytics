SELECT
    Plant,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(SUM(Defect_Qty) / SUM(Production_Qty) * 100, 2) AS defect_rate_percent,
    SUM(Downtime_Min) AS downtime
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Plant
ORDER BY Plant;

SELECT
    Production_Line,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(SUM(Defect_Qty) / SUM(Production_Qty) * 100, 2) AS defect_rate_percent,
    SUM(Downtime_Min) AS downtime
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Production_Line
ORDER BY Production_Line;

SELECT
    Product,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(SUM(Defect_Qty) / SUM(Production_Qty) * 100, 2) AS defect_rate_percent,
    SUM(Downtime_Min) AS downtime
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Product
ORDER BY Product;

SELECT
    Shift,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    ROUND(SUM(Defect_Qty) / SUM(Production_Qty) * 100, 2) AS defect_rate_percent,
    SUM(Downtime_Min) AS downtime
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Shift
ORDER BY Shift;

SELECT
    Defect_Type,
    SUM(Defect_Qty) AS defect_count,
    ROUND(
        SUM(Defect_Qty) /
        (SELECT SUM(Defect_Qty)
         FROM manufacturing_quality.manufacturing_quality_data) * 100,
        2
    ) AS defect_percent
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY Defect_Type
ORDER BY defect_count DESC;

SELECT
    DATE_FORMAT(Inspection_Date, '%Y-%m') AS month,
    COUNT(*) AS inspections,
    SUM(Production_Qty) AS production,
    SUM(Defect_Qty) AS defects,
    SUM(Downtime_Min) AS downtime
FROM manufacturing_quality.manufacturing_quality_data
GROUP BY DATE_FORMAT(Inspection_Date, '%Y-%m')
ORDER BY month;