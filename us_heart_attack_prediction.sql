use heart_attack_ds;

--Find avg and group by age and and gender
select 
AVG(Cholesterol) as avg_cholestrol, 
AVG(BloodPressure) as avg_bp, 
ROUND(AVG(BMI),2) as avg_BMI, Age, Gender
from heart_attack_dataset
group by Age, Gender
order by age asc

--percentage of smokers
select
round(sum(cast(Smoker as float)) / count(Smoker) * 100, 2)
as Smoker_Percentage from heart_attack_dataset;

--percentage of diabetics
select
round(sum(cast(Diabetes as float)) / count(Diabetes) * 100, 2)
as Diabetes_Percentage from heart_attack_dataset;






