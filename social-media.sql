create table social_media (
				student_id varchar(20) primary key,
				age int,
				gender varchar,
				academic_level varchar,
				primary_platform varchar,
				daily_usage_hours decimal,
				weekend_extra_hours decimal,
				device_type varchar,
				sleep_duration_hours decimal,
				sleep_quality_score int,
				late_night_usage varchar,
				social_comparison_frequency varchar,
				perceived_stress_score decimal,
				mental_health_index decimal,
				academic_performance_GPA decimal,
				overall_impact varchar
				
);

select* from social_media;

select 
	age, 
	count(*) 
	from social_media 
	group by age
	order by age ;

select
	primary_platform,
	count(*)
	from social_media
	group by primary_platform

select 
	daily_usage_hours,
	round(avg(academic_performance_GPA), 2) as avg_gpa
	from social_media
	group by daily_usage_hours
	order by daily_usage_hours;

select 
	gender,
	round(avg(sleep_duration_hours), 2) as avg_sleep
	from social_media
	group by gender;

select 
	round(avg(sleep_duration_hours),2) as famele_avg_sleep
	from social_media
	where gender='Female';



	
