use heart_attack_ds;

select 
AVG(Cholesterol) as avg_cholestrol, 
AVG(BloodPressure) as avg_bp, 
ROUND(AVG(BMI),2) as avg_BMI, Age, Gender
from heart_attack_dataset
group by Age, Gender


