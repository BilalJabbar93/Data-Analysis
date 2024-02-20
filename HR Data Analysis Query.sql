--create a join table
select * from Absenteeism_at_work a
left join Compensation b 
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number

--find the healthist
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 
and Body_mass_index < 25 and
Absenteeism_time_in_hours < (select AVG (Absenteeism_time_in_hours) from Absenteeism_at_work)

--Compensation Rates for Non_Smokers
Select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0

--Optimize the query 
select a.ID,
r.Reason,
CASE WHEN Month_of_Absence IN (12,1,2 ) Then 'Wnter'
     WHEN Month_of_Absence IN (3,4,5 ) Then 'Spring'
	 WHEN Month_of_Absence IN (6,7,8 ) Then 'Summer'
	 WHEN Month_of_Absence IN (9,10,11 ) Then 'Fall'
	 ELSE 'Unknow' END as Season_Names
from Absenteeism_at_work a
left join Compensation b 
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;