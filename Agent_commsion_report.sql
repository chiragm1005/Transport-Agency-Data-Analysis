use mycompany;

SELECT 
    `branch name`,
    SUM(`fare` - `discount`) AS 'fare',
    SUM(`gst`) AS 'gst',
    SUM(
        CASE 
            WHEN `branch comm.` > (`fare` * 0.16) OR `branch comm.` = 0 THEN (`fare` * 0.15)
            ELSE `branch comm.`
        END 
    ) AS `branch comm.`
    
FROM route
WHERE 
    `branch name` NOT LIKE 'npt%' 
    AND 
    (
        `agent name` IN ('API-New Payal Travels', 'API-New Payal Travels_App', 'API-New Payal Travels_IOS App') 
        OR `agent name` NOT LIKE 'api%'
    )
GROUP BY 
    `branch name`
ORDER BY 
    `fare` DESC;
