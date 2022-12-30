-- DENTAL CASE STUDY SCENERIO

-- Scan through dataset
SELECT *
FROM public."Course_Challenge"
LIMIT 10

--1. Total number of Patients
WITH distinct_patients as
       (SELECT DISTINCT * 
		FROM public."Course_Challenge")
SELECT COUNT(*)
FROM distinct_patients
-- OR
SELECT COUNT (*)
FROM public."Course_Challenge"
-- RESULT = 99

--2. How many Male Patients
SELECT COUNT (*)
FROM public."Course_Challenge"
WHERE gender = 'M'
-- RESULT = 42 ; THUS 57 FEMALE PATIENTS

-- 3. NUMBER OF PEOPLE WHO FOLLOWED UP
SELECT COUNT (*)
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'Yes'
-- RESULT = 52 ; THUS 47 PEOPLE DIDN,T FOLLOW UP
-- OR
SELECT COUNT ("Follow_up_attended")as number_of_people, "Follow_up_attended"
FROM public."Course_Challenge"
group by 2
-- This gives you the result in tabular form

-- Calculate percentage of people who showed up
SELECT round((COUNT(case when 'Follow_up_attended' = 'Yes' then 1 else 0 end)*1.00)/
((count(case when 'Follow_up_attended' = 'No' then 1 else 0 end))+
(count(case when 'Follow_up_attended' = 'Yes' then 1 else 0 end))) *100,2) as perc_showed_up


--4. Check Cities of people who didn't follow up
SELECT "Parent_Id", "gender", "city", "Follow_up_attended"
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'No'
order by 2, 3

--5. Count how many of them are from Allison and how many are from Southern ute
With no_follow_up as (
SELECT "Parent_Id", "gender", "city", "Follow_up_attended"
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'No'
order by 2, 3
)
SELECT COUNT (*)
FROM no_follow_up
WHERE "city" = 'Allison'
-- RESULT = 37 PEOPLE FROM ALLISON; THUS 10 PEOPLE FROM SOUTHERN UTE

--6. Check of ages of people who didn't go for follow up
SELECT "Age", "city", "Follow_up_attended", count("Age") as age_group
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'No'
group by 1,2,3
order by 1,2

-- Seems more older people do not go for follow up, so lets see how many 
-- patients older than 65 do not go for follow up
SELECT Count(*)
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'No' and "Age" >= '65'
--RESULT = 39 Older citizens do not go for follow_up. 
-- Older citizens make up for 83% of people who don't turn up for follow up


--7. How many of this older citizens are not in a relationship
with older as (
SELECT *
FROM public."Course_Challenge"
WHERE "Follow_up_attended" = 'No' and "Age" >= '65'
)
SELECT Count(*)
FROM older
WHERE "Marital_status" IN ('Single','Divorced','Widowed')
--RESULT = of this selecetd group, 27 people are not in a relationship 

SELECT DISTINCT "Procdure"
FROM public."Course_Challenge"

-- Explore how many people didn't show up or did show up within these 5 procedures


-- For each procedure let's find out how many people came for follow-up and how many didn't 
SELECT DISTINCT "Procdure", "Follow_up_attended", COUNT("Follow_up_attended")
FROM public."Course_Challenge"
group by 1,2
order by 1
-- Most Procedures have a close range between those who showed up and those who didn't

