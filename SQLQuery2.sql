USE BikaShare_Data;
WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_Yr_1
    )
    select
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    CAST(riders AS FLOAT) * CAST(price AS FLOAT) AS revenue,
    (CAST(riders AS FLOAT) * CAST(price AS FLOAT)) - (CAST(COGS AS FLOAT)* Cast(riders AS FLOAT)) AS Profit
from cte a 
    left join Cost_Table b 
    on a.yr = b.yr