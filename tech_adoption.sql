
USE Hospital_Data;
CREATE VIEW excel_state_adoption AS 
SELECT 
    State,
    COUNT(DISTINCT Facility_ID) AS Total_Hospitals,
    SUM(CASE WHEN Is_Tech_Hospital = "Y" THEN 1 ELSE 0 END) AS Tech_Hospitals_num,
-- Calculate Adoption % 
	ROUND(CAST(SUM(CASE WHEN Is_Tech_Hospital = "Y" THEN 1 ELSE 0 END) AS FLOAT) / 
	COUNT(DISTINCT Facility_ID) * 100, 1) AS Tech_Adoption_Rate
FROM Hospital_Data
GROUP BY State
ORDER BY Tech_Adoption_Rate DESC
;

SELECT * 
FROM excel_state_adoption;
