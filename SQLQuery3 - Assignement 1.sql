/*ASSIGNMENT 1*/
select * from habitat;

/*ASSIGNMENT 2*/
select species_name from species where species_order = 3;

/*ASSIGNMENT 3*/
select nutrition_type from nutrition where nutrition_cost <= 600;

/*ASSIGNMENT 4*/
select 
	species_name 
	from species 
	inner join nutrition on species.species_nutrition=nutrition.nutrition_id
	where species_nutrition between 2202 and 2206;

/*ASSIGNMENT 5*/
select 
	species.species_name as [Species Name:], nutrition.nutrition_type as [Nutrition Type:]
	from species
	inner join nutrition on species.species_nutrition=nutrition.nutrition_id
;

/*ASSIGNMENT 6*/
select 
	specialist_fname, specialist_lname, specialist_contact, species_name
	from species
	inner join care on species_care=care_id
	inner join specialist on care_specialist=specialist_id
	where species_name='penguin'
;