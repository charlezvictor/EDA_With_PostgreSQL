CREATE TABLE number_of_death_by_cases (
  entity varchar(50), 
  code varchar(3),
  year date, 
  number_of_execution int,
  Meningitis bigint,
	Alzheimers_disease bigint,
	Parkinson bigint,
	Nutritional_def bigint,
	Malaria bigint,
	Drowning bigint,
	Interpersonal_violence bigint,
	Maternal_disorder bigint,
	Hiv_Aids bigint,
	Drug_use bigint,
	Tuberculosis bigint,
	Cardiovascular_disease bigint,
	Lower_respiratory bigint,
	Neonatal_disorder bigint,
	Alcohol_use bigint,
	self bigint,
	Exposure_to_forces_of_nature bigint,
	Diarrheal bigint,
	Environmental_heat_and_cold_exposure bigint,
	Neoplasm bigint,
	Conflict_and_terrorsim bigint,
	Diabetes bigint,
	Chronic_kidney bigint,
	Poisoning bigint,
	protein bigint,
	Terrorism bigint,
	Road_injuries bigint,
	Chronic_respiratory_disease bigint,
	Cirrhosis bigint,
	Digestive_disease bigint,
	Fire_heat bigint,
	Acute_hepatitis bigint
	)
	
	
	
CREATE TABLE number_of_death_by_age_group (
  entity varchar(50), 
  code varchar(3),
  year date, 
  Deaths_above_70 bigint,
  Deaths_ages_50_to_69 bigint,
  Deaths_ages_15_to_49 bigint,
  Deaths_ages_5_to_14 bigint,
  Deaths_under_5 bigint
)

CREATE TABLE Medical_doctors_per_10000_population (
  Indicator_code varchar(50), 
  Indicator varchar(50),
  Parent_Location_code varchar(3),
  Parent_Location varchar(50),
  Three_Loaction_code varchar(3),
	Location varchar(50),
	Period date,
	Factnumber float,
	value float
)

CREATE TABLE ISO_country_and_continent_code (
  Continent_name varchar(50), 
  continent varchar(3),
  country_name varchar(64),
	Two_letter_code varchar(2),
	Three_letter_code varchar(3),
	Country_number int
)

CREATE TABLE World_Population (
  entity varchar(50), 
  code varchar(3),
  year date, 
  Population_estimates bigint
)