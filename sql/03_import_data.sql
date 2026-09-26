SHOW TABLES FROM manufacturing_quality;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/Users/Tripti Sahu/Desktop/P/Manufacturing Quality Analytics/data/manufacturing_quality_cleaned.csv'
INTO TABLE manufacturing_quality.manufacturing_quality_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM manufacturing_quality.manufacturing_quality_data;

DESCRIBE manufacturing_quality.manufacturing_quality_data;
TRUNCATE TABLE manufacturing_quality.manufacturing_quality_data;

LOAD DATA LOCAL INFILE 'C:/Users/Tripti Sahu/Desktop/P/Manufacturing Quality Analytics/data/manufacturing_quality_cleaned.csv'
INTO TABLE manufacturing_quality.manufacturing_quality_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Inspection_ID,
    @Inspection_Date,
    Plant,
    Production_Line,
    Product,
    Shift,
    Machine_ID,
    Operator_ID,
    Batch_ID,
    Production_Qty,
    Defect_Qty,
    Defect_Type,
    Downtime_Min,
    Cycle_Time_Sec,
    Temperature_C,
    Pressure_Bar,
    Vibration_mm_s,
    Material_Batch,
    Supplier,
    Inspection_Status,
    Temperature_Flag,
    Pressure_Flag,
    Vibration_Flag
)
SET Inspection_Date = STR_TO_DATE(@Inspection_Date, '%d-%m-%Y %H:%i');