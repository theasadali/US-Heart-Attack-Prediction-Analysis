use heart_attack_ds;

--Find avg and group by age and and gender
select 
avg(Cholesterol) as avg_cholestrol, 
avg(BloodPressure) as avg_bp, 
round(avg(BMI),2) as avg_BMI, Age, Gender
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
-- used Pearson's Correlation Cofficient (r)
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

--Query to heck if smokers have a higher probability of heart attacks than non-smokers
-- P (smokers | heart attack) = number of smokers with heart attack / total number of smokers
-- P (non-smokers | heart attack = number of non-smokers with heart attack / total number of smokers
select Smoker,
count(*) as total_people,
sum(cast(PreviousHeartAttack as float)) as total_heart_attacks,
sum(cast(PreviousHeartAttack as float)) * 100 / count(*) --checks the probability - group by clause seperates the smokers and non-smokers
from heart_attack_dataset
group by Smoker;

--Analyze the relationship between diabetes and heart attacks
select 
    (count(*) * sum(cast(Diabetes as float) * cast(PreviousHeartAttack as float)) - sum(cast(Diabetes as float)) * sum(cast(PreviousHeartAttack as float))) /
    (sqrt((count(*) * sum(cast(Diabetes as float) * cast(Diabetes as float)) - power(sum(cast(Diabetes as float)), 2)) * 
          (count(*) * sum(cast(PreviousHeartAttack as float) * cast(PreviousHeartAttack as float)) - power(sum(cast(PreviousHeartAttack as float)), 2)))) 
    as relation_Diabetes_and_HeartAttack
from heart_attack_dataset;
