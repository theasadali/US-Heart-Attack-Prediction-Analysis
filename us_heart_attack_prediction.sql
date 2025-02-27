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

--Query to find correlation between hypertension and heart-attack
select 
    (count(*) * sum(cast(Hypertension as float) * cast(PreviousHeartAttack as float)) - sum(cast(Hypertension as float)) * sum(cast(PreviousHeartAttack as float))) /
    (sqrt((count(*) * sum(cast(Hypertension as float) * cast(Hypertension as float)) - power(sum(cast(Hypertension as float)), 2)) * 
          (count(*) * sum(cast(PreviousHeartAttack as float) * cast(PreviousHeartAttack as float)) - power(sum(cast(PreviousHeartAttack as float)), 2)))) 
    as correlation
from heart_attack_dataset;

--Query to find top 5 age groups with the highest heart attack cases
select Age, sum(cast(PreviousHeartAttack as float)) as number_of_HA_cases
from heart_attack_dataset
where PreviousHeartAttack = 1
group by Age
order by number_of_HA_cases DESC