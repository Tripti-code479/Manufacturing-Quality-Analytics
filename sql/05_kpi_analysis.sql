SELECT 
    COUNT(*) AS total_inspections,
    SUM(Production_Qty) AS total_production,
    SUM(Defect_Qty) AS total_defects,
    SUM(Downtime_Min) AS total_downtime
FROM manufacturing_quality.manufacturing_quality_data;

SELECT
    ROUND(
        SUM(d.Defect_Qty) / SUM(d.Production_Qty) * 100,
        2
    ) AS defect_rate_percent,
    ROUND(
        (1 - SUM(d.Defect_Qty) / SUM(d.Production_Qty)) * 100,
        2
    ) AS quality_rate_percent
FROM manufacturing_quality.manufacturing_quality_data AS d;

SELECT
    ROUND(AVG(Cycle_Time_Sec), 2) AS average_cycle_time,
    ROUND(AVG(Temperature_C), 2) AS average_temperature,
    ROUND(AVG(Pressure_Bar), 2) AS average_pressure,
    ROUND(AVG(Vibration_mm_s), 2) AS average_vibration
FROM manufacturing_quality.manufacturing_quality_data;