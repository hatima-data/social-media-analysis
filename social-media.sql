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

select 
	academic_level,
	count(*)
	from social_media
	group by academic_level;

select 
	academic_level,
	round(avg(daily_usage_hours), 2)  as avg_daily_hours,
	round(avg(weekend_extra_hours), 2) as avg_weekend_hours
	from social_media
	group by academic_level;

select 
	device_type,
	round(avg(sleep_duration_hours), 2) as avg_sleep,
	round(avg(mental_health_index), 2) as avg_mental_health
	from social_media
	group by device_type
	order by avg_sleep asc;

select 
	primary_platform,
	round(avg(perceived_stress_score), 2) as avg_stress
	from social_media
	group by primary_platform
	order by avg_stress desc;

SELECT 
    social_comparison_frequency,
    COUNT(*) AS student_count,
    ROUND(AVG(mental_health_index), 2) AS avg_mental_health,
    ROUND(AVG(perceived_stress_score), 2) AS avg_stress
	FROM social_media
	GROUP BY social_comparison_frequency
	ORDER BY avg_stress DESC;

SELECT 
    overall_impact,
    COUNT(*) AS total_students,
    ROUND(AVG(daily_usage_hours), 2) AS avg_usage,
    ROUND(AVG(sleep_duration_hours), 2) AS avg_sleep,
    ROUND(AVG(academic_performance_GPA), 2) AS avg_gpa
	FROM social_media
	GROUP BY overall_impact;

SELECT 
    late_night_usage,
    ROUND(AVG(sleep_duration_hours), 2) AS avg_sleep_hours,
    ROUND(AVG(sleep_quality_score), 2) AS avg_sleep_quality
	FROM social_media
	GROUP BY late_night_usage;


SELECT 
    CASE 
        WHEN academic_performance_GPA >= 3.5 THEN 'High Achiever (3.5+)'
        WHEN academic_performance_GPA >= 2.5 THEN 'Average (2.5-3.49)'
        ELSE 'Low Performer (<2.5)'
    END AS gpa_category,
    COUNT(*) AS student_count,
    ROUND(AVG(daily_usage_hours), 2) AS avg_daily_usage
	FROM social_media
	GROUP BY gpa_category
	ORDER BY avg_daily_usage DESC;

SELECT 
    CASE 
        WHEN daily_usage_hours < 3 THEN 'Light User (<3 hrs)'
        WHEN daily_usage_hours BETWEEN 3 AND 6 THEN 'Moderate User (3-6 hrs)'
        ELSE 'Heavy User (6+ hrs)'
    END AS usage_tier,
    COUNT(*) AS student_count,
    ROUND(AVG(academic_performance_GPA), 2) AS avg_gpa,
    ROUND(AVG(perceived_stress_score), 2) AS avg_stress
	FROM social_media
	GROUP BY usage_tier
	ORDER BY avg_stress DESC;	


SELECT 
    CASE 
        WHEN sleep_duration_hours < 6 THEN 'Sleep Deprived (<6 hrs)'
        WHEN sleep_duration_hours BETWEEN 6 AND 8 THEN 'Healthy Sleep (6-8 hrs)'
        ELSE 'Oversleeping (8+ hrs)'
    END AS sleep_category,
    COUNT(*) AS total_students,
    ROUND(AVG(mental_health_index), 2) AS avg_mental_health,
    ROUND(AVG(academic_performance_GPA), 2) AS avg_gpa
	FROM social_media
	GROUP BY sleep_category
	ORDER BY avg_mental_health DESC;


SELECT 
    CASE 
        WHEN weekend_extra_hours >= 2.0 THEN 'High Weekend Spike (2+ hrs)'
        ELSE 'Normal Weekend Usage (<2 hrs)'
    END AS weekend_behavior,
    late_night_usage,
    COUNT(*) AS student_count,
    ROUND(AVG(sleep_quality_score), 2) AS avg_sleep_quality
	FROM social_media
	GROUP BY weekend_behavior, late_night_usage
	ORDER BY weekend_behavior, avg_sleep_quality;


SELECT 
    primary_platform,
    gender,
    COUNT(*) AS student_count,
    ROUND(AVG(daily_usage_hours), 2) AS avg_hours,
    ROUND(AVG(perceived_stress_score), 2) AS avg_stress
	FROM social_media
	GROUP BY primary_platform, gender
	ORDER BY primary_platform, avg_hours DESC;

	
SELECT 
    overall_impact,
    COUNT(*) AS student_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage_share
	FROM social_media
	GROUP BY overall_impact
	ORDER BY student_count DESC;

SELECT 
    primary_platform,
    device_type,
    COUNT(*) AS high_stress_students
	FROM social_media
	WHERE perceived_stress_score > (SELECT AVG(perceived_stress_score) FROM social_media)
	GROUP BY primary_platform, device_type
	ORDER BY high_stress_students DESC
	LIMIT 5;

SELECT 
    CASE 
        WHEN age <= 18 THEN 'Teenagers (16-18)'
        ELSE 'Young Adults (19+)'
    END AS age_group,
    COUNT(*) AS total_students,
    ROUND(AVG(daily_usage_hours), 2) AS avg_usage,
    ROUND(AVG(sleep_duration_hours), 2) AS avg_sleep,
    ROUND(AVG(academic_performance_GPA), 2) AS avg_gpa
	FROM social_media
	GROUP BY age_group;


