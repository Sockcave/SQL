CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 115, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 45, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

SELECT * FROM exercise_logs;

-- GROUP BY Example
SELECT type, SUM(calories) AS total_calories FROM exercise_logs GROUP BY type;

-- HAVING: Applies condition to grouped values, not individual ones.
SELECT type, SUM(calories) AS total_calories FROM exercise_logs 
GROUP BY type 
HAVING total_calories > 150;

-- Example: Query exercises logged at least twice.
SELECT type FROM exercise_logs GROUP BY type 
HAVING COUNT(*) >= 2;

-- Heartrate Examples
-- Max heartrate = (220- age)
-- Target heartrate zone = (50%-90% of max)

-- At age 30, what is the max heart rate?
SELECT COUNT(*) FROM exercise_logs WHERE heart_rate > (220-30);

-- Are heartrate logs in target zone?
SELECT COUNT(*) FROM exercise_logs WHERE 
heart_rate >= ROUND(0.5*(220-30))
AND 
heart_rate <= ROUND(0.9*(220-30));

-- CASE

-- Example: We want a column that signifies if each log hits the target.
SELECT type, heart_rate, 
    CASE 
        WHEN heart_rate > 220-30 THEN 'above max'
        WHEN heart_rate > ROUND(0.90*(220-30))
            THEN 'above target'
        WHEN heart_rate > ROUND(0.50*(220-30))
            THEN 'within target'
        ELSE 'below target'
    END AS 'hr_zone'
    FROM exercise_logs;

-- Example: Count up each 'hr_zone' case
SELECT COUNT(*), 
    CASE 
        WHEN heart_rate > 220-30 THEN 'above max' 
        WHEN heart_rate > ROUND(0.90*(220-30)) 
            THEN 'above target'
        WHEN heart_rate > ROUND(0.50*(220-30))
            THEN 'within target'
        ELSE 'below target'
    END AS 'hr_zone'
    FROM exercise_logs
GROUP BY hr_zone;