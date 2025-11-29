-- 1. Identify where and when the crime happened
SELECT 
    room,
    found_time,
    description
FROM evidence
WHERE found_time BETWEEN '2025-10-15 20:55:00' AND '2025-10-15 21:05:00'
ORDER BY found_time;

-- 2. Analyze who accessed critical areas at the time
SELECT 
    k.employee_id,
    e.name,
    e.department,
    k.room,
    k.entry_time,
    k.exit_time
FROM keycard_logs k
JOIN employees e
    ON k.employee_id = e.employee_id
WHERE '2025-10-15 21:00:00' BETWEEN k.entry_time AND k.exit_time;

-- 3.Cross-check alibis with actual logs
SELECT
    a.employee_id,
    e.name,
    a.claim_time,
    a.claimed_location,
    k.room AS actual_location,
    k.entry_time,
    k.exit_time,
    CASE 
        WHEN k.room IS NOT NULL THEN 'Matched'
        ELSE 'Mismatch'
    END AS match_status
FROM alibis a
JOIN employees e 
    ON a.employee_id = e.employee_id
LEFT JOIN keycard_logs k
    ON a.employee_id = k.employee_id
    AND a.claim_time BETWEEN k.entry_time AND k.exit_time;
    
    
-- 4.  Investigate suspicious calls made around the time.
SELECT
    c.call_id,
    e.name as caller_name,
    e1.name as receiver_name,
    c.receiver_id,
    c.call_time,
    c.duration_sec
FROM calls c
JOIN employees e 
    ON c.caller_id = e.employee_id
join employees as e1
on c.receiver_id = e1.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:00:00' AND '2025-10-15 21:00:00';


-- 5. Match evidence with movements and claims
SELECT
    evi.room AS evidence_room,
    evi.found_time,
    evi.description,
    emp.name,
    k.entry_time,
    k.exit_time,
    a.claim_time,
a.claimed_location
FROM evidence evi
JOIN keycard_logs k
    ON evi.room = k.room
JOIN employees emp
    ON k.employee_id = emp.employee_id
left join alibis as a
on emp.employee_id = a.employee_id;


-- 6.Combine all findings to identify the killer.

WITH presence AS (
    SELECT
        k.employee_id,
        e.name,
        k.room,
        k.entry_time,
        DATE_ADD(k.exit_time, INTERVAL 5 MINUTE) AS extended_exit_time
    FROM keycard_logs k
    JOIN employees e
        ON k.employee_id = e.employee_id
),
crime_room AS (
    SELECT room, found_time
    FROM evidence
    WHERE found_time BETWEEN '2025-10-15 21:00:00' AND '2025-10-15 21:05:00'
),
suspects AS (
    SELECT DISTINCT
        p.employee_id ,
        p.name as killer,
        p.room,
        p.entry_time,
        p.extended_exit_time
    FROM presence p
    JOIN crime_room c
        ON p.room = c.room
        AND c.found_time BETWEEN p.entry_time AND p.extended_exit_time
)
SELECT killer
FROM suspects;
